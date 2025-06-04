//
//  File.swift
//  Connect3Backend
//
//  Created by Jeevith on 5/27/25.
//

import Foundation

public class Board : player {
    
    public var grid: [[String]]
    public var validCheck : Bool = false
    public var gridRow : Int = 0
    
    public override init() {
        self.grid = Array(repeating: Array(repeating: "-", count: 7), count: 6)
    }
    
    public func boardDisplay(i : Int , j : Int) -> String {
        return grid[i][j]
    }
    
    public func newBoard() {
        self.grid = Array(repeating: Array(repeating: "-", count: 7), count: 6)
    }
    
    public func placeCoin(row: Int , coin : String) -> Bool {
            if validMove(row: row){
                for i in stride(from: 5, to: -1, by: -1){
                    if grid[i][row] == "-"{
                        validCheck = true
                        gridRow = i
                        break
                    }
                }
                
                if validCheck{
                    grid[gridRow][row] = coin
                    return true
                }
            }
            return false
    }
    
    
    public func validMove(row: Int) -> Bool {
        for i in 0..<grid.count {
            if grid[i][row] == "-" {
                return true
            }
        }
        return false
    }
}
