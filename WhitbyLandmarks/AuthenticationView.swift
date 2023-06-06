//
//  AuthenticationView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 06/06/2023.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack() {
               Rectangle()
                   .fill(Color.red)
                   .frame(width: 100, height: 50)
               Rectangle()
                   .fill(Color.blue)
                   .frame(width:50, height: 100)
           }
           .border(Color.green, width: 1)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
