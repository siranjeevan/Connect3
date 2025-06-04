//
//  File.swift
//  Connect3Backend
//
//  Created by Jeevith on 5/27/25.
//

import Foundation

public class player {
    public var name: String = ""
    
    func player(name: String, score: Int) {
        self.name = name
    }
    
    public func getName() -> String
    {
        return name
    }
}
