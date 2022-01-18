//
//  HouseListPresenterTests.swift
//  iOSConfSGDemoTests
//
//

import XCTest
@testable import iOSConfSGDemo

class HouseListPresenterTests: XCTestCase {
  var sut: HouseListPresenter!
  var viewControllerSpy: HouseListViewControllerSpy!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = HouseListPresenter()
    viewControllerSpy = HouseListViewControllerSpy()
  }

  // MARK: Tests

  override func tearDownWithError() throws {
    sut = nil
    viewControllerSpy = nil
    try super.tearDownWithError()
  }
}

// MARK: - View Controller Spy
class HouseListViewControllerSpy: HouseListDisplayLogic {}
