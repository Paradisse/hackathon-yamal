//
//  CellForSignIn.swift
//  Calendar
//
//  Created by Daniil on 15.10.2021.
//

import UIKit

class CellForSignIn: UITableViewCell {

    let button = UIButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        button.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.contentView.addSubview(button)
    }
}
