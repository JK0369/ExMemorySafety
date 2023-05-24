//
//  ViewModel.swift
//  ExDataSource
//
//  Created by 김종권 on 2023/05/25.
//

import RxSwift
import RxCocoa

enum State {
    case updateUI
}

final class ViewModel: ViewModelable {
    // MARK: State
    var dataSource = [String]()
    
    // MARK: Output
    var output: RxSwift.Observable<State> {
        outputSubject
    }
    private var outputSubject = PublishSubject<State>()
    
    // MARK: Input
    func input(_ action: Action) {
        switch action {
        case .viewDidLoad:
            dataSource = (1...10).map(String.init)
            outputSubject.onNext(.updateUI)
        }
    }
}
