//
//  FlameManager.swift
//  Flame
//
//  Created by Eamon Tracey.
//

import IOKit.pwr_mgt
import SwiftUI

class FlameManager: ObservableObject {
    static let shared = FlameManager()
    @Published var isFlamed = false
    var assertionID: IOPMAssertionID = 0
    
    func flame() {
        IOPMAssertionCreateWithName(kIOPMAssertionTypeNoDisplaySleep as CFString, IOPMAssertionLevel(kIOPMAssertionLevelOn), "com.EamonTracey.Flame" as CFString, &assertionID)
        isFlamed = true
        NotificationCenter.default.post(.init(name: .flameChanged))
    }
    
    func deflame() {
        IOPMAssertionRelease(assertionID);
        isFlamed = false
        NotificationCenter.default.post(.init(name: .flameChanged))
    }
}
