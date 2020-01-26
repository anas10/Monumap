//
//  MonumapConfiguration.swift
//  Monumap
//
//  Created by Anas Ait Ali on 19/03/2017.
//  Copyright © 2017 Anas Ait Ali. All rights reserved.
//

import Foundation

open class MonumapConfiguration {
    public static let providerHost = "api-delivery.dev.piemapping.com"
    public static let providerPort : Int? = nil
    public static let scheme = "https"

    public static let pathToAPIs = "/api"

    public static var providerURL : URL = composeBaseURL(pathToAPIs)
}
