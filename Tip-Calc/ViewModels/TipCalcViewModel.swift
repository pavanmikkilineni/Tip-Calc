//
//  TipCalcViewModel.swift
//  Tip-Calc
//
//  Created by Pavan Mikkilineni on 13/01/22.
//

import Foundation

class TipCalcViewModel : ObservableObject{
    
    @Published var split:Int = 1{
        didSet{
            calculateTip()
        }
    }
    @Published var selection:Double = 0.05
    {
        didSet{
            calculateTip()
        }
    }
    @Published var text:String = ""
    {
        didSet{
            calculateTip()
        }
    }
    
    @Published var totalAmount:Double = 0.00
    @Published var subTotalAmount:Double = 0.00
    @Published var tipAmount:Double = 0.00
    @Published var perPersonTotalAmount:Double = 0.00
    @Published var perPersonSubTotalAmount:Double = 0.00
    @Published var perPersonTipAmount:Double = 0.00
    
    
    func calculateTip(){
        let bill = Double(text) ?? 0.00
        let persons = Double(split) 
        tipAmount = bill * selection
        perPersonTipAmount = tipAmount / persons
        subTotalAmount = bill
        perPersonSubTotalAmount = bill / persons
        totalAmount = subTotalAmount + tipAmount
        perPersonTotalAmount = perPersonSubTotalAmount + perPersonTipAmount
    }
    
    
}
