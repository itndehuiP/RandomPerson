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
    
    @IBOutlet weak var peopleTableView: UITableView!
    let viewModel = PeopleViewModel()
    private var cancellables: Set<AnyCancellable> = []
    private var lastCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchPeople()
        viewModel.load(quantity: 4)
    }
    
    private func configureView() {
        peopleTableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
        peopleTableView.dataSource = self
        peopleTableView.delegate = self
        peopleTableView.separatorStyle = .none
    }
    
    private func fetchPeople() {
        viewModel.$people
            .sink {[weak self] peope in
                guard let self = self else {
                    Logger().critical("PeopleView: Nil self in fetchPeople")
                    return
                }
                self.lastCount = peope?.count
                self.peopleTableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
}

//MARK: TableView DataSource
extension PeopleView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lastCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let person = viewModel.getPerson(for: indexPath.row), let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as? PersonCell else {
            Logger().debug("Could not load PersonCell in cellForRow")
            return UITableViewCell()
        }
        cell.set(person)
        return cell
    }
}

extension PeopleView: UITableViewDelegate {
    
}
