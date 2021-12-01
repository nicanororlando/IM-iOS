//
//  ListInfoView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 07/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct ListInfoView: View {
    
    var body: some View {
        NavigationView{
        
          VStack{
            Button(action: {
                let url = URL(string: "fb://profile/<PAGE_ID>")!
                let application = UIApplication.shared
                
                /// Check if the facebook App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    // If Facebook App is not installed, open Safari with Facebook Link
                    application.open(URL(string: "http://instagram.com/_u/instituto.misionero")!)
                }
            }) {
                Boton(image: "star.fill", title: "Instagram", subTitle: "@instituto.misionero")
            }
            Button(action: {
                let url = URL(string: "fb://profile/<PAGE_ID>")!
                let application = UIApplication.shared
                
                /// Check if the facebook App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    // If Facebook App is not installed, open Safari with Facebook Link
                    application.open(URL(string: "https://de-de.facebook.com/apple")!)
                }
            }) {
                Boton(image: "star", title: "Facebook", subTitle: "facebook.com/institutomisionero")
            }
            Button(action: {
                let url = URL(string: "fb://profile/<PAGE_ID>")!
                let application = UIApplication.shared
                
                /// Check if the facebook App is installed
                if application.canOpenURL(url) {
                    application.open(url)
                } else {
                    // If Facebook App is not installed, open Safari with Facebook Link
                    application.open(URL(string: "https://www.youtube.com/user/InstitutoMisionerUAP")!)
                }
            }) {
                Boton(image: "star.fill", title: "Youtube", subTitle: "youtube.com/institutomisionero")
            }
            Button(action: {
                
            }) {
                HStack{
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("Acerca de esta app")
                        .font(.title)
                    Spacer()
                }
                .frame(width: 400, height: 60, alignment: .center)
                .foregroundColor(.black)
            }
            Button(action: {
                
            }) {
                HStack{
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    Text("Donaciones")
                        .font(.title)
                    Spacer()
                }
                .frame(width: 400, height: 60, alignment: .center)
                .foregroundColor(.black)
            }
            Spacer()
          }
          .navigationBarTitle("Acerca de")
          .padding(15)
        }
    }
}

struct ListInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ListInfoView()
    }
}

struct Boton: View {
    
    let image: String
    let title: String
    let subTitle: String
    
    var body: some View {
        HStack{
            Image(systemName: image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
            VStack(alignment: .leading){
                Text(title)
                    .font(.title)
                Text(subTitle)
                    .font(.subheadline)
            }
            Spacer()
        }
        .frame(width: 400, height: 60, alignment: .center)
        .foregroundColor(.black)
        .padding(5)
    }
}
