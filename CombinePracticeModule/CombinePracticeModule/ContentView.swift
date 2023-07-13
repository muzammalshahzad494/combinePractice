//
//  ContentView.swift
//  CombinePracticeModule
//
//  Created by Muzammal Shahzad on 6/17/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        VStack {
            SignupView(viewModel: SignupViewModel())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


