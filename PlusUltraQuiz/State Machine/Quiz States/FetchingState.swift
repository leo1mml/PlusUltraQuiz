//
//  FetchingState.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import Foundation

final class FetchingState: State {
    
    private var dataService: DataService
    private var presenter: QuizPresentationLogic
    
    init(dataService: DataService, presenter: QuizPresentationLogic) {
        self.dataService = dataService
        self.presenter = presenter
    }
    
    func didEnter() {
        fetchData()
    }
    
    private func fetchData() {
        dataService.fetchData { [weak self] result in
            switch result {
            case let .success(data):
                self?.tryToPresentViewModel(from: data)
            case .failure(_):
                self?.presenter.presentError()
            }
        }
    }
    
    func tryToPresentViewModel(from data: Data) {
        do {
            let viewModel = try getViewModel(from: data)
            presenter.present(viewModel: viewModel)
        } catch {
            presenter.presentError()
        }
    }
    
    func getViewModel(from data: Data) throws -> QuizViewModel {
        if let challenge = try? JSONDecoder().decode(Challenge.self, from: data) {
            let viewModel = QuizViewModel(title: challenge.title, keywords: challenge.keywords)
            return viewModel
        }
        throw CustomDecodeError.NonCompatibleStruct
    }
}

