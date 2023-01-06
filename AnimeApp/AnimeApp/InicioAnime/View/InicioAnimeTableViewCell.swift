//
//  InicioAnimeTableViewCell.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import UIKit

protocol darDatoInicio {
    func darDato(_ dato: Int)
}

class InicioAnimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var inicioSeccionLabel: UILabel!
    
    
    @IBOutlet weak var inicioCollectionView: UICollectionView!
    
    var animes: [Datas]?
    var id: Int?
    var delegates: darDatoInicio?
    var inicioTopsSeriesManager = InicioTopsSeries()
    
    var man = InicioAnimeViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        inicioCollectionView.delegate = self
        inicioCollectionView.dataSource = self
        
        inicioTopsSeriesManager.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension InicioAnimeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = inicioCollectionView.dequeueReusableCell(withReuseIdentifier: "InicioAnimeCollectionViewCell", for: indexPath) as! InicioAnimeCollectionViewCell
        if let imagen = animes?[indexPath.row].images?.jpg?.large_image_url {
            cell.imagenAnime.downloaded(from: imagen)
        }
        
        cell.nombreAnime.text = animes![indexPath.row].title
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.id = animes?[indexPath.row].mal_id
        self.delegates?.darDato(animes![indexPath.row].mal_id)
        print(animes![indexPath.row].mal_id)
    }
}

extension InicioAnimeTableViewCell: InicioTopsSeriesDelegate {
    func didUpdateAnime(movie: [Datas]) {
        DispatchQueue.main.async {
            self.animes = movie
            self.inicioCollectionView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        
    }

}    
    

