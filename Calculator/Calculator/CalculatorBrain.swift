//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by dd_tiger on 2017/9/12.
//  Copyright © 2017年 dd_tiger. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos)
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            }
        }
    }
    
    mutating func setOperated(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get
        {
            return accumulator
        }
    }
    
}
