//
//  TipCalcView.swift
//  Tip-Calc
//
//  Created by Pavan Mikkilineni on 07/01/22.
//

import SwiftUI

struct TipCalcView: View {
    
    //MARK: PROPERTIES
    @EnvironmentObject private var viewModel:TipCalcViewModel
    @FocusState private var isActive:Bool
    private let percentages:[Int] = [5,10,15,20]
    
    //MARK: INIT
    init(){
        //overriding appearance of all segemented controls in the app
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("AccentColor"))
        
        let attributes:[NSAttributedString.Key:Any] = [.foregroundColor:UIColor.white]
        
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        
    }
    
    //MARK: BODY
    var body: some View {
        ScrollView(showsIndicators:false){
            VStack(spacing:10){
                TitleView(title: "Bill Amount")
                textField
                TitleView(title: "Percentage")
                picker
                TitleView(title: "Split")
                SplitStepper(split: $viewModel.split)
                TitleView(title: "Per Person")
                perPersonResultSection
                TitleView(title: "Total")
                totalResultSection
            }
            .padding()
        }
        
    }
    
}

extension TipCalcView{
    
    private var perPersonResultSection:some View{
        ResultCardView(
            totalAmount: viewModel.perPersonTotalAmount,
            subTotalAmount: viewModel.perPersonSubTotalAmount,
            tipAmount: viewModel.perPersonTipAmount
        )
            .frame(height:125)
        
    }
    
    private var totalResultSection:some View{
        ResultCardView(
            totalAmount: viewModel.totalAmount,
            subTotalAmount: viewModel.subTotalAmount,
            tipAmount: viewModel.tipAmount
        )
            .frame(height:125)
    }
    
    private var picker: some View{
        Picker(
            selection: $viewModel.selection,
            label: Text("Percentage"),
            content:{
                ForEach(percentages.indices,id:\.self){ percent in
                    Text("\(percentages[percent])%").tag(percent)
                }
            }
        )
            .pickerStyle(.segmented)
    }
    
    private var textField: some View{
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
