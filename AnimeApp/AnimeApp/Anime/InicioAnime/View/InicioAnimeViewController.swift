//
//  ViewController.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 2/01/23.
//

import UIKit

class InicioAnimeViewController: UIViewController {

    @IBOutlet weak var inicioAnimeTable: UITableView!

    let listaSecciones = ["En Emision", "Tops Animes", "Proximamente"] //, "Proximamente"
    let listaTipos = ["seasons/now" ,"top/anime", "seasons/upcoming"]
    var id: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        manager.delegate = self
        inicioAnimeTable.delegate = self
        inicioAnimeTable.dataSource = self
        title = "Animes"
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inicioToShow" {
            let destinacionVC = segue.destination as! MostrarAnimeViewController
            destinacionVC.id = id
        }
    }
}

extension InicioAnimeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaSecciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = inicioAnimeTable.dequeueReusableCell(withIdentifier: "InicioAnimeTableViewCell", for: indexPath) as! InicioAnimeTableViewCell
        celda.inicioTopsSeriesManager.Tipo(tipo: listaTipos[indexPath.row])
        celda.inicioSeccionLabel.text = listaSecciones[indexPath.row]
        celda.delegates = self
        return celda
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
        
    }
}
extension InicioAnimeViewController: darDatoInicio {
    func darDato(_ dato: Int) {
        id = "anime/\(dato)"
        performSegue(withIdentifier: "inicioToShow", sender: self)
    }
    
    
}
