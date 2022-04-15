//
//  main.swift
//  StudentApp
//
//  Created by Smith Huamani Hilario on 29/03/22.
//

import Foundation

var option: MenuOption
let menu = Menu()
//let inputManager = InputManager()
var manager = StudentManager()

repeat {
    
    menu.show()
    
    let value = Input.Integer.init(message: "Ingrese el número de opción que desea ver",
                                   errorMessage: "La opción ingresa es incorrecta", range: 1...5).getInput()
    
    option = MenuOption(rawValue: Int(value) ?? 0) ?? .none
    
    switch option {
        case .none: break
        case .add: manager.register()
        case .list: manager.list()
        case .search: manager.search()
        case .delete: manager.delete()
        case .exit: break
    }
    
    let _ = readLine()
        
} while option != .exit && option != .none


