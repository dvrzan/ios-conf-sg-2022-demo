//
//  HouseListViewControllerTests.swift
//  iOSConfSGDemoTests
//
//

import XCTest
@testable import iOSConfSGDemo

class HouseListViewControllerTests: XCTestCase {
  var sut: HouseListViewController!
  var interactorSpy: HouseListInteractorSpy!

  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = HouseListViewController()
    interactorSpy = HouseListInteractorSpy()

    let storyboard = UIStoryboard(name: "HogwartsHouses", bundle: nil)
    sut = storyboard.instantiateViewController(withIdentifier: "HouseListViewController") as? HouseListViewController
    sut.loadViewIfNeeded()
  }

  //MARK: Tests
  func testIfGryffindorButtonHasActionAssigned() {
    // Given
    let gryffindorButton: UIButton = sut.gryffindorButton

    // When
    guard let gryffindorButtonAction = gryffindorButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
        XCTFail("Gryffindor button does not have action assigned for event .touchUpInside")
        return
    }

    // Then
    XCTAssertTrue(
      gryffindorButtonAction.contains("houseButtonTapped:"),
      "gryffindorButton should trigger houseButtonTapped: action"
    )
  }

  func testIfSlytherinButtonHasActionAssigned() {
    // Given
    let slytherinButton: UIButton = sut.slytherinButton

    // When
    guard let slytherinButtonAction = slytherinButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
        XCTFail("Slytherin button does not have action assigned for event .touchUpInside")
        return
    }

    // Then
    XCTAssertTrue(
      slytherinButtonAction.contains("houseButtonTapped:"),
      "slytherinButton should trigger houseButtonTapped: action"
    )
  }

  func testIfHufflepuffButtonHasActionAssigned() {
    // Given
    let hufflepuffButton: UIButton = sut.hufflepuffButton

    // When
    guard let hufflepuffButtonAction = hufflepuffButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
        XCTFail("Hufflepuff button does not have action assigned for event .touchUpInside")
        return
    }

    // Then
    XCTAssertTrue(
      hufflepuffButtonAction.contains("houseButtonTapped:"),
      "hufflepuffButton should trigger houseButtonTapped: action"
    )
  }

  func testIfRavenclawButtonHasActionAssigned() {
    // Given
    let ravenclawButton: UIButton = sut.ravenclawButton

    // When
    guard let ravenclawButtonAction = ravenclawButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
        XCTFail("Ravenclaw button does not have action assigned for event .touchUpInside")
        return
    }

    // Then
    XCTAssertTrue(
      ravenclawButtonAction.contains("houseButtonTapped:"),
      "ravenclawButton should trigger houseButtonTapped: action"
    )
  }

  override func tearDownWithError() throws {
    sut = nil
    interactorSpy = nil

    try super.tearDownWithError()
  }
}

// MARK: Interactor Spy
class HouseListInteractorSpy: HouseListBusinessLogic, HouseListDataStore {
  var house = ""
  var getSelectedHouseCalled = false

  func getSelectedHouse(_ house: String) {
    self.house = house
    getSelectedHouseCalled = true
  }
}
