//
//  CRUDList.swift
//  CombinePracticeModule
//
//  Created by Muzammal Shahzad on 6/17/23.
//

import SwiftUI

struct CRUDListView: View {
    var body: some View {
        VStack {
            Text("CRUD List")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            // Implement your CRUD list here
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

struct CRUDListView_Previews: PreviewProvider {
    static var previews: some View {
        CRUDListView()
    }
}
