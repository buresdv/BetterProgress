//
//  Set Progress Text.swift
//  BetterProgress
//
//  Created by David Bureš - P on 18.06.2026.
//

import Foundation
import SwiftUI

public enum TextTarget
{
    case aboveBar(String)
    case belowBar(String)
}

public extension Progress
{
    func setText(to textTarget: TextTarget)
    {
        switch textTarget
        {
        case .aboveBar(let aboveBarText):
            self.localizedDescription = aboveBarText
        case .belowBar(let belowBarText):
            self.localizedAdditionalDescription = belowBarText
        }
    }
}
