//
//  SearchFactViewController.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 02/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import UIKit
import RxSwift
class SearchFactViewController: UIViewController {
    private let customView = SearchFact(frame: .zero)
    var textForSearch = PublishSubject<String>()
    private let network = Network()
    private var alert: AlertsError!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    override func loadView() {
        view = customView
        setupInitial()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        customView.endEditing(true)
    }
    
    private func setupInitial(){
        customView.buttonCancel.addTarget(self, action: #selector(closeSearch), for: .touchUpInside)
        customView.buttonSearch.addTarget(self, action: #selector(searchFact), for: .touchUpInside)
        customView.search.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func closeSearch(){
        dismiss(animated: true, completion: nil)
    }
    @objc func searchFact(){
        guard let searchFact = customView.search.text else {return}
        if noMistake(text: searchFact) {
            textForSearch.onNext(searchFact)
            customView.endEditing(true)
            dismiss(animated: true, completion: nil)
        }
            
        
    }
    func noMistake(text: String) -> Bool {
        alert = AlertsError(controller: self)
        var notError = true
        customView.layoutIfNeeded()
        if !network.isconnected(){
            alert?.showAlertError(error: .notNetWork)
            notError = false
        }
        if text.count < 3{
            alert?.showAlertError(error: .textLessThan3)
            notError = false
        }
        return notError
    }
    
    
    // MARK: - Move view to insert keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if customView.frame.origin.y == 0 {
                customView.frame.origin.y -= keyboardSize.height/1.8
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if customView.frame.origin.y != 0 {
            customView.frame.origin.y = 0
        }
    }
}


extension SearchFactViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



