//
//  ViewController.swift
//  ExDataSource
//
//  Created by 김종권 on 2023/05/24.
//

import UIKit
import RxCocoa
import RxSwift

enum Action {
    case viewDidLoad
}

protocol DataSourceable {
    var dataSource: [String] { get }
}

protocol ViewModelable: DataSourceable {
    var output: Observable<State> { get }
    
    func input(_ action: Action)
}

class ViewController: UIViewController {
    // MARK: UI
    private let tableView: UITableView = {
        let view = UITableView()
        view.allowsSelection = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.bounces = true
        view.showsVerticalScrollIndicator = true
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.estimatedRowHeight = 34
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Properties
    let viewModel: ViewModelable = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
    }
    
    private func configureUI() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    
    private func bind() {
        
    }
}
