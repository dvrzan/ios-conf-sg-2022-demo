//
//  StudentListViewControllerTests.swift
//  iOSConfSGDemoTests
//
//

import XCTest
@testable import iOSConfSGDemo

class StudentListViewControllerTests: XCTestCase {
  var sut: StudentListViewController!
  var interactorSpy: StudentListInteractorSpy!

  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = StudentListViewController()
    interactorSpy = StudentListInteractorSpy()
    sut.interactor = interactorSpy
  }

  //MARK: Tests

  override func tearDownWithError() throws {
    sut = nil
    interactorSpy = nil

    try super.tearDownWithError()
  }
}

// MARK: Interactor Spy
class StudentListInteractorSpy: StudentListBusinessLogic {
  var fetchStudentListCalled = false

  func fetchStudentList() async {
    fetchStudentListCalled = true
  }
}
