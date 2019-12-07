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
    private var controller: UIViewController
    private var messageError = String()
    private var titleError = String()
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func presentAlertError(error: TypeError){
        switch error {
        case .notConnectServe:
            titleError = "Unable to connect to server"
            messageError = "We were unable to perform your search at this time, please try again later."
            self.showAlert(title: titleError, message: messageError)
        case .notNetWork:
            titleError = "Warning"
            messageError = "The Internet is not available"
            let alertAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            self.showAlert(title: titleError, message: messageError, alertActions: [alertAction])
        case .textLessThan3:
           messageError = "Unable to connect to server"
            titleError = "We were unable to perform your search at this time, please try again later."
            self.showAlert(title: titleError, message: messageError)
        }
    }
    
    
    private func showAlert(title: String, message: String,  alertActions: [UIAlertAction] = [UIAlertAction(title: "Ok", style: .default, handler: nil)]){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self.setAlertActions(alert: alert, alertAction: alertActions)
            self.controller.present(alert, animated: true)
        }
        
    }
    
    
    private func setAlertActions(alert: UIAlertController, alertAction: [UIAlertAction]) {
        for actions in alertAction{
            alert.addAction(actions)
        }
    }


//       func showAlert() {
//           if !isInternetAvailable() {
//               let alert = UIAlertController(title: "Warning", message: "The Internet is not available", preferredStyle: .alert)
//               let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
//               alert.addAction(action)
//               present(alert, animated: true, completion: nil)
//           }
//       }
}
