//
//  MenuOption.swift
//  StudentApp
//
//  Created by Smith Huamani Hilario on 29/03/22.
//

import Foundation

enum MenuOption: Int {
    case none   = 0
    case add    = 1
    case list   = 2
    case search = 3
    case delete = 4
    case exit   = 5
}

struct Menu {
    
    func show() {
        
        let message = """
        
        
        ======================================
                    MI APLICACIÓN
        ======================================
        
        1. Agregar nuevo alumno
        2. Listar todos los alumnos
        3. Buscar un alumno por nombre
        4. Eliminar un alumno
        5. Salir
                
        """
        self.clearConsole()
        print(message)
    }
    
    private func clearConsole() {
        let separator = Array(repeating: "\n", count: 20).joined()
        print("", terminator: separator)//Al finalizar una operación agregar un texto
    }

}
