//
//  SelectedCarTableViewCell.swift
//  FinalProjectiOS
//
//  Created by tornike on 29.12.21.
//

import UIKit

class SelectedCarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectedCarImage: UIImageView!
    @IBOutlet weak var horsePowerLbl: UILabel!
    @IBOutlet weak var horsePowerCount: UILabel!
    @IBOutlet weak var carModelPrice: UILabel!
    @IBOutlet weak var carModelPriceSum: UILabel!
    @IBOutlet weak var carMakeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
