//
//  ViewController.swift
//  Todo-Main-Swift
//
//  Created by topik mujianto on 07/02/20.
//  Copyright © 2020 topik mujianto. All rights reserved.
//

import UIKit
import GITSTodo

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var todos = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkManager.getTodos(onSuccess: { [weak self] result in
            guard let `self` = self else {return}
            self.todos = result
            self.tableView.reloadData()
        }, onError: { [weak self] error in
            guard let `self` = self else {return}
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
        
    }
}

//MARK:- UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL_TODO")
        let todo = self.todos[indexPath.row]
        cell?.textLabel?.text = todo
        return cell ?? UITableViewCell()
    }
    
    
}

