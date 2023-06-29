//
//  LoginView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 14/06/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .center) {
          // Space Between
          Branding()
          Spacer()
          // Alternating Views and Spacers
          LoginForm()
        }
        .padding(.horizontal, 0)
        .padding(.top, 80)
        .padding(.bottom, 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(
          LinearGradient(
            stops: [
              Gradient.Stop(color: Color(red: 1, green: 0.41, blue: 0.47), location: 0.00),
              Gradient.Stop(color: Color(red: 0.49, green: 0.36, blue: 1), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: -1.3),
            endPoint: UnitPoint(x: 0.5, y: 1)
          )
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
