//
//  ViewController.swift
//  RandomHuman
//
//  Created by Guerson Perez on 29/03/21.
//

import UIKit
import os.log
import SwiftUI

class HomeView: UIViewController {
    @IBOutlet private weak var panelInstructions: DescriptiveLabel!
    @IBOutlet weak var discoverTableView: UITableView!
    private var randomValueHostVC: UIHostingController<RandomAnimatorView>? = nil
    private var restrictionHostVC: UIHostingController<ResctrictionView>? = nil
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }

    private func configureView() {
        discoverTableView.register(UINib(nibName: "RandomRowCell", bundle: nil), forCellReuseIdentifier: "RandomRowCell")
        discoverTableView.dataSource = self
        discoverTableView.separatorStyle = .none
        discoverTableView.allowsSelection = false
        panelInstructions.text = "Everyday you have a chance to discover people in the network. Try your luck and hit a button. The hidden value in the button will tell how many people you can discover today! "
    }
    
    private func configureNavBar() {
        self.title = nil
        self.navigationController?.setNavigationBar(with: nil)
    }
    
    private func presentAnimator(quantity: Int) {
        viewModel.updateDiscoverDate()
        let randomViewAnimatorHostVC = UIHostingController(rootView: RandomAnimatorView(value: quantity, onContinue: showPeopleView(quantity:)))
        randomViewAnimatorHostVC.modalPresentationStyle = .overCurrentContext
        randomValueHostVC = randomViewAnimatorHostVC
        self.present(randomValueHostVC!, animated: true, completion: nil)
    }
    
    private func presentRestriction() {
        let restrictionHostVC = UIHostingController(rootView: ResctrictionView(onTapAction: dismissRestrictionHost))
        self.restrictionHostVC = restrictionHostVC
        self.present(self.restrictionHostVC!, animated: true, completion: nil)
    }
    
    private func manageOnReceived(_ value: Int) {
        if viewModel.canDiscover {
            presentAnimator(quantity: value)
        } else {
            presentRestriction()
        }
    }
    
    private func dismissRestrictionHost() {
        restrictionHostVC?.dismiss(animated: true, completion: nil)
        restrictionHostVC = nil
    }
    
    private func showPeopleView(quantity: Int) {
        let setter = PeopleSetter(discoveryQuantity: quantity)
        randomValueHostVC?.dismiss(animated: true, completion: { [weak self] in
            guard let self = self else {
                Logger().critical("HomeView: Nil self in showPeopleView")
                return
            }
            self.navigationController?.push(option: .people(setter))
        })
    }
    
}

//MARK: Table View Data Source
extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RandomRowCell") as? RandomRowCell else {
            Logger().debug("Could not load RandomCell in cellForRow")
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
}

extension HomeView: RandomRowDelegate {
    func onButtonTapped(value: Int) {
        manageOnReceived(value)
    }
    
}
