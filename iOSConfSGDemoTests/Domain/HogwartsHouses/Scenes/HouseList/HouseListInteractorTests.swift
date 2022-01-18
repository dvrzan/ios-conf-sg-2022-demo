//
//  HouseListInteractorTests.swift
//  iOSConfSGDemoTests
//
//

import XCTest
@testable import iOSConfSGDemo

class HouseListInteractorTests: XCTestCase {
  var sut: HouseListInteractor!
  var presenterSpy: HouseListPresenterSpy!

  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = HouseListInteractor()
    presenterSpy = HouseListPresenterSpy()
  }

  // MARK: Tests

  override func tearDownWithError() throws {
    sut = nil
    presenterSpy = nil
  }
}

// MARK: Presenter Spy
class HouseListPresenterSpy: HouseListPresentationLogic {}
