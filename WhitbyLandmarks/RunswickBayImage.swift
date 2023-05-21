//
//  RunswickBayImage.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 19/05/2023.
//

import SwiftUI

struct RunswickBayImage: View {
    var body: some View {
        Image("runswick-bay")
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 0.50))
            .frame(height:300);
    }
}


struct RunswickBayImage_Previews: PreviewProvider {
    static var previews: some View {
        RunswickBayImage()
    }
}
