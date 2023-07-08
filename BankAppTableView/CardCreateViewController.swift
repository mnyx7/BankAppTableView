//
//  CardCreateViewController.swift
//  BankAppTableView
//
//  Created by Minaya Yagubova on 07.02.23.
//

import UIKit

protocol DelegateCardProtocol {
    func createCard(card:Card)
}
// var card: Card? bu nedi?
class CardCreateViewController:  UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var exp: UITextField!
    @IBOutlet weak var cvv: UITextField!
    
    var user: Profile?
    var delegate: DelegateCardProtocol?
    var profiles = [Profile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readDataFromFile()
    }
    
    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
        let path = docDirectory.appendingPathComponent("Users.json")
        print(path)
        return path
    }
    
    func readDataFromFile() {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                profiles = try JSONDecoder().decode([Profile].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("File doesn't exist")
        }
    }
    
    func writeToJsonFile(){
        do{
            let data = try JSONEncoder().encode(profiles)
            try data.write(to: getFilePath())
        } catch{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func createCard(_ sender: Any) {
        if let cardName = name.text,
        let cardNumber = number.text,
        let cardExp = exp.text,
        let cardCVV = cvv.text,
        !cardName.isEmpty, !cardNumber.isEmpty, !cardExp.isEmpty, !cardCVV.isEmpty {
            if user?.cards == nil {
                user?.cards = [Card]()
            }
            user?.cards?.append(Card(number: cardNumber, name: cardName, expr: cardExp, cvv: cardCVV))
        } else{
            print("Wrong Format")
        }
        
        readDataFromFile()
        
        for profile in profiles {
            if user?.email == profile.email && user?.password == profile.password {
                
                profiles.removeAll(where: {$0.fullname == profile.fullname})
                profiles.append(user!)
                //update array
                   //delete current user from array
                   //add current(updated) user to array
//                writeToJsonFile()
            }
        }
        
        //        if name.text  == "" {
        //            makeAlert(titleInput: "Error", messageInput: "You must enter an Card Name!")
        //        } else if number.text   == "" {
        //            makeAlert(titleInput: "Error", messageInput: "You must enter an Card Number!")
        //        } else if exp.text   == "" {
        //            makeAlert(titleInput: "Error", messageInput: "You must enter an Expire Date!")
        //        } else if cvv.text          == "" {
        //            makeAlert(titleInput: "Error", messageInput: "You must enter an CVC!")
        //        } else {
        //            delegate?.createCard(card: Card(number: number.text ?? "", name: name.text ?? "", expr: exp.text ?? "", cvv:cvv.text ?? ""))
        //            self.navigationController?.popViewController(animated: true)
        //            makeAlert(titleInput: "Successfully", messageInput: "Your registration card  has been completed successfully!!")
        //        }
        //
        //        func makeAlert(titleInput: String, messageInput: String) {
        //            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        //            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        //            alert.addAction(okButton)
        //            self.present(alert, animated: true, completion: nil )
        //        }
    }
    
    
}
