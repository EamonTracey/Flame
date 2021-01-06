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
        Group {
            if flameManager.isFlamed {
                Button("Deflame") {
                    flameManager.deflame()
                }
            } else {
                Button("Flame") {
                    flameManager.flame()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}
