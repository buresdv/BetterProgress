//
//  File.swift
//  BetterProgress
//
//  Created by David Bureš - P on 25.04.2026.
//

import Foundation

public extension Progress
{
    /// Set the progress to a percentage of the total
    func set(toPercentage percentageOfTotal: Double)
    {
        guard percentageOfTotal <= 100 else
        {
            self.completedUnitCount = self.totalUnitCount
            
            return
        }
        
        let totalProgress: Double = Double(self.totalUnitCount)
        
        let proposedProgress: Double = totalProgress * (percentageOfTotal / 100)
        
        self.completedUnitCount = Int64(proposedProgress)
    }
}
