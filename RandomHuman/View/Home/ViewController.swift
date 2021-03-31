//
//  ViewController.swift
//  RandomHuman
//
//  Created by Guerson Perez on 29/03/21.
//

import UIKit
import os.log

class ViewController: UIViewController {
    @IBOutlet private weak var panelInstructions: DescriptiveLabel!
    @IBOutlet weak var discoverTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        discoverTableView.register(UINib(nibName: "RandomRowCell", bundle: nil), forCellReuseIdentifier: "RandomRowCell")
        discoverTableView.dataSource = self
        discoverTableView.delegate = self
        discoverTableView.separatorStyle = .none
        panelInstructions.text = "Everyday you have a chance to discover people in the network. Try your luck and hit a button. The hidden value in the button will tell how many people you can discover today! "
    }
}

//MARK: Table View Data Source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RandomRowCell") as? RandomRowCell else {
            Logger().debug("Could not load RandomCell in cellForRow")
            return UITableViewCell()
        }
        return cell
    }
}

//MARK: Table View Delegate
extension ViewController: UITableViewDelegate {
    
}
