//
//  FlameView.swift
//  Flame
//
//  Created by Eamon Tracey.
//

import SwiftUI

struct FlameView: View {
    
    @StateObject var flameManager = FlameManager.sharedManager
    
    var body: some View {
        Group {
            if FlameManager.sharedManager.isFlamed {
                Button("Deflame") {
                    FlameManager.sharedManager.deflame()
                }
            } else {
                Button("Flame") {
                    FlameManager.sharedManager.flame()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}
