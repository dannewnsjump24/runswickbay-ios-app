//
//  Branding.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 29/06/2023.
//

import SwiftUI

struct Branding: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image("Union")
              .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(0)
        .frame(width: 236, height: 32.14286, alignment: .leading)
    }
}

struct Branding_Previews: PreviewProvider {
    static var previews: some View {
        Branding()
    }
}
