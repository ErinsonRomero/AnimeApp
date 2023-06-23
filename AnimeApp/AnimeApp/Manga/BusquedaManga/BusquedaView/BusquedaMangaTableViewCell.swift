//
//  BusquedaMangaTableViewCell.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 25/01/23.
//

import UIKit

class BusquedaMangaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var busquedaMangaImage: UIImageView!
    
    @IBOutlet weak var busquedaMangaName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        busquedaMangaImage.image = UIImage(named: "SinImagen")
    }

}
