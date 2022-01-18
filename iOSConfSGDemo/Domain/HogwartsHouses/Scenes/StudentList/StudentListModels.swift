//
//  StudentListModels.swift
//  iOSConfSGDemo
//
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum StudentList {
  enum FetchStudentList {
    struct Request {}
    struct Response {
      let students: [Student]
    }
    struct ViewModel {
      let students: [Student]
    }
  }

  enum ShowStudentLastName {

  }
  
}