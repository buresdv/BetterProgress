//
//  File.swift
//  BetterProgress
//
//  Created by David Bureš - P on 25.04.2026.
//

import Foundation
import SwiftUI

public extension Progress
{
    /// Create a new Progress with the specified number of total items to track
    /// - Parameters:
    ///   - totalItems: How many total items will be in this ``Progress``
    ///   - aboveProgressBarText: Optional text to display above the progress bar
    ///   - underProgressBarText: Optional text to display under the progress bar
    convenience init(
        totalItems: Int,
        aboveProgressBarText: String.LocalizationValue? = nil,
        underProgressBarText: String.LocalizationValue? = nil
    ) {
        self.init(totalUnitCount: Int64(totalItems))
        
        if let aboveProgressBarText
        {
            self.localizedDescription = String(localized: aboveProgressBarText)
        }
        
        if let underProgressBarText
        {
            self.localizedAdditionalDescription = String(localized: underProgressBarText)
        }
        
        
    }
    
    /// Create a sub-Progress of another ``Progress``, with its own steps
    /// - Parameters:
    ///   - parent: The parent ``Progress``
    ///   - percentageOfParentToTakeUp: Expressed in percentage points, how much of the parent to take up
    ///   - totalItemsOfThisProgress: How many total items this child ``Progress`` to track
    ///   - aboveProgressBarText: Optional text to display above the progress bar
    ///   - underProgressBarText: Optional text to display under the progress bar
    convenience init(
        parent: Progress,
        percentageOfParentToTakeUp: Double,
        totalItemsOfThisProgress: Int,
        aboveProgressBarText: String.LocalizationValue? = nil,
        underProgressBarText: String.LocalizationValue? = nil
    ) {
        
        let totalItemsOfParent: Int64 = parent.totalUnitCount
        
        let calculatedItemsOfParentToTakeUp: Double = Double(totalItemsOfParent) * ( percentageOfParentToTakeUp / 100 )
        
        self.init(
            totalUnitCount: Int64(totalItemsOfThisProgress),
            parent: parent,
            pendingUnitCount: Int64(calculatedItemsOfParentToTakeUp),
        )
        
        if let aboveProgressBarText
        {
            self.localizedDescription = String(localized: aboveProgressBarText)
        }
        
        if let underProgressBarText
        {
            self.localizedAdditionalDescription = String(localized: underProgressBarText)
        }
    }
}
