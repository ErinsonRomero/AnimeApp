//
//  ViewController.swift
//  probandoViper
//
//  Created by Erinson Andres Romero Terry on 30/01/23.
//

import UIKit
import Foundation
protocol ViewControllerProtocol {
    func setName(_ name: String)
}

class ViewController: UIViewController {
    var presenter: Presenter?
    var configurator: Configurator?
    var namo: String?
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        presenter?.getName()
        if let nombre = namo {
            print(nombre)
        } else { print("nel")}
    }


}

extension ViewController: ViewControllerProtocol {
    func setName(_ name: String) {
        DispatchQueue.main.async {
            
            if let asd = self.namo {
                
            } else {
                self.namo = name
                self.viewDidLoad()
            }
            
            
        }
        
        
    }
    
    
}
