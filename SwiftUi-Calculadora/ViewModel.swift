//
//  ViewModel.swift
//  SwiftUi-Calculadora
//
//  Created by Juan Cruz on 26/05/2022.
//

import Foundation

final class ViewModel : ObservableObject {
    @Published var textFieldValue: String = "0"
    
    var textFieldSavedValue: String = "0"
    var currentOperationToExcute: OperationType?
    var shouldRunOperation: Bool = false
    
    func logic(key: KeyboardButton){
        switch key.type{
        case.number(let value):
            if shouldRunOperation{
                textFieldValue = "0"
            }
            textFieldValue = textFieldValue == "0" ? "\(value)" : textFieldValue + "\(value)"
        case.reset:
            textFieldValue = "0"
            textFieldSavedValue = "0"
            currentOperationToExcute = nil
            shouldRunOperation = false
        case.result:
            guard let operation = currentOperationToExcute else {
                return
            }
            switch operation {
            case .sum:
                textFieldValue = "\(Int(textFieldValue)! + Int(textFieldSavedValue)!)"
            case .multiplication:
                textFieldValue = "\(Int(textFieldValue)! * Int(textFieldSavedValue)!)"
            }
        case.operation(let type):
            textFieldSavedValue = textFieldValue
            currentOperationToExcute = type
            shouldRunOperation = true
        
        }
    }
    
}
