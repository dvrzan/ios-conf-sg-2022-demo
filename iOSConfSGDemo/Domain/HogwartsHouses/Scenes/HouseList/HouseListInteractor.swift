//
//  HouseListInteractor.swift
//  iOSConfSGDemo
//
//

import Foundation

protocol HouseListBusinessLogic {
  func getSelectedHouse(_ selectedHouse: String)
}

protocol HouseListDataStore {
  var house: String { get set }
}

class HouseListInteractor: HouseListBusinessLogic, HouseListDataStore {
  var presenter: HouseListPresentationLogic?
  var house = ""

  func getSelectedHouse(_ selectedHouse: String) {
    house = selectedHouse
  }
}
