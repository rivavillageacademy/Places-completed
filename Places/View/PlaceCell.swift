//
//  PlaceCell.swift
//  Places
//
//  Created by Muhamed Alkhatib on 11/09/2020.
//

import UIKit

class PlaceCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var desc: UILabel!
}
