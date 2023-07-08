//
//  CardsTableViewCell.swift
//  BankAppTableView
//
//  Created by Minaya Yagubova on 04.02.23.
//

import UIKit

class CardsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var nextIconCard: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
