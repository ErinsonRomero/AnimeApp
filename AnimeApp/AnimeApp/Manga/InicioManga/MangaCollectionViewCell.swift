//
//  MangaCollectionViewCell.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 9/01/23.
//

import UIKit

class MangaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mangaImage: UIImageView!
    
    @IBOutlet weak var mangaName: UILabel!
    override func prepareForReuse() {
        
        mangaImage.image = UIImage(named: "SinImagen")
    }
}
