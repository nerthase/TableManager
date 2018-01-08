//
//  ViewController.swift
//  ProtocolApp
//
//  Created by Mario De Santis on 02/01/2018.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: DataSource = []
    
    var user = User() {
        didSet {
            self.tableView.reload(identifier: "label", data: self.dataSource)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.populateTable()
    }

    
    //MARK: Table Population
    
    func populateTable() {
        let name: Blocks.cellBuilder = { (tableView, indexPath) in
            tableView.register(CellField.self)
            
            let cell: CellField = tableView.deque(indexPath)
            cell.build(placeholder: "Name", text: self.user.name, keyboardType: .default, isSecureTextEntry: false, block: {
                self.user.name = $0
            })
            return cell
        }
        
        let email: Blocks.cellBuilder = { (tableView, indexPath) in
            tableView.register(CellField.self)
            
            let cell: CellField = tableView.deque(indexPath)
            cell.build(placeholder: "Email", text: self.user.email, keyboardType: .emailAddress, isSecureTextEntry: false, block: {
                self.user.email = $0
            })
            return cell
        }
        
        let password: Blocks.cellBuilder = { (tableView, indexPath) in
            tableView.register(CellField.self)
            
            let cell: CellField = tableView.deque(indexPath)
            cell.build(placeholder: "Password", text: self.user.password, keyboardType: .default, isSecureTextEntry: true, block: {
                self.user.password = $0
            })
            return cell
        }
        
        let label: Blocks.cellBuilder = { (tableView, indexPath) in
            tableView.register(CellLabel.self)
            
            let cell: CellLabel = tableView.deque(indexPath)
            cell.build(text: self.user.description)
            return cell
        }
        
        let update: Blocks.cellBuilder = { (tableView, indexPath) in
            tableView.register(CellButton.self)
            
            let cell: CellButton = tableView.deque(indexPath)
            cell.build(text: "Reset values", block: {
                self.user = User()
                self.tableView.reloadData()
            })
            return cell
        }
        
        self.dataSource = [[(nil, name), (nil, email), (nil, password)], [("label", label)], [(nil, update)]]
    }
    
    
    //MARK: UITableViewDataSource, UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.dataSource[indexPath.section][indexPath.row].block(tableView, indexPath)
    }
    
}



