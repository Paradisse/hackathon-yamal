//
//  CellForEnterData.swift
//  Calendar
//
//  Created by Daniil on 15.10.2021.
//

import UIKit

class CellForEnterData: UITableViewCell {

    let textField = UITextField()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        textField.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.contentView.addSubview(textField)
    }
}
