//
//  HomeTableViewController.swift
//  BankAppTableView
//
//  Created by Minaya Yagubova on 03.02.23.
//

import UIKit
//var delegate: DelegateProtocol?


class HomeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DelegateCardProtocol {
    @IBOutlet weak var homeTable: UITableView!
    
    var user: Profile?
    
    let homePageList = [Category(name: " Cards", icon: "next"), Category(name: "Transfer", icon: "next"), Category(name: "Profile", icon: "next")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homePageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homePageCell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        homePageCell.nextIcon.image = UIImage(named: homePageList[indexPath.row].icon)
        homePageCell.categoryName.text = homePageList[indexPath.row].name
        return homePageCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let cards = user?.cards, !cards.isEmpty {
                let cardsList = storyboard?.instantiateViewController(withIdentifier: "CardsTableViewController") as! CardsTableViewController
                cardsList.cardsPageList = cards
                navigationController?.show(cardsList, sender: nil)
            } else {
                let createCard = storyboard?.instantiateViewController(withIdentifier: "CardCreateViewController") as! CardCreateViewController
                createCard.delegate = self
                createCard.user = user
                navigationController?.show(createCard, sender: nil)
            }
            
        }
        if indexPath.row == 1 {
            //            let existCards = storyboard.instantiateViewController(withIdentifier: "CardsTableViewController") as! CardsTableViewController
            //            navigationController?.show(existCards, sender: nil)
        }
    }
    
    func createCard(card: Card) {
        if user?.cards == nil {
            user?.cards = [Card]()
            
        }
        user?.cards?.append(card)
    }
}
