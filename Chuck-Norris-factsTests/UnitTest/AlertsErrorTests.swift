//
//  AlertsErrorTests.swift
//  Chuck-Norris-factsTests
//
//  Created by Joao Batista on 09/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//

import Foundation
import XCTest
@testable import Chuck_Norris_facts
class AlertsErrorTests: XCTestCase {
    var alertError: AlertsError!
    
    override func setUp() {
        super.setUp()
    }
    func testshowAlertErrorTypeInvalidSearch() {
        let typeError = TypeError.invalidSearch
        alertError = AlertsError()
        let viewAlert = alertError.showAlertError(error: typeError)
        XCTAssertNotNil(viewAlert)
    }
    func testshowAlertErrorTypetextLessThan3() {
        let typeError = TypeError.textLessThan3
        alertError = AlertsError()
        let viewAlert = alertError.showAlertError(error: typeError)
        XCTAssertNotNil(viewAlert)
    }
    func testshowAlertErrorTypeNotConnectServe() {
        let typeError = TypeError.notConnectServe
        alertError = AlertsError()
        let viewAlert = alertError.showAlertError(error: typeError)
        XCTAssertNotNil(viewAlert)
    }
    
    func testshowAlertErrorTypeNotNetWork() {
        let typeError = TypeError.notConnectServe
        alertError = AlertsError()
        let viewAlert = alertError.showAlertError(error: typeError)
        XCTAssertNotNil(viewAlert)
    }
    func testshowAlertErrorNetworkErrorClientError() {
        let networkError = NetworkError.clientError(statusCode: 400, dataResponse: "Bad resquets")
          alertError = AlertsError()
          let viewAlert = alertError.showAlertNetWorError(error: networkError)
          XCTAssertNotNil(viewAlert)
      }
    func testshowAlertErrorNetworkErrorDefacult() {
        let networkError = NetworkError.unknown
        alertError = AlertsError()
        let viewAlert = alertError.showAlertNetWorError(error: networkError)
        XCTAssertNotNil(viewAlert)
    }
}
