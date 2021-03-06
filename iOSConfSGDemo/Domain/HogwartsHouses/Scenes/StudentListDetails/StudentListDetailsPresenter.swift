//
//  StudentListDetailsPresenter.swift
//  iOSConfSGDemo
//
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

/*
 StudentListDetails files were created via Clean Swift Template as a showcase for the demo.
 They have no functionality at all.
 */

import UIKit

protocol StudentListDetailsPresentationLogic
{
  func presentSomething(response: StudentListDetails.Something.Response)
}

class StudentListDetailsPresenter: StudentListDetailsPresentationLogic
{
  weak var viewController: StudentListDetailsDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: StudentListDetails.Something.Response)
  {
    let viewModel = StudentListDetails.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
