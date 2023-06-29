//
//  LoginForm.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 29/06/2023.
//

import SwiftUI

struct LoginForm: View {
    var body: some View {
        HStack(alignment: .top, spacing: 40) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Log in")
                  .font(Font.custom("Comfortaa", size: 26))
                  .foregroundColor(Color(red: 0.98, green: 0.97, blue: 1))
                  .frame(maxWidth: .infinity, minHeight: 29, maxHeight: 29, alignment: .topLeading)
                
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .center, spacing: 10) {
                                HStack(alignment: .center, spacing: 0) {
                                    Text("Email address")
                                      .font(Font.custom("Montserrat", size: 18))
                                      .kerning(0.36)
                                      .foregroundColor(Color(red: 0.98, green: 0.97, blue: 1))
                                      .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(.leading, 0)
                                .padding(.trailing, 219)
                                .padding(.vertical, 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 0)
                        .padding(.top, 0)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .bottomLeading)
                    
                    }
                    .padding(.horizontal, 0)
                    .padding(.top, 0)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, minHeight: 58, maxHeight: 58, alignment: .bottomLeading)
        
                }
                .padding(0)
                .frame(width: 350, alignment: .topLeading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity, minHeight: 498, maxHeight: 498, alignment: .topLeading)
        .cornerRadius(40)
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
