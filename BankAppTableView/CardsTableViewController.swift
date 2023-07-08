//
//  CardsTableViewController.swift
//  BankAppTableView
//
//  Created by Minaya Yagubova on 04.02.23.
//

import UIKit

class CardsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var cardsPageList = [Card]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardsPageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cardsCell = tableView.dequeueReusableCell(withIdentifier: "cardCell") as! CardsTableViewCell
        cardsCell.cardName.text = cardsPageList[indexPath.row].name
        return cardsCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
