//
//  GuardadosTableViewCell.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 6/01/23.
//

import UIKit

class GuardadosTableViewCell: UITableViewCell {

    @IBOutlet weak var fondoImage: UIImageView!
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
