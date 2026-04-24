//
//  File.swift
//  BetterProgress
//
//  Created by David Bureš - P on 25.04.2026.
//

import Foundation

public extension Progress
{
    /// Increment the progress by a set number
    func increment(
        bySetNumber setNumber: Double
    ) {
        let currentProgress: Int64 = self.completedUnitCount
        
        let proposedProgress: Int64 = currentProgress + Int64(setNumber)
        
        /// Check if the proposed progress goes over the set limit, and if so, clamp it down do the max progress
        guard proposedProgress <= self.totalUnitCount else
        {
            self.completedUnitCount = self.totalUnitCount
            
            return
        }
        
        self.completedUnitCount = proposedProgress
    }
}
