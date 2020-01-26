//
//  SearchViewController.swift
//  Monumap
//
//  Created by Anas Ait Ali on 12/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import UIKit
import RxSwift

class SearchViewController: UIViewController {

    @IBOutlet weak var tableViewResults: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var viewModel: SearchViewModelType!
    var viewModelConstructor: SearchViewModelConstructorType!
    var shownData : Variable<[Monument]> = Variable([])

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = viewModelConstructor(self)

        self.shownData.value = viewModel.dataManager.monuments.value

        self.shownData
            .asObservable()
            .bind(to: tableViewResults.rx.items)(cellFactory)
            .disposed(by: disposeBag)

        self.searchBar
            .rx.text
            .orEmpty
            .debounce(0.2, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter {
                if !$0.isEmpty {
                    return true
                } else {
                    self.shownData.value = self.viewModel.dataManager.monuments.value
                    return false
                }
            }
            .subscribe(onNext: { query in
                let q = query.cleanForSearch()
                self.shownData.value = self.viewModel
                    .dataManager
                    .monuments
                    .value
                    .filter {
                        $0.site.cleanForSearch().index(of: q) != nil ||
                            $0.states?.cleanForSearch().index(of: q) != nil
                }
            })
            .disposed(by: disposeBag)

    }

    func cellFactory(_ tableView: UITableView, i: Int, monument: Monument) -> UITableViewCell {
        let cellIdentifier = "MonumentDefaultCell"
        let currentCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: IndexPath(item: i, section: 0)) as! MonumentTableViewCell

        currentCell.configure(monument: monument)

        return currentCell
    }

}

extension String {

    func cleanForSearch() -> String {
        return self
            .folding(options: [.diacriticInsensitive, .widthInsensitive, .caseInsensitive], locale: nil)
            .removeCharacters(from: " -_/\\'")
    }

    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
        let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
        return String(String.UnicodeScalarView(passed))
    }

    func removeCharacters(from: String) -> String {
        return removeCharacters(from: CharacterSet(charactersIn: from))
    }
}

extension String {
    func index(of pattern: String) -> Index? {
        // Cache the length of the search pattern because we're going to
        // use it a few times and it's expensive to calculate.
        let patternLength = pattern.count
        guard patternLength > 0, patternLength <= self.count else { return nil }

        // Make the skip table. This table determines how far we skip ahead
        // when a character from the pattern is found.
        var skipTable = [Character: Int]()
        for (i, c) in pattern.enumerated() {
            skipTable[c] = patternLength - i - 1
        }

        // This points at the last character in the pattern.
        let p = pattern.index(before: pattern.endIndex)
        let lastChar = pattern[p]

        // The pattern is scanned right-to-left, so skip ahead in the string by
        // the length of the pattern. (Minus 1 because startIndex already points
        // at the first character in the source string.)
        var i = index(startIndex, offsetBy: patternLength - 1)

        // This is a helper function that steps backwards through both strings
        // until we find a character that doesn’t match, or until we’ve reached
        // the beginning of the pattern.
        func backwards() -> Index? {
            var q = p
            var j = i
            while q > pattern.startIndex {
                j = index(before: j)
                q = index(before: q)
                if self[j] != pattern[q] { return nil }
            }
            return j
        }

        // The main loop. Keep going until the end of the string is reached.
        while i < endIndex {
            let c = self[i]

            // Does the current character match the last character from the pattern?
            if c == lastChar {

                // There is a possible match. Do a brute-force search backwards.
                if let k = backwards() { return k }

                // Ensure to jump at least one character (this is needed because the first
                // character is in the skipTable, and `skipTable[lastChar] = 0`)
                let jumpOffset = max(skipTable[c] ?? patternLength, 1)
                i = index(i, offsetBy: jumpOffset, limitedBy: endIndex) ?? endIndex
            } else {
                // The characters are not equal, so skip ahead. The amount to skip is
                // determined by the skip table. If the character is not present in the
                // pattern, we can skip ahead by the full pattern length. However, if
                // the character *is* present in the pattern, there may be a match up
                // ahead and we can't skip as far.
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        return nil
    }
}
