//
//  BusquedaViewController.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import UIKit

class BusquedaAnimeViewController: UIViewController {
    
    @IBOutlet weak var BusquedaAnimeTable: UITableView!
    let  searchController = UISearchController()
    var busquedaAnimeManager = BusquedaApi()
    var busqueda: [Datas]?
    var id: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Busqueda de Animes"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        busquedaAnimeManager.delegate = self
        BusquedaAnimeTable.delegate = self
        BusquedaAnimeTable.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "busquedaToShow" {
            let destinacionVC = segue.destination as! MostrarAnimeViewController
            destinacionVC.id = id

        }
    }

}

extension BusquedaAnimeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            if text == "" {
                busqueda = []
                self.BusquedaAnimeTable.reloadData()
                
            } else{
                var textBusqueda = text.replacingOccurrences(of: " ", with: "%20")
                textBusqueda = textBusqueda.replacingOccurrences(of: "¿", with: "%C2%BF")
                textBusqueda = textBusqueda.replacingOccurrences(of: ",", with: "%2C")
                textBusqueda = textBusqueda.replacingOccurrences(of: "?", with: "%3F")
                textBusqueda = textBusqueda.replacingOccurrences(of: "!", with: "%21")
                self.busquedaAnimeManager.Tipo(tipo: textBusqueda)
            }
        }
    }
    

    
}

extension BusquedaAnimeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busqueda?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = BusquedaAnimeTable.dequeueReusableCell(withIdentifier: "BusquedaAnimeTableViewCell", for: indexPath) as! BusquedaAnimeTableViewCell
        if let  imagen = busqueda?[indexPath.row].images?.jpg?.large_image_url {
            celda.busquedaAnimeImage.downloaded(from: imagen)
        }
        celda.busquedaAnimeLabel.text = busqueda?[indexPath.row].title
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = busqueda![indexPath.row].mal_id
        performSegue(withIdentifier: "busquedaToShow", sender: self)
    }
    
    
}

extension BusquedaAnimeViewController: BusquedaApiDelegate {
    func didUpdateAnime(movie: [Datas]) {
        DispatchQueue.main.async {
            self.busqueda = movie
            self.BusquedaAnimeTable.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
    }
    
    
}
