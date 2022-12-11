//
//  AppConfig.swift
//  20221211-KyleMcGinnis-NYCSchools
//
//  Created by Kyle McGinnis on 12/11/22.
//

import Foundation

public class AppConfig {

    // MARK: - Properties

    static let shared: AppConfig = AppConfig()
    
    private (set) var loggingLevel: LoggingLevel = .medium
    
    private (set) var baseURLString = "https://data.cityofnewyork.us"
    
    // MARK: - Lifecycle

    private init() {}
    
    // MARK: - API
    
    func setBaseURLString(to url: String){
        self.baseURLString = url
    }

}

