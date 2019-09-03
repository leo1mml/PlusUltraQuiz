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
    private var presenter: QuizPresenter
    
    init(dataService: DataService, presenter: QuizPresenter) {
        self.dataService = dataService
        self.presenter = presenter
    }
    
    func didEnter() {
        fetchData()
    }
    
    private func fetchData() {
        dataService.fetchData { result in
            switch result {
            case let .success(data):
                tryToPresentViewModel(from: data)
            case .failure(_):
                presenter.presentError()
            }
        }
    }
    
    func tryToPresentViewModel(from data: Data) {
        do {
            let viewModel = try getViewModel(from: data)
            presenter.present(viewModel: viewModel)
        } catch {
            debugPrint(error.localizedDescription)
            presenter.presentError()
        }
    }
    
    func getViewModel(from data: Data) throws -> QuizViewModel {
        if let viewModel = try? JSONDecoder().decode(QuizViewModel.self, from: data) {
            return viewModel
        }
        throw CustomDecodeError.NonCompatibleStruct
    }
}

