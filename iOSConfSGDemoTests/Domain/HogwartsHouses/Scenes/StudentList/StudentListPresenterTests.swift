//
//  StudentListPresenterTests.swift
//  iOSConfSGDemo
//
//

import XCTest
@testable import iOSConfSGDemo

class StudentListPresenterTests: XCTestCase {
  var sut: StudentListPresenter!
  var viewControllerSpy: StudentListViewControllerSpy!

  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = StudentListPresenter()
    viewControllerSpy = StudentListViewControllerSpy()
  }

  // MARK: Tests
  // TODO: Write simple test
  func testPresenterShouldAskViewControllerToDisplayStudentList() {
    // When
    sut.viewController = viewControllerSpy

    // Given
    let response = StudentList.FetchStudentList.Response(students: Seeds.students)
    sut.presentStudentList(response: response)

    // Then
    XCTAssertTrue(
      viewControllerSpy.displayStudentListCalled,
      "Should ask view controller to display student list"
    )
  }

  override func tearDownWithError() throws {
    sut = nil
    viewControllerSpy = nil

    try super.tearDownWithError()
  }
}

// MARK: - View Controller Spy
class StudentListViewControllerSpy: StudentListDisplayLogic {
  var displayStudentListCalled = false

  func displayStudentList(viewModel: StudentList.FetchStudentList.ViewModel) {
    displayStudentListCalled = true
  }
}
