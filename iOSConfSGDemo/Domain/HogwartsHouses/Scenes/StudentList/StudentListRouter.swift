//
//  StudentListRouter.swift
//  iOSConfSGDemo
//
//

import Foundation

protocol StudentListRoutingLogic {}

protocol StudentListDataPassing {
  var dataStore: StudentListDataStore? { get }
}

class StudentListRouter: NSObject, StudentListRoutingLogic, StudentListDataPassing {
  weak var viewController: StudentListViewController?
  var dataStore: StudentListDataStore?
}
