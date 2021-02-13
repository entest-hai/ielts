//
//  TestView.swift
//  IELTS
//
//  Created by hai on 13/2/21.
//  Copyright © 2021 biorithm. All rights reserved.
//

import SwiftUI

struct Ocean: Identifiable, Hashable {
    let name: String
    let id  = UUID()
}

struct TestView: View {
    private var oceans = [
        Ocean(name: "Hai"),
        Ocean(name: "Minh"),
        Ocean(name: "Tran")]
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        NavigationView {
            List(self.oceans, selection: self.$multiSelection){ocean in
                Text(ocean.name)
            }
        .navigationBarItems(trailing: EditButton())
            .navigationBarTitle(Text("Oceans"))
            
        }
    }
}

