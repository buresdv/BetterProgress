//
//  File.swift
//  BetterProgress
//
//  Created by David Bureš - P on 25.04.2026.
//

import Foundation

public extension Progress
{
    /// Increment the current progress by a percentage of the total
    func increment(
        byPercentage percentage: Double
    ) {
        let totalProgress: Double = Double(self.totalUnitCount)
        let currentProgress: Double = Double(self.completedUnitCount)
        
        let proposedProgress: Double = currentProgress + (totalProgress * (percentage / 100))
        
        guard proposedProgress <= totalProgress else
        {
            self.completedUnitCount = self.totalUnitCount
            
            return
        }
        
        self.completedUnitCount = Int64(proposedProgress)
    }
}
