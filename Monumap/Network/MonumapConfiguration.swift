//
//  MonumapConfiguration.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation

open class MonumapConfiguration {
    open static let providerHost = "api-delivery.dev.piemapping.com"
    open static let providerPort : NSNumber? = nil
    open static let scheme = "https"

    open static let pathToAPIs = "/api"

    open static var providerURL : URL = composeBaseURL(pathToAPIs)
}
