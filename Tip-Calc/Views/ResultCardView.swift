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
            backgroundLayer
            HStack{
                Spacer()
                totalSection
                Spacer()
                Divider()
                Spacer()
                VStack(alignment:.leading,spacing:10){
                    subTotalSection
                    tipSection
                }
                Spacer()
            }
        }
        
        
    }
}

extension ResultCardView{
    
    private var backgroundLayer:some View{
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(Color(UIColor.systemGray))
    }
    
    private var totalSection:some View{
        Text("$ \(totalAmount,specifier:"%.2f")")
            .font(.system(size:40,weight:.black,design: .default))
            .minimumScaleFactor(0.1)
            .foregroundColor(.white)
    }
    
    private var subTotalSection:some View{
        VStack(alignment:.leading){
            Text("Subtotal".uppercased())
                .font(.body)
                .fontWeight(.black)
                .minimumScaleFactor(0.1)
                .foregroundColor(.secondary)
            Text("$ \(subTotalAmount,specifier:"%.2f")")
                .font(.title)
                .fontWeight(.black)
                .minimumScaleFactor(0.1)
                .foregroundColor(.white)
        }
    }
    
    private var tipSection:some View{
        VStack(alignment:.leading){
            Text("Tip".uppercased())
                .font(.body)
                .fontWeight(.black)
                .minimumScaleFactor(0.1)
                .foregroundColor(.secondary)
            Text("$  \(tipAmount,specifier:"%.2f")")
                .font(.title)
                .fontWeight(.black)
                .minimumScaleFactor(0.1)
                .foregroundColor(.white)
            
            
        }
    }
}

struct ResultCardView_Previews: PreviewProvider {
    static var previews: some View {
        ResultCardView()
    }
}
