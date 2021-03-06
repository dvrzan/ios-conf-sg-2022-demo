//
//  GriffindorListInteractor.swift
//  iOSConfSGDemo
//
//  Created by Danijela Vrzan on 2022-01-06.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol GriffindorListBusinessLogic {
  func doSomething(request: GriffindorList.Something.Request)
}

protocol GriffindorListDataStore {
  //var name: String { get set }
}

class GriffindorListInteractor: GriffindorListBusinessLogic, GriffindorListDataStore {
  var presenter: GriffindorListPresentationLogic?
  var worker: GriffindorListWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: GriffindorList.Something.Request) {
    worker = GriffindorListWorker()
    worker?.doSomeWork()
    
    let response = GriffindorList.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
