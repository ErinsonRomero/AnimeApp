//
//  BusquedaAnimeTableViewCell.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import UIKit

class BusquedaAnimeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var busquedaAnimeLabel: UILabel!
    
    @IBOutlet weak var busquedaAnimeImage: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        busquedaAnimeImage.image = UIImage(named: "SinImagen")
    }

}
