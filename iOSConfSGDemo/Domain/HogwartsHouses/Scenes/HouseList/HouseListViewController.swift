//
//  HouseListViewController.swift
//  iOSConfSGDemo
//
//

import UIKit

protocol HouseListDisplayLogic: AnyObject {}

class HouseListViewController: UIViewController, HouseListDisplayLogic {
  var interactor: HouseListBusinessLogic?
  var router: (NSObjectProtocol & HouseListRoutingLogic & HouseListDataPassing)?

  @IBOutlet weak var gryffindorButton: UIButton!
  @IBOutlet weak var slytherinButton: UIButton!
  @IBOutlet weak var hufflepuffButton: UIButton!
  @IBOutlet weak var ravenclawButton: UIButton!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: Setup
  private func setup() {
    let viewController = self
    let interactor = HouseListInteractor()
    let presenter = HouseListPresenter()
    let router = HouseListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }

  // MARK: View Lifecycle
  override func viewDidLoad() {
      super.viewDidLoad()
  }

  // MARK: Routing
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }

  @IBAction func houseButtonTapped(_ sender: UIButton) {
    switch sender {
    case gryffindorButton:
      interactor?.getSelectedHouse("gryffindor")
    case slytherinButton:
      interactor?.getSelectedHouse("slytherin")
    case hufflepuffButton:
      interactor?.getSelectedHouse("hufflepuff")
    case ravenclawButton:
      interactor?.getSelectedHouse("ravenclaw")
    default:
      break
    }
    router?.routeToStudentList(segue: nil)
  }
}

