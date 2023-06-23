//
//  MostrarAnimeViewController.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import UIKit
import CoreData

class MostrarAnimeViewController: UIViewController {
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var imagenImage: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var episodiosLabel: UILabel!
    @IBOutlet weak var generosLabel: UILabel!
    @IBOutlet weak var nombreCopyButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    
    var id: String?
    var name: String?
    var anime: MostrarDatas?
    var mostrarAnimeManager = MostrarApi()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [AnimeGuardado]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAnimesGuardados()
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
    
    
    func fetchAnimesGuardados() {
        do {
            self.items = try context.fetch(AnimeGuardado.fetchRequest())
            if let item = self.items {
                for i in item {
                    if i.id == String(self.id!){
                        self.addButton.isHidden = true
                        break
                    } else {
                        self.addButton.isHidden = false
                    }
                }
            }
        } catch {}
    }
    
    func saveAnimesGuardados(_ serie: AnimeGuardado) {
        do {
            try self.context.save()
            
        } catch {}
    }
    
    @IBAction func copyButton(_ sender: Any) {
        UIPasteboard.general.string = nombreLabel.text
        nombreCopyButton.backgroundColor = .darkGray
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        if anime != nil {
            addButton.isHidden = true
            let newAnime = AnimeGuardado(context: self.context)
            newAnime.nombre = anime?.title
            newAnime.poster = anime?.images?.jpg?.large_image_url
            newAnime.id = String(id!)
            saveAnimesGuardados(newAnime)
        }
        
    }
    
}

extension MostrarAnimeViewController: MostrarDelegate {
    func didUpdateAnime(movie: MostrarDatas) {
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
    
    func didFailWithError(error: Error) {
        
    }
}
