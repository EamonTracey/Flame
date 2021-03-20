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
            Button(action: { NSApp.terminate(nil) }, label: {
                Text("Quit")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}
