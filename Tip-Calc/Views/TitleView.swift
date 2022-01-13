//
//  TitleView.swift
//  Tip-Calc
//
//  Created by Pavan Mikkilineni on 12/01/22.
//

import SwiftUI

struct TitleView: View {
    
    //MARK: PROPERTIES
    let title:String
    
    //MARK: BODY
    var body: some View {
        HStack{
            Text(title.uppercased())
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Percentage")
    }
}
