//
//  PeopleView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit
import os.log
import Combine

class PeopleView: UIViewController {
    
    @IBOutlet weak var loaderView: LoaderView!
    @IBOutlet weak var peopleTableView: UITableView!
    var viewModel: PeopleViewModel?
    private var cancellables: Set<AnyCancellable> = []
    private var lastCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        registerFetchPeople()
        viewModel?.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
    
    private func configureView() {
        peopleTableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
        peopleTableView.dataSource = self
        peopleTableView.allowsSelection = false
        peopleTableView.separatorStyle = .none
    }
    
    private func configureNavBar() {
        let backItem = NavigationBarItem(option: .back,
                                         selector: #selector(goBack),
                                         title: "Back",
                                         systemImgName: "chevron.left",
                                         style: .normal)
        self.navigationController?.setNavigationBar(with: [backItem])
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func showPersonDetail(_ person: Person) {
        self.navigationController?.push(option: .person(person))
    }
    
    func set(_ setter: PeopleSetter) {
        viewModel = PeopleViewModel(quantity: setter.discoveryQuantity)
    }
    
    private func registerFetchPeople() {
        viewModel?.$people
            .sink {[weak self] people in
                guard let self = self else {
                    Logger().critical("PeopleView: Nil self in fetchPeople")
                    return
                }
                self.lastCount = people?.count
                self.reloadView()
            }
            .store(in: &cancellables)
    }
    
    private func reloadView() {
        if lastCount == nil || lastCount == 0 {
            loaderView.isHidden = false
        } else {
            loaderView.isHidden = true
        }
        self.peopleTableView.reloadData()
    }
    
}

//MARK: TableView DataSource
extension PeopleView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lastCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let person = viewModel?.getPerson(for: indexPath.row), let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as? PersonCell else {
            Logger().debug("Could not load PersonCell in cellForRow")
            return UITableViewCell()
        }
        cell.set(person)
        cell.delegate = self
        return cell
    }
}

extension PeopleView: PersonCellDelegate {
    func onTap(person: Person?) {
        guard let person = person else {
            Logger().debug("PeopleView: Could not load Person in didSelectRowAt")
            return
        }
        showPersonDetail(person)
    }
}
