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
    @IBOutlet weak var mapButton: LabelButton!
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
                                         systemImgName: "chevron.left",
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
        configureMapButton()
    }
    
    private func configureMapButton() {
        if viewModel?.validCoordinates ?? false {
            mapButton.setValues(systemImgName: "location", title: "Locate", style: .highlighted)
            mapButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        } else {
            mapButton.isHidden = true
        }
    }
    
    @objc private func showMap() {
        let coordinates = viewModel?.person.location?.coordinates?.clCoordinates
        let description = viewModel?.plainAddressDescription
        guard let setter = MapSetter(coordinate: coordinates, description: description?.description) else {
            Logger().log("PersonView: Button should not be available showMap")
            return
        }
        self.navigationController?.push(option: .mapview(setter))
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
            case .address:
                if characteristicsView.indexRange(5), let info = viewModel?.addressDescription {
                    characteristicsView[5].setInfo(info)
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
