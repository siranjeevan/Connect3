//
//  File.swift
//  Connect3Backend
//
//  Created by Jeevith on 5/27/25.
//

import Foundation

public class Rules : Board {
    
    public var isDrawCheck : Bool = false
    public var runCount : Int = 1
    
    public func isDraw() -> Bool {
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "-" {
                    isDrawCheck = true
                    return true
                }
            }
            isDrawCheck = true
        }
        if !isDrawCheck {
            self.grid = Array(repeating: Array(repeating: "-", count: 7), count: 6)
        }
        return false
    }
    
    public func isWinCheck() -> Bool {
        
        self.runCount = 1
        
        //row Check
        for i in 0..<grid.count {
            for j in 0..<grid[i].count - 2 {
                if grid[i][j] == grid[i][j+1] && grid[i][j+1] == grid[i][j+2] && grid[i][j+2] != "-" {
                    return true
                }
            }
        }
        
        //colum check
        for j in 0..<grid[0].count {
            for i in 0..<grid.count - 2 {
                if grid[i][j] == grid[i+1][j] && grid[i+1][j] == grid[i+2][j] && grid[i+2][j] != "-" {
                    return true
                }
            }
        }
        
        for i in 2...5 {
            for j in 0..<runCount {
                if grid[i - j][j] == grid[i - 1 - j][j + 1] && grid[i - 1 - j][j + 1] == grid[i - 2 - j][j + 2] && grid[i - 2 - j][j + 2] != "-" {
                    return true
                }
            }
            self.runCount += 1
        }
       
        
        self.runCount = 4
         
         for i in 0...3 {
             for j in 0..<runCount {
         
                 if grid[i + j][grid.count - j] == grid[i + 1 + j][grid.count - 1 - j] && grid[i + 1 + j][grid.count - 1 - j] == grid[i + 2 + j][grid.count - 2 - j] && grid[i + 2 + j][grid.count - 2 - j] != "-" {
                     return true
                 }
             }
             self.runCount -= 1
         }
        
        return false
        
    }
    
}
