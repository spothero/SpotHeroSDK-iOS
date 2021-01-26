//
//  Bundle+Convenience.swift
//  
//
//  Created by Kyle Haptonstall on 1/26/21.
//

import Foundation

extension Bundle {

    static let searchMockFiles: Bundle = {
        let path = Bundle.module.path(forResource: "SearchMockFiles", ofType: "bundle")!
        return Bundle(path: path)!
    }()
    
}
