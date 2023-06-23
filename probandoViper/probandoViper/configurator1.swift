//
//  configurator1.swift
//  probandoViper
//
//  Created by Erinson Andres Romero Terry on 30/01/23.
//

import Foundation
import UIKit

class Configurator {
    
    static func Configuratorfunc() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let presenter = Presenter()
        let interactor = Interactor()
        
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        presenter.view = view
        view.presenter = presenter
        
        return view
        
    }
//     static func  Configuratorfunc() -> UIViewController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let view = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        let presenter = Presenter()
//        let interactor = Interactor()
//
//        presenter.interactor = interactor
//        interactor.presenter = presenter
//        presenter.view = view
//        view.presenter = presenter
//
//        return view
//
//    }
    
    
}
