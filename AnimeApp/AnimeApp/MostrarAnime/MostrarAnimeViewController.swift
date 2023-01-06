//
//  MostrarAnimeViewController.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import UIKit

class MostrarAnimeViewController: UIViewController {
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var imagenImage: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var episodiosLabel: UILabel!
    @IBOutlet weak var generosLabel: UILabel!
    @IBOutlet weak var nombreCopyButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var id: Int?
    var name: String?
    var anime: MostrarDatas?
    var mostrarAnimeManager = MostrarApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarAnimeManager.delegate = self
        if let ids = id {
            mostrarAnimeManager.Tipo(tipo: ids)
        }
        if let nombre = anime?.title {
            nombreLabel.text = nombre
            
        }
        if let imagen = anime?.images?.jpg?.large_image_url {
            imagenImage.downloaded(from: imagen)
        }
        if let synopsis = anime?.synopsis {
            synopsisLabel.text = "Synopsis:\n\(synopsis)"
        }
        if let status = anime?.status {
            statusLabel.text = "Status: \(status)"
        }
        if let episodes = anime?.episodes {
            episodiosLabel.text = "Episodes: \(episodes)"
        }
        if let genres = anime?.genres {
            var generos = ""
            for i in genres {
                generos = "\(generos) \(i.name),"
            }
            generos.removeLast()
            generosLabel.text = "Genres:\(generos)"
        }
        if let score = anime?.score {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    @IBAction func copyButton(_ sender: Any) {
        UIPasteboard.general.string = nombreLabel.text
        nombreCopyButton.backgroundColor = .darkGray
        
    }
    

}

extension MostrarAnimeViewController: MostrarDelegate {
    func didUpdateAnime(movie: MostrarDatas) {
        DispatchQueue.main.async {
            self.anime = movie
            if movie.score == nil{
                self.scoreLabel.text = "Score: Not Scored"
            }
            self.viewDidLoad()        }
    }
    
    func didFailWithError(error: Error) {
        
    }
    
    
}
