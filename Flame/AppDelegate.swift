//
//  AppDelegate.swift
//  Flame
//
//  Created by Eamon Tracey.
//

import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var popover: NSPopover!
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let popover = NSPopover()
        popover.contentSize = NSSize(width: 125, height: 100)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: FlameView())
        self.popover = popover

        self.statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = self.statusBarItem.button {
            button.image = NSImage(systemSymbolName: "flame", accessibilityDescription: nil)
            button.action = #selector(togglePopover(_:))
            NotificationCenter.default.addObserver(self, selector: #selector(updateImage), name: .flameChanged, object: nil)
        }

    }

    @objc func togglePopover(_ sender: AnyObject?) {

        if let button = self.statusBarItem.button {
            if self.popover.isShown {
                self.popover.performClose(sender)
            } else {
                self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }

    }

    @objc func updateImage() {

        if let button = self.statusBarItem.button {
            button.image = .flameImage
        }

    }

}

extension NSImage {

    static var flameImage: NSImage? {
        NSImage(systemSymbolName: FlameManager.shared.isFlamed ? "flame.fill" : "flame", accessibilityDescription: nil)
    }

}

extension Notification.Name {

    static let flameChanged = Notification.Name("com.EamonTracey.Flame/flameChanged")

}
