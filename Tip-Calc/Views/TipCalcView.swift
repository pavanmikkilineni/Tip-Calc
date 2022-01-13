//
//  TipCalcView.swift
//  Tip-Calc
//
//  Created by Pavan Mikkilineni on 07/01/22.
//

import SwiftUI

struct TipCalcView: View {
    
    //MARK: PROPERTIES
    @EnvironmentObject var viewModel:TipCalcViewModel
    @FocusState private var isActive:Bool
    
    //MARK: INIT
    init(){
        //overriding appearance of all segemented controls in the app
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("AccentColor"))
        
        let attributes:[NSAttributedString.Key:Any] = [.foregroundColor:UIColor.white]
        
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        
    }
    
    //MARK: BODY
    var body: some View {
        ScrollView{
            VStack(spacing:10){
                TitleView(title: "Bill Amount")
                textField
                TitleView(title: "Percentage")
                picker
                TitleView(title: "Split")
                SplitStepper(split: $viewModel.split)
                TitleView(title: "Per Person")
                ResultCardView(
                    totalAmount: viewModel.perPersonTotalAmount,
                    subTotalAmount: viewModel.perPersonSubTotalAmount,
                    tipAmount: viewModel.perPersonTipAmount
                )
                    .frame(height:125)
                TitleView(title: "Total")
                ResultCardView(
                    totalAmount: viewModel.totalAmount,
                    subTotalAmount: viewModel.subTotalAmount,
                    tipAmount: viewModel.tipAmount
                )
                    .frame(height:125)
            }
            .padding()
        }
        
    }
    
    var picker: some View{
        Picker(
            selection: $viewModel.selection,
            label: Text("Percentage"),
            content:{
                Text("5%").tag(0.05)
                Text("10%").tag(0.10)
                Text("15%").tag(0.15)
                Text("20%").tag(0.20)
            }
        )
            .pickerStyle(.segmented)
    }
    
    var textField: some View{
        HStack{
            Text("$")
                .font(.system(size:60,weight: .black,design: .rounded))
                .foregroundColor(.primary)
            TextField("Amount", text: $viewModel.text)
                .font(.system(size:60,weight: .black,design: .default))
                .focused($isActive)
                .keyboardType(.decimalPad)
                .toolbar(content: {
                    ToolbarItem(placement: .keyboard) {
                        Button("Done"){
                            isActive = false
                        }
                    }
                })
                
        }
    }
    
}

struct TipCalcView_Previews: PreviewProvider {
    static var previews: some View {
        TipCalcView()
    }
}
