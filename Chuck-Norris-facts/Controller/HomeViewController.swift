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
    private var typeView = SetupViewInHome.initial
    private let disposeBag = DisposeBag()
    private var sessionProvider : ProviderProtocol
    private var alert: AlertsError?
    var tableDatasource: FactDatasource?
    
    var workItem : DispatchWorkItem?
    private var facts = [Fact]()
    
    // MARK: - Init
    init(sessionProvider: ProviderProtocol) {
        self.sessionProvider = sessionProvider
        self.customView = Home(frame: .zero)
        super.init(nibName: nil, bundle: nil)
        self.alert = AlertsError(controller: self)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        
    }
    
    override func loadView() {
        view = typeView.customView
    }
    @objc func appMovedToBackground() {
        
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
        DispatchQueue.main.async {
            self.tableDatasource = FactDatasource(items: facts, tableView: self.customView.factsTableView)
            self.tableDatasource?.sharingFact.subscribe(onNext: {[weak self] fact in
                self?.showSharingFact(fact: fact)
            }).disposed(by: self.disposeBag)
        }
    }
    
    @objc func searchFact(_ sender: UIBarButtonItem) {
        let search = SearchFactViewController()
        search.modalTransitionStyle = .crossDissolve
        search.modalPresentationStyle = .overFullScreen
        present(search, animated: true, completion: nil)
        search.textForSearch.subscribe(onNext: {[weak self] searchFact in
            self!.fetchFact(searchText: searchFact)
        }).disposed(by: disposeBag)
        
    }
    
    func showSharingFact(fact: String) {
        DispatchQueue.main.async {
            let activitityController = UIActivityViewController(activityItems: [fact], applicationActivities: nil)
            self.present(activitityController, animated: true)
        }
    }
    
    private func fetchFact(searchText: String) {
        sessionProvider.request(type: FactDTO.self, service: NetworkService.getTextSearch(FactDTO.self, searchText)) { response  in
            switch response {
            case let .success(result):
                DispatchQueue.main.async {
                    if result.result.count > 0 {
                        self.view = self.customView
                        self.setupTableView(with: result.result)
                    }else{
                        self.typeView = SetupViewInHome.noResult
                        self.view = self.typeView.customView
                    }
                }
                
            case let .failure(error):
                self.alert?.showAlertNetWorError(error: error)
            }
            
        }
    }
}
