//
//  BusquedaMangaViewController.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 25/01/23.
//

import UIKit

class BusquedaMangaViewController: UIViewController {

    @IBOutlet weak var busquedaMangaTable: UITableView!
    let  searchController = UISearchController()
    var busquedaMangaManager = BusquedaMangaApi()
    var busqueda: [Datas]?
    var id: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Busqueda de Mangas"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        busquedaMangaManager.delegate = self
        busquedaMangaTable.delegate = self
        busquedaMangaTable.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "busquedaMangaToShow" {
            let destinacionVC = segue.destination as! MostrarAnimeViewController
            destinacionVC.id = id

        }
    }

}

extension BusquedaMangaViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            if text == "" {
                busqueda = []
                self.busquedaMangaTable.reloadData()
                
            } else{
                var textBusqueda = text.replacingOccurrences(of: " ", with: "%20")
                textBusqueda = textBusqueda.replacingOccurrences(of: "¿", with: "%C2%BF")
                textBusqueda = textBusqueda.replacingOccurrences(of: ",", with: "%2C")
                textBusqueda = textBusqueda.replacingOccurrences(of: "?", with: "%3F")
                textBusqueda = textBusqueda.replacingOccurrences(of: "!", with: "%21")
                self.busquedaMangaManager.Tipo(tipo: textBusqueda)
            }
        }
    }
    

    
}

extension BusquedaMangaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busqueda?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = busquedaMangaTable.dequeueReusableCell(withIdentifier: "BusquedaMangaTableViewCell", for: indexPath) as! BusquedaMangaTableViewCell
        if let  imagen = busqueda?[indexPath.row].images?.jpg?.large_image_url {
            celda.busquedaMangaImage.downloaded(from: imagen)
        }
        celda.busquedaMangaName.text = busqueda?[indexPath.row].title
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = "manga/\(String(busqueda![indexPath.row].mal_id))"
        performSegue(withIdentifier: "busquedaMangaToShow", sender: self)
    }
    
    
}

extension BusquedaMangaViewController: BusquedaApiDelegate {
    func didUpdateAnime(movie: [Datas]) {
        DispatchQueue.main.async {
            self.busqueda = movie
            self.busquedaMangaTable.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
    }
    
    
}

