//
//  GuardadosViewController.swift
//  AnimeApp
//
//  Created by Erinson Andres Romero Terry on 6/01/23.
//

import UIKit

class GuardadosViewController: UIViewController {

    @IBOutlet weak var guardadosTableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [AnimeGuardado]?
    var id: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guardadosTableView.delegate = self
        guardadosTableView.dataSource = self
        fetchAnimesGuardados()
    }
    func fetchAnimesGuardados() {
        do {
            self.items = try context.fetch(AnimeGuardado.fetchRequest())
        } catch {}
    }
    func saveAnimesGuardados() {
        do {
            try self.context.save()
            
        } catch {}
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "guardadoToShow" {
            let destinacionVC = segue.destination as! MostrarAnimeViewController
            destinacionVC.id = id

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

}

extension GuardadosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = guardadosTableView.dequeueReusableCell(withIdentifier: "GuardadosTableCell", for: indexPath) as! GuardadosTableViewCell
        celda.fondoImage.downloaded(from: (items?[indexPath.row].poster!)!)
        celda.tituloLabel.text = items?[indexPath.row].nombre!
        return celda
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let borrar = UIContextualAction(style: .destructive, title: "Borrar") {(action, view, completionHandler) in
            let serieRemovida = self.items![indexPath.row]
            self.context.delete(serieRemovida)
            self.saveAnimesGuardados()
            self.fetchAnimesGuardados()
            self.guardadosTableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [borrar])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let idAnime = items?[indexPath.row].id {
            self.id = Int(idAnime)
            performSegue(withIdentifier: "guardadoToShow", sender: self)
        }
        
    }
    
    
}
