//
//  InputManager.swift
//  StudentApp
//
//  Created by Smith Huamani Hilario on 29/03/22.
//

import Foundation
/*
struct InputManager {
    
    func getDoubleWith(_ message: String) -> Double {
        
        var input: String? = nil
        repeat {
            print(message)
            input = readLine()
        } while input?.count == 0
        
        return Double(input!)!
    }
    
    func getIntWith(_ message: String, errorMessage: String, withRange range: ClosedRange<Int>) -> Int {
            
        var isCorrect = false
        var number = 0
        repeat {
            
            print(message)
            if let inputValue = readLine(), inputValue.count > 0, let value = Int(inputValue), range.contains(value) {
                number = value
                isCorrect = true
            } else {
                self.showErrorMessage(errorMessage)
            }
            
        } while !isCorrect
        
        return number
    }

    
    func getStringWith(_ message: String, errorMessage: String) -> String {
        var input = ""
        repeat {
            print(message)
            if let inputValue = readLine(), inputValue.count > 0 {
                input = inputValue
            } else {
                self.showErrorMessage(errorMessage)
            }
            
        } while input.count == 0
        
        return input
    }
    
    func showErrorMessage(_ errorMessage: String) {
        let message = """
        =====================================
        ERROR EN EL VALOR: \(errorMessage)
        =====================================
        """
        print(message)
    }
}
*/
 
 protocol InputRequest {
     var message: String { get }
     var errorMessage: String { get }
     func validate(_ inputValue: String) -> Bool
     func showErrorMessage()
 }

 extension InputRequest {
     
     func getInput() -> String {
         
         self.showMessage()
         let inputValue = readLine() ?? ""
         if self.validate(inputValue) {
             return inputValue
         } else {
             self.showErrorMessage()
             return self.getInput()
         }
     }
     
     func showErrorMessage() {
         print("""
         
         ⚠️ ERROR: \(self.errorMessage)
         Presione Enter para continuar ↩️
         
         """)
         let _ = readLine()
     }
     
     func showMessage() {
         print("~ ✅ ~ \(self.message):")
     }
 }

 struct Input { }

 extension Input {
     
     struct Text: InputRequest {
         let message: String
         let errorMessage: String
         let minLength: Int
         var maxLength: Int = Int.max
         
         func validate(_ inputValue: String) -> Bool {
             (self.minLength...self.maxLength).contains(inputValue.count)
         }
     }
 }

 extension Input {
     
     struct Integer: InputRequest {
         let message: String
         let errorMessage: String
         let range: ClosedRange<Int>
         
         func validate(_ inputValue: String) -> Bool {
             guard let value = Int(inputValue) else { return false }
             return self.range.contains(value)
         }
         
         func showErrorMessage() {
             print("""
             
             ⚠️ ERROR: \(self.errorMessage)
             El valor ingresado deberá estar entre \(range.min() ?? 0) y \(range.max() ?? 0)
             Presione Enter para continuar ↩️
             
             """)
             let _ = readLine()
         }
     }
 }
