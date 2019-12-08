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
    
    private var facts = [Fact]() {
        didSet {
            DispatchQueue.main.async {
                self.customView.factsTableView.reloadSections([0], with: .automatic)
            }
        }
    }
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
        customView.factsTableView.delegate = self
        customView.factsTableView.dataSource = self
//        customView.factsTableView.register(FactTableViewCell.self, forCellReuseIdentifier: cellId)
        setupNavigation()
        
    }
    
    override func loadView() {
        view = customView
    }
    
    // MARK: - Navigation
    private func setupNavigation() {
        title = "Chuck Norris Facts"
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(searchFact))
        navigationItem.rightBarButtonItem = addBarButtonItem
        navigationController?.view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func searchFact(_ sender: UIBarButtonItem) {
        let search = SearchFactViewController()
        search.modalTransitionStyle = .crossDissolve
        search.modalPresentationStyle = .overFullScreen
        present(search, animated: true, completion: nil)
        search.textForSearch.subscribe(onNext: {[weak self] searchFact in
            self?.seachText = searchFact
            self!.getFact()
        }).disposed(by: disposeBag)
        
    }
    
    private func getFact() {
        sessionProvider.request(type: FactDTO.self, service: NetworkService.getTextSearch(FactDTO.self, self.seachText)) { response  in
            switch response {
            case let .success(result):
                self.facts = result.result
            case let .failure(error):
                self.alert?.showAlertNetWorError(error: error)
            }
            
        }
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! FactTableViewCell
        cell.factLabel.text = facts[indexPath.row].value
        cell.categoryLabel.text = "TESTE"
        cell.sharingButton.addTarget(self, action: #selector(shraing), for: .touchDown)
        return cell
    }
    @objc func shraing() {
        print("Existo")
    }
    
    
}
