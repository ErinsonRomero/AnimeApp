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
    var busqueda: [Datas]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Busqueda de Animes"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }

}

extension BusquedaAnimeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            if text == "" {
                
            }
        }
    }
    
    
}
