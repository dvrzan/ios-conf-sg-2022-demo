//
//  HouseListRouter.swift
//  iOSConfSGDemo
//
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HouseListRoutingLogic {
  func routeToStudentList(segue: UIStoryboardSegue?)
}

protocol HouseListDataPassing {
  var dataStore: HouseListDataStore? { get }
}

class HouseListRouter: NSObject, HouseListRoutingLogic, HouseListDataPassing {
  weak var viewController: HouseListViewController?
  var dataStore: HouseListDataStore?

  // MARK: Routing Logic
  func routeToStudentList(segue: UIStoryboardSegue?) {
    if let segue = segue {
      let destinationVC = segue.destination as! StudentListViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToStudentList(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "HogwartsHouses", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToStudentList(source: dataStore!, destination: &destinationDS)
      navigateToStudentList(source: viewController!, destination: destinationVC)
    }
  }

  // MARK: Navigation
  func navigateToStudentList(source: HouseListViewController, destination: StudentListViewController) {
    source.show(destination, sender: nil)
  }

  // MARK: Passing data
  func passDataToStudentList(source: HouseListDataStore, destination: inout StudentListDataStore) {
    destination.house = source.house
  }
}
