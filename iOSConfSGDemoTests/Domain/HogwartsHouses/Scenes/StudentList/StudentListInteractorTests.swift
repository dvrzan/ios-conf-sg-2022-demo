//
//  StudentListInteractorTests.swift
//  iOSConfSGDemoTests
//
//

import XCTest
@testable import iOSConfSGDemo

class StudentListInteractorTests: XCTestCase {
  var sut: StudentListInteractor!
  var presenterSpy: StudentListPresenterSpy!

  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = StudentListInteractor()
    presenterSpy = StudentListPresenterSpy()
  }

  // MARK: Tests

  override func tearDownWithError() throws {
    sut = nil
    presenterSpy = nil

    try super.tearDownWithError()
  }
}

// MARK: Presenter Spy
class StudentListPresenterSpy: StudentListPresentationLogic {
  var students: [Student]?
  var presentStudentListCalled = false

  func presentStudentList(response: StudentList.FetchStudentList.Response) {
    presentStudentListCalled = true
    students = response.students
  }
}
