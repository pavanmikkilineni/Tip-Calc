//
//  Tip_CalcApp.swift
//  Tip-Calc
//
//  Created by Pavan Mikkilineni on 07/01/22.
//

import SwiftUI

@main
struct Tip_CalcApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TipCalcView()
                    .navigationTitle("Tip Calc 🧾")
            }
            .navigationViewStyle(.stack)
            .environmentObject(TipCalcViewModel())
            
        }
    }
}
