//
//  ResultCardView.swift
//  Tip-Calc
//
//  Created by Pavan Mikkilineni on 12/01/22.
//

import SwiftUI

struct ResultCardView: View {
    
    //MARK: PROPERTIES
    var totalAmount:Double = 0.00
    var subTotalAmount:Double = 0.00
    var tipAmount:Double = 0.00
    
    //MARK:BODY
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(UIColor.systemGray))
            HStack{
                Spacer()
                Text("$ \(totalAmount,specifier:"%.2f")")
                    .font(.system(size:50,weight:.black,design: .default))
                    .foregroundColor(.white)
                Spacer()
                Divider()
                Spacer()
                VStack(alignment:.leading,spacing:10){
                    VStack(alignment:.leading){
                        Text("Subtotal".uppercased())
                            .font(.body)
                            .fontWeight(.black)
                            .foregroundColor(.secondary)
                        Text("$ \(subTotalAmount,specifier:"%.2f")")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                        
                        
                    }
                    VStack(alignment:.leading){
                        Text("Tip".uppercased())
                            .font(.body)
                            .fontWeight(.black)
                            .foregroundColor(.secondary)
                        Text("$  \(tipAmount,specifier:"%.2f")")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                        
                        
                    }
                }
                Spacer()
            }
        }
        
        
    }
}

struct ResultCardView_Previews: PreviewProvider {
    static var previews: some View {
        ResultCardView()
    }
}
