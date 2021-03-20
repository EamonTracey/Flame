//
//  FlameView.swift
//  Flame
//
//  Created by Eamon Tracey.
//

import SwiftUI

struct FlameView: View {
    @StateObject var flameManager = FlameManager.shared
    
    var body: some View {
        VStack {
            Button(flameManager.isFlamed ? "Deflame" : "Flame", action: flameManager.isFlamed ? flameManager.deflame : flameManager.flame)
            Button("Quit") {
                NSApp.terminate(nil)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}
