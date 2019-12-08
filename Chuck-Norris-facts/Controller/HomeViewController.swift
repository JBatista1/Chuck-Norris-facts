//
//  HomeViewController.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 26/11/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit
import RxSwift
class HomeViewController: UIViewController {
    
    
    private let customView: Home
    
    private let disposeBag = DisposeBag()
    private var sessionProvider : ProviderProtocol
    private var seachText = ""
    private var alert: AlertsError?
    var tableDatasource: FactDatasource?
    
    private var facts = [Fact]()
    
    // MARK: - Init
    init(sessionProvider: ProviderProtocol) {
        self.sessionProvider = sessionProvider
        self.customView = Home()
        super.init(nibName: nil, bundle: nil)
        self.alert = AlertsError(controller: self)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    override func loadView() {
        view = customView
    }
    
    // MARK: - Setups
    private func setupNavigation() {
        title = "Chuck Norris Facts"
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(searchFact))
        navigationItem.rightBarButtonItem = addBarButtonItem
        navigationController?.view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView(with facts: [Fact]) {
        self.facts = facts
        DispatchQueue.main.async {
            self.tableDatasource = FactDatasource(items: facts, tableView: self.customView.factsTableView)
        }
    }
    
    @objc func searchFact(_ sender: UIBarButtonItem) {
        let search = SearchFactViewController()
        search.modalTransitionStyle = .crossDissolve
        search.modalPresentationStyle = .overFullScreen
        present(search, animated: true, completion: nil)
        search.textForSearch.subscribe(onNext: {[weak self] searchFact in
            self?.seachText = searchFact
            self!.fetchFact()
        }).disposed(by: disposeBag)
    }
    
    private func fetchFact() {
        sessionProvider.request(type: FactDTO.self, service: NetworkService.getTextSearch(FactDTO.self, self.seachText)) { response  in
            switch response {
            case let .success(result):
                self.facts = result.result
                self.setupTableView(with: self.facts)
            case let .failure(error):
                self.alert?.showAlertNetWorError(error: error)
            }
            
        }
    }
}
