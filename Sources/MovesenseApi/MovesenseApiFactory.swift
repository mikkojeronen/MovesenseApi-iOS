//
//	MovesenseApiFactory.swift
//	MovesenseApi
//
//  Copyright © 2023 Canned Bit Ltd. All rights reserved.
//

import Foundation

// Factory for handling API construction && storage
public class MovesenseApiFactory {

    private static var apiInstance: MovesenseApi? = nil

    public static var sharedApiInstance: MovesenseApi {
        get {
            NSLog("MovesenseApiFactory::get sharedApiInstance")
            return apiInstance ?? injectApiOrDefault()
        }
    }

    public static func injectApiOrDefault(_ injectedApi: MovesenseApi? = nil) -> MovesenseApi {
        NSLog("MovesenseApiFactory::injectApi")

        // API already set, replace it with the injected one and return the old one
        if let currentApi = apiInstance {
            NSLog("MovesenseApiFactory::injectApi instance already exists.")

            if let injectedApi = injectedApi {
                let prevApi = currentApi
                apiInstance = injectedApi

                return prevApi
            }

            return currentApi
        }

        // There's no current API, use the injected one or create the default
        let newApi: MovesenseApi
        if let injectedApi = injectedApi {
            newApi = injectedApi
        } else {
            newApi = MovesenseApiConcrete()
        }

        apiInstance = newApi

        return newApi
    }
}
