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
    private var activityView : UIActivityIndicatorView
    private var typeView = SetupViewInHome.initial
    private let disposeBag = DisposeBag()
    private var sessionProvider : ProviderProtocol
    private var alert: AlertsError?
    var tableDatasource: FactDatasource?
    
    // MARK: - Init
    init(sessionProvider: ProviderProtocol) {
        self.sessionProvider = sessionProvider
        self.customView = Home(frame: .zero)
        self.activityView = UIActivityIndicatorView(style: .large)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        super.init(nibName: nil, bundle: nil)
        self.alert = AlertsError()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    override func loadView() {
        view = typeView.customView
        setupActivityView()
    }
    
    // MARK: - Setups
    private func setupNavigation() {
        title = "Chuck Norris Facts"
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(showSearch(_:)))
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
    
     // MARK: - Show Views
    func setupActivityView() {
        view.addSubview(activityView)
        activityView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func presentView(controller: UIViewController?) {
        guard let controller = controller  else {return}
        present(controller, animated: true)
    }
    
    @objc func showSearch(_ sender: UIBarButtonItem) {
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
     // MARK: - fetch in API
    private func fetchFact(searchText: String) {
        activityView.startAnimating()
        sessionProvider.request(type: FactResult.self, service: NetworkService.getTextSearch(FactResult.self, searchText)) { response  in
            DispatchQueue.main.async {
                self.activityView.stopAnimating()
                switch response {
                case let .success(result):
                    self.changeView(array: result.result)
                case let .failure(error):
                    self.presentView(controller: (self.alert?.showAlertNetWorError(error: error))!)
                }
            }
        }
    }
    
    func changeView(array:[Fact]) {
        if array.count > 0 {
            self.view = self.customView
            self.setupActivityView()
            self.setupTableView(with: array)
        }else{
            self.typeView = SetupViewInHome.noResult
            self.view = self.typeView.customView
            self.setupActivityView()
        }
    }
}
