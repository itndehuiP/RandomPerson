//
//  PersonView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit
import Combine
import os.log

class PersonView: UIViewController {

    @IBOutlet weak var personView: PersonImageView!
    @IBOutlet var characteristicsView: [PersonCharacteristicView]!
    var viewModel: PersonViewModel?
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerLoadPerson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
    
    private func configureNavBar() {
        let backItem = NavigationBarItem(option: .back,
                                         selector: #selector(goBack),
                                         title: "Back",
                                         systemIMgName: "chevron.left",
                                         style: .highlighted)
        self.navigationController?.setNavigationBar(with: [backItem])
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func set(_ person: Person) {
        self.viewModel = PersonViewModel(person: person)
    }
    
    private func reloadView() {
        personView.setMedia(viewModel?.mediaURL)
        setCharacteristic()
    }
    
    private func setCharacteristic() {
        for char in PersonCharacteristic.allCases {
            switch char {
            case .name:
                if characteristicsView.indexRange(0), let info = viewModel?.nameCharacteristic {
                    characteristicsView[0].setInfo(info)
                }
            case .nationality:
                if characteristicsView.indexRange(1), let info = viewModel?.nationalityDescription {
                    characteristicsView[1].setInfo(info)
                }
            case .gender:
                if characteristicsView.indexRange(2), let info = viewModel?.contactDescription {
                    characteristicsView[2].setInfo(info)
                }
            case .age:
                if characteristicsView.indexRange(3), let info = viewModel?.ageDescription {
                    characteristicsView[3].setInfo(info)
                }
            case .contact:
                if characteristicsView.indexRange(4), let info = viewModel?.genderDescription {
                    characteristicsView[4].setInfo(info)
                }
            }
        }
    }
    
    private func registerLoadPerson() {
        viewModel?.$person
            .sink(receiveValue: { _ in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {
                        Logger().critical("PersonView: Nil self in registerLoadPerson")
                        return
                    }
                    self.reloadView()
                }
            })
            .store(in: &cancellables)
    }

}
