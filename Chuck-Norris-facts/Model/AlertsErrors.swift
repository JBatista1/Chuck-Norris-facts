//
//  AlertsErrors.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 06/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import UIKit

class AlertsError {
    private var messageError = String()
    private var titleError = String()
    var alert : UIAlertController?
    func showAlertError(error: TypeError) -> UIViewController? {
        
        switch error {
        case .notConnectServe:
            titleError = "Unable to connect to server"
            messageError = "We were unable to perform your search at this time, please try again later."
            alert = self.showAlert(title: titleError, message: messageError)
            
        case .notNetWork:
            titleError = "Warning"
            messageError = "The Internet is not available. Please check your connection and try again."
            let alertAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert = self.showAlert(title: titleError, message: messageError, alertActions: [alertAction])
            
        case .textLessThan3:
            titleError = "Small text"
            messageError = "Search text length must be between 3 and 120 characters."
            alert = self.showAlert(title: titleError, message: messageError)
            
        case .invalidSearch:
            titleError = "Invalid search"
            messageError = "Could not perform a search with this term. Please try again with another word or phrase."
            alert = self.showAlert(title: titleError, message: messageError)
        }
        return alert
    }
    func showAlertNetWorError(error: NetworkError) -> UIAlertController?{
        var typeError = TypeError.notConnectServe
        switch error {
        case .clientError(_,  _):
            typeError =  TypeError.invalidSearch
        default:
            typeError = TypeError.notConnectServe
        }
        self.alert = showAlertError(error: typeError) as? UIAlertController 
        return alert
    }
    
    private func showAlert(title: String, message: String,  alertActions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .default, handler: nil)])-> UIAlertController? {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.setAlertActions(alert: alertController, alertAction: alertActions)
        return alertController
    }
    
    
    private func setAlertActions(alert: UIAlertController, alertAction: [UIAlertAction]) {
        for actions in alertAction{
            alert.addAction(actions)
        }
    }
}
