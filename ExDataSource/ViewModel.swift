//
//  ViewModel.swift
//  ExDataSource
//
//  Created by 김종권 on 2023/05/25.
//

import RxSwift
import RxCocoa

enum State {
    case updateUI(itmes: [String])
}

final class ViewModel: ViewModelable {
    // MARK: State
    var dataSource = (0...10).map(String.init)
    
    // MARK: Output
    var output: RxSwift.Observable<State> {
        outputSubject
    }
    private var outputSubject = PublishSubject<State>()
    
    // MARK: Input
    func input(_ action: Action) {
        switch action {
        case .viewDidLoad:
            outputSubject.onNext(.updateUI(itmes: dataSource))
        }
    }
}
