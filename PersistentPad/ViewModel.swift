//
//  ViewModel.swift
//  PersistentPad
//
//  Created by Noah Martin on 2/6/2026.
//

import Foundation
import Combine

final class EditorViewModel: ObservableObject {

    // MARK: - State UI watches this
    @Published var text: String = ""
    @Published var fileURL: URL?
    @Published var showStartup: Bool = true
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $text
            .dropFirst() // avoid saving first event - being "" (text init)
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.save()
            }
            .store(in: &cancellables)
    }


    // MARK: - Dependency
    private let fileService = FileService()

    // MARK: - Actions called by UI

    func openFile() {
        guard let url = fileService.pickOpenFile() else { return }

        fileURL = url
        text = fileService.load(from: url)
        showStartup = false
    }

    func newFile() {
        guard let url = fileService.pickSaveFile() else { return }

        fileURL = url
        text = ""
        save()

        showStartup = false
    }

    func save() {
        guard let url = fileURL else { return }
        fileService.save(text, to: url)
    }
    
}
