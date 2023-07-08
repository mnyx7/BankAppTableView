//
//  HomeTableViewCell.swift
//  BankAppTableView
//
//  Created by Minaya Yagubova on 03.02.23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nextIcon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
