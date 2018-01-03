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
    var dataSource: [[CellManager]] = []
    
    var user = User() {
        didSet {
            self.populateTable { cells, indexPathsToReload in
                self.dataSource = cells
                self.tableView.reloadRows(at: indexPathsToReload, with: .none)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.populateTable(callback: {cells, _ in
            self.dataSource = cells
        })
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource[indexPath.section][indexPath.row].getCell(tableView: tableView, indexPath: indexPath)
    }
    
    
    func populateTable(callback: ([[CellManager]], [IndexPath]) -> ()) {
        var tmpCellManager: [[CellManager]] = []
        var tmpIndexPaths: [IndexPath] = []
        
        let cellName = CellFieldManager(
            placehoder: "Name",
            text: self.user.name,
            block: { name in
                self.user.name = name
            })
        
        let cellEmail = CellFieldManager(
            placehoder: "Email",
            text: self.user.email,
            keyboardType: .emailAddress,
            block: { email in
                self.user.email = email
            })
        
        let cellPassword = CellFieldManager(
            placehoder: "Password",
            text: self.user.password,
            isSecureTextEntry: true,
            block: { password in
                self.user.password = password
            })
        
        tmpCellManager.append([cellName, cellEmail, cellPassword])

        let cellLabel = CellLabelManager(text: self.user.description)
        tmpCellManager.append([cellLabel])
        
        tmpIndexPaths.append(cellLabel.indexPath(inArray: tmpCellManager))
        
        callback(tmpCellManager, tmpIndexPaths)
    }
}

enum Blocks {
    typealias stringBlock = (String) -> ()
}

