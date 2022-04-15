//
//  StudentManager.swift
//  StudentApp
//
//  Created by Smith Huamani Hilario on 29/03/22.
//

import Foundation


struct Student {
    let name: String
    let lastName: String
    let address: String
    let documentNumber: String
    let dateOfBirth: String
}

extension Student {
    
    var initialName: String {
        return String(self.name.uppercased().prefix(1))
    }
    
    var initialLastName: String {
        return String(self.lastName.uppercased().prefix(1))
    }
    
    var initialFullName: String {
        return initialName + initialLastName
    }
    
    var fullName: String {
        return "\(self.name) \(self.lastName)"
    }
}


struct StudentManager {
    
//    var inputManager: InputManager
    var students: [Student]

    init() {
//        self.inputManager = manager
        self.students = []
    }
    
    // Student add
    mutating func register() {
        
        let name = Input.Text(message: "Ingrese su nombre", errorMessage: "Nombre ingresado es incorrecto", minLength: 0, maxLength: 15).getInput()
        let lastName = Input.Text(message: "Ingrese su apellido", errorMessage: "Apellido ingresado es incorrecto", minLength: 0, maxLength: 15).getInput()
        let address = Input.Text(message: "Ingrese su dirección", errorMessage: "Dirección ingresado es incorrecto", minLength: 0, maxLength: 20).getInput()
        let documentNumber = Input.Text(message: "Ingrese su número de documento", errorMessage: "Documento ingresado es incorrecto", minLength: 0, maxLength: 8).getInput()
        let dateOfBirth = Input.Text(message: "Ingrese su fecha de nacimiento", errorMessage: "Fecha de nacimiento ingresado es incorrecto", minLength: 0, maxLength: 10).getInput()

        let student = Student(name: name, lastName: lastName, address: address, documentNumber: documentNumber, dateOfBirth: dateOfBirth)
        self.students.append(student)
    }
    
    func list() {
        
        print("============= LISTAR ALUMNOS =================\n")
        
        students.sorted(by: { $0.initialLastName < $1.initialLastName }).forEach { student in
            print(student.initialFullName + " - " + student.fullName)
        }
    }
    
    func search() {
        let dniToSearch = Input.Text(message: "Buscar por número de documento", errorMessage: "Documento ingresado es incorrecto", minLength: 0, maxLength: 8).getInput()
        
        let filteredStudent = students.filter({ $0.documentNumber == dniToSearch })
        
        if filteredStudent.isEmpty {
            print("El número de documento no se encuentra registrado")
        } else {
            filteredStudent.forEach { student in
                print("Resultado de Busqueda")
                print("======================")
                print("Fecha de Nacimiento: \(student.dateOfBirth)")
                print("Nombre completo: \(student.fullName)")
                print("Dirección: \(student.address)")
                print("Iniciales: \(student.initialFullName)")
            }
        }

    }
    
    mutating func delete() {
        let dniToSearch = Input.Text(message: "Buscar por número de documento", errorMessage: "Documento ingresado es incorrecto", minLength: 0, maxLength: 8).getInput()
        
        let searchStudent = students.firstIndex(where: { $0.documentNumber == dniToSearch })
        
        if let student = searchStudent {
            
            let value = Input.Integer(message: "¿Desea eliminar al Alumno?\n1.SI\n2.NO", errorMessage: "", range: 1...2).getInput()
            
            let status = ConfirmationStatus(rawValue: Int(value) ?? 1) ?? .no
            
            switch status {
            case .yes:
                self.students.remove(at: Int(student))
                print("Eliminado exitosamente")
            case .no:
                break
            }
            
        } else {
            print("======================")
            print("El número de documento no se encuentra registrado")
            print("======================")
        }

    }
    
}

enum ConfirmationStatus: Int {
    case yes = 1
    case no
    
    func showMessage() {
        let message = """
        1. SI
        2. NO
        """
        print(message)
    }
}

/*
 * Al eliminar un alumno, se debe buscar previamente por número de documento. En caso se encuentre registrado, se deberá pedir una confirmación antes de eliminarlo.
 */
