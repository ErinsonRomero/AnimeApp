//
//  RandomViewController.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 26/04/23.
//

import UIKit

class RandomViewController: UIViewController{

    @IBOutlet weak var selectorSource: UISegmentedControl!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var imagenImage: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var episodiosLabel: UILabel!
    @IBOutlet weak var generosLabel: UILabel!
    @IBOutlet weak var nombreCopyButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var id: String?
    var tipo: String = "anime"
    var name: String?
    var anime: RandomDatas?
    var randomAnimeManager = RandomApi()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [AnimeGuardado]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomAnimeManager.delegate = self
        
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
                generos = "\(generos) \(i.name!),"
            }
            if generos != "" {
                generos.removeLast()
            }
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
        
    
    
    
    @IBAction func selectedSource(_ sender: Any) {
        switch selectorSource.selectedSegmentIndex {
            
        case 0:
            
            self.tipo = "anime"
            
        case 1:
            
            self.tipo = "manga"
            
        default:
            break
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        randomAnimeManager.Tipo(tipo: tipo)
    }
}

extension RandomViewController: RandomDelegate {
    func didFailWithError(error: Error) {
        
    }
    
    func didUpdateAnime(movie: RandomDatas) {
        DispatchQueue.main.async {
            self.anime = movie
            if movie.score == nil{
                self.scoreLabel.text = "Score: Not Scored"
            }
            if movie.episodes == nil {
                self.episodiosLabel.text = "Episodes: Not Episodes yet"
            }
            self.viewDidLoad()
        }
    }
    
    
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

