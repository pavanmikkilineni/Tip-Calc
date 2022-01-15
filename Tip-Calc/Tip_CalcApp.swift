//
//  Tip_CalcApp.swift
//  Tip-Calc
//
//  Created by Pavan Mikkilineni on 07/01/22.
//

import SwiftUI

@main
struct Tip_CalcApp: App {
    
    @StateObject private var viewModel:TipCalcViewModel = TipCalcViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TipCalcView()
                    .navigationTitle("Tip Calc 🧾")
            }
            .navigationViewStyle(.stack)
            .environmentObject(viewModel)
            
        }
    }
}
