//
//  Stepper.swift
//  Tip-Calc
//
//  Created by Pavan Mikkilineni on 12/01/22.
//

import SwiftUI

struct SplitStepper: View {
    
    //MARK: PROPERTIES
    
    @Binding var split:Int
    
    // MARK: BODY
    
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Button(action: {
                increment()
            }) {
                Image(systemName: "plus.circle")
                    .font(.title)
            }
            Text("\(split)")
                .font(.title)
                .bold()
            Button(action: {
                decrement()
            }) {
                Image(systemName: "minus.circle")
                    .font(.title)
            }
        }
    }
    
    //MARK: FUNCTIONS
    
    func increment(){
        if (split<10){
            split += 1
        }
    }
    
    func decrement(){
        if (split>1){
            split -= 1
        }
    }
}

struct Stepper_Previews: PreviewProvider {
    static var previews: some View {
        SplitStepper(split: .constant(10))
    }
}
