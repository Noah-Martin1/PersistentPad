//
//  Service.swift
//  PersistentPad
//
//  Created by Noah Martin on 2/6/2026.
//

import Foundation
import AppKit
import UniformTypeIdentifiers

struct FileService {

    func pickOpenFile() -> URL? {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.plainText]

        return panel.runModal() == .OK ? panel.url : nil
    }

    func pickSaveFile() -> URL? {
        let panel = NSSavePanel()
        panel.allowedContentTypes = [.plainText]

        return panel.runModal() == .OK ? panel.url : nil
    }

    func load(from url: URL) -> String {
        (try? String(contentsOf: url, encoding: .utf8)) ?? ""
    }

    func save(_ text: String, to url: URL) {
        try? text.write(to: url, atomically: true, encoding: .utf8)
    }
}
