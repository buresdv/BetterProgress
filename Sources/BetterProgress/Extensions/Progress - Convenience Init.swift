//
//  File.swift
//  BetterProgress
//
//  Created by David Bureš - P on 25.04.2026.
//

import Foundation

public extension Progress
{
    /// Create a new Progress with the specified number of total items to track
    convenience init(
        totalItems: Int
    ) {
        self.init(totalUnitCount: Int64(totalItems))
    }
    
    /// Create a sub-Progress of another ``Progress``, with its own steps
    /// - Parameters:
    ///   - parent: The parent ``Progress``
    ///   - percentageOfParentToTakeUp: Expressed in percentage points, how much of the parent to take up
    ///   - totalItemsOfThisProgress: How many total items this child ``Progress`` to track
    convenience init(
        parent: Progress,
        percentageOfParentToTakeUp: Double,
        totalItemsOfThisProgress: Int
    ) {
        
        let totalItemsOfParent: Int64 = parent.totalUnitCount
        
        let calculatedItemsOfParentToTakeUp: Double = Double(totalItemsOfParent) * ( percentageOfParentToTakeUp / 100 )
        
        self.init(
            totalUnitCount: Int64(totalItemsOfThisProgress),
            parent: parent,
            pendingUnitCount: Int64(calculatedItemsOfParentToTakeUp)
        )
    }
}
