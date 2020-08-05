//
//  MainTableViewController.swift
//  TestRickAndMortyAlamofire
//
//  Created by Александр Бехтер on 29.07.2020.
//  Copyright © 2020 Александр Бехтер. All rights reserved.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController {

    private var characters: Character?

    private let urlString = "https://rickandmortyapi.com/api/character"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 90
     
        NetworkManager.shared.fetchDataAlamofire(from: urlString) { character in
            DispatchQueue.main.async {
                self.characters = character
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return characters?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        if let persons = characters?.results[indexPath.row] {
           cell.configure(with: persons)
        }
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let person = characters?.results[indexPath.row]
        let detailVC = segue.destination as! DetailViewController
        detailVC.character = person
    }
}
    




