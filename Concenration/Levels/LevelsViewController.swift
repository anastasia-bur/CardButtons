//
//  LevelsViewController.swift
//  Concenration
//
//  Created by Анастасия on 19.02.2021.
//  Copyright © 2021 Nasty. All rights reserved.
//

import UIKit

   let levelsTableViewCellReuse = "LevelsTableViewCell"

class LevelsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var levelsArray : [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]

    @IBOutlet weak var levelsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        levelsTableView.delegate = self
        levelsTableView.dataSource = self
        
        levelsTableView.register(UINib(nibName: "LevelsTableViewCell", bundle: nil), forCellReuseIdentifier: levelsTableViewCellReuse)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = levelsTableView.dequeueReusableCell(withIdentifier: levelsTableViewCellReuse) as? LevelsTableViewCell {
            cell.textLabel2.text = levelsArray[indexPath.row]
            return cell
            
        }
        return UITableViewCell ()
    }

     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Уровни"
    }
    
}
