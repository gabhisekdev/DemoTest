//
//  PlaceTableCell.swift
//  DemoTests
//
//  Created by Abhisek on 6/9/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import UIKit

class PlaceTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model: PlaceCellDataModel) {
        titleLabel.text = model.name
        ratingLabel.text = model.rating
        addressLabel.text = model.address
        statusLabel.text = model.openStatusText
    }

}
