//
//  InicioAnimeCollectionViewCell.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import UIKit

class InicioAnimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagenAnime: UIImageView!
    @IBOutlet weak var nombreAnime: UILabel!
    
    override func prepareForReuse() {
        imagenAnime.image = UIImage(named: "SinImagen")
    }
}
