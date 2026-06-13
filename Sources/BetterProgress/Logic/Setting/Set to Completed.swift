//
//  Set to Completed.swift
//  BetterProgress
//
//  Created by David Bureš - P on 13.06.2026.
//

import Foundation

public extension Progress
{
    /// Sets the progress to 100% - completed
    func setToCompleted()
    {
        self.completedUnitCount = self.totalUnitCount
    }
}
