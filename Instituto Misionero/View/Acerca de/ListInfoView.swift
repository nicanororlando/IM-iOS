//
//  ListInfoView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 07/11/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI

struct ListInfoView: View {
    @ObservedObject var adapted = Adapted()
    @State var navigateToDonaciones = false
    @State var navigateToAcercaDe = false
    @State private var showModal = false
    var navigateToListInfoView: Binding<Bool>
    
    var body: some View {
        ZStack{
//            Image("grupo3")
//                .resizable()
//                .scaledToFill()
//                .opacity(0.3)
    	
            VStack(alignment: .leading) {
            
                Group(){
                    VStack (alignment: .leading) {
                        Text("Redes sociales")
                            .font(.system(size: 20))
                            .fontWeight(.light)
                            .padding(.top, adapted.adaptedHeight(curHeight: 30))
                            .padding(.bottom, -(adapted.adaptedHeight(curHeight: 10)))
                    }.padding(.leading, 30)
                
                    // Instagram //
                    Button(action: {
                        let url = URL(string: "http://instagram.com/_u/instituto.misionero")!
                        let application = UIApplication.shared
                    
                        /// Check if the ig App is installed
                        if application.canOpenURL(url) {
                            application.open(url)
                        } else {
                            /// If ig App is not installed, open Safari with ig Link
                            application.open(URL(string: "http://instagram.com/_u/instituto.misionero")!)
                        }
                    }) {
                        Boton(image: "instagram", title: "Instagram", subTitle: "@instituto.misionero")
                    }
                    .frame(width: adapted.adaptedWidth(curWidth: 350))
                    .padding(.bottom, -(adapted.adaptedHeight(curHeight: 10)))
                    .padding(.top ,7)
                    .padding(.leading, adapted.adaptedWidth(curWidth: 30))
                    .padding(.trailing, adapted.adaptedWidth(curWidth: 30))
                    .buttonStyle(buttonList(padding: 5, bgColor: .white, fgColor: .black))
                    
                    // Facebook //
                    Button(action: {
                        let url = URL(string: "facebook.com/institutomisionero")!
                        let application = UIApplication.shared
                        
                        /// Check if the facebook App is installed
                        if application.canOpenURL(url) {
                            application.open(url)
                        } else {
                            /// If Facebook App is not installed, open Safari with Facebook Link
                            application.open(URL(string: "facebook.com/institutomisionero")!)
                        }
                    }) {
                        Boton(image: "facebook", title: "Facebook", subTitle: "facebook.com/institutomisionero")
                    }
                    .frame(width: adapted.adaptedWidth(curWidth: 350))
                    .padding(.bottom, -(adapted.adaptedHeight(curHeight: 10)))
                    .padding(.leading, adapted.adaptedWidth(curWidth: 30))
                    .padding(.trailing, adapted.adaptedWidth(curWidth: 30))
                    .buttonStyle(buttonList(padding: 5, bgColor: .white, fgColor: .black))
                    
                    // Youtube //
                    Button(action: {
                        let url = URL(string: "youtube.com/institutomisionero")!
                        let application = UIApplication.shared
                        
                        /// Check if the yt App is installed
                        if application.canOpenURL(url) {
                            application.open(url)
                        } else {
                            /// If yt App is not installed, open Safari with yt Link
                            application.open(URL(string: "https://www.youtube.com/user/InstitutoMisionerUAP")!)
                        }
                    }) {
                        Boton(image: "youtube", title: "Youtube", subTitle: "youtube.com/institutomisionero")
                    }
                    .frame(width: adapted.adaptedWidth(curWidth: 350))
                    .padding(.leading, adapted.adaptedWidth(curWidth: 30))
                    .padding(.trailing, adapted.adaptedWidth(curWidth: 30))
                    .buttonStyle(buttonList(padding: 5, bgColor: .white, fgColor: .black, edges: [.top, .bottom]))
                    .padding(.bottom, 15)
                }// --> Group redes sociales
            
                Group() {
                    VStack(alignment: .leading) {
                            Text("Sobre nosotros")
                            .font(.system(size: 20))
                            .fontWeight(.light)
                            .padding(.top, adapted.adaptedHeight(curHeight: 10))
                            .padding(.bottom, -(adapted.adaptedHeight(curHeight: 10)))
                    }.padding(.leading, 30)
            
                    VStack(alignment: .center) {
                
                        // Acerca de //
                        NavigationLink(
                            destination: AcercaDeLaApp(navigateToAcercaDe: $navigateToAcercaDe),
                            isActive: $navigateToAcercaDe,
                            label: {
                                Button(action: {
                                    self.navigateToAcercaDe = true
                                }) {
                                    Boton(image: "informacion", title: "Acerca de esta App", subTitle: "", sub: false)
                                }
                                .frame(width: adapted.adaptedWidth(curWidth: 350))
                                .padding(.leading, adapted.adaptedWidth(curWidth: 30))
                                .padding(.trailing, adapted.adaptedWidth(curWidth: 30))
                                .buttonStyle(buttonList(padding: 10, bgColor: .white, fgColor: .black))
                                .padding(.top, 7)
                                .padding(.bottom, -(adapted.adaptedHeight(curHeight: 14)))
                            }
                        )
                
                        // Donaciones //
                        NavigationLink(
                            destination: Donaciones(navigateToDonaciones: $navigateToDonaciones),
                            isActive: $navigateToDonaciones,
                            label: {
                                Button(action: {
                                    self.navigateToDonaciones = true
                                }) {
                                    Boton(image: "pago", title: "Donaciones", subTitle: "", sub: false)
                                }
                                .frame(width: adapted.adaptedWidth(curWidth: 350))
                                .padding(.leading, adapted.adaptedWidth(curWidth: 30))
                                .padding(.trailing, adapted.adaptedWidth(curWidth: 30))
                                .buttonStyle(buttonList(padding: 10, bgColor: .white, fgColor: .black, edges: [.top, .bottom]))
                            }
                        )
                    }// --> Group sobre nosotros
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                }// --> Group potoca
                Spacer()
           }// --> VStack potoca
           .navigationBarBackButtonHidden(true)
           .navigationBarTitle("", displayMode: .inline)
           .navigationBarHidden(false)
           .navigationBarItems(leading: Button(action: {
               self.navigateToListInfoView.wrappedValue = false
           }) {
              HStack{
                  Image("icons8-atras")
                      .resizable()
                      .frame(width: adapted.adaptedWidth(curWidth: 31), height: adapted.adaptedWidth(curWidth: 31), alignment: .center)
                  Text("im")
                      .font(.system(size: adapted.adaptedWidth(curWidth: 18)))
                      .offset(x: -(adapted.adaptedWidth(curWidth: 15)))
                  Spacer()
              }
              .frame(width: adapted.adaptedWidth(curWidth: 400), height: 60, alignment: .center)
           }.padding(7))
            
        }// --> ZStack
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }// --> body
}

struct EdgeBorder: Shape {

var width: CGFloat
var edges: [Edge]

func path(in rect: CGRect) -> Path {
    var path = Path()
    for edge in edges {
        var x: CGFloat {
            switch edge {
            case .top, .bottom, .leading: return rect.minX
            case .trailing: return rect.maxX - width
            }
        }

        var y: CGFloat {
            switch edge {
            case .top, .leading, .trailing: return rect.minY
            case .bottom: return rect.maxY - width
            }
        }

        var w: CGFloat {
            switch edge {
            case .top, .bottom: return rect.width
            case .leading, .trailing: return self.width
            }
        }

        var h: CGFloat {
            switch edge {
            case .top, .bottom: return self.width
            case .leading, .trailing: return rect.height
            }
        }
        path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

struct Boton: View {
    
    let image: String
    let title: String
    let subTitle: String
    var sub: Bool = true
    @ObservedObject var adapted = Adapted()
    
    var body: some View {
        HStack{
            Image(image)
                .resizable()
                .frame(width: adapted.adaptedHeight(curHeight: 35), height: adapted.adaptedHeight(curHeight: 35), alignment: .center)
                .padding(.trailing, 5)
            VStack(alignment: .leading){
                Text(title)
                    .font(.system(size: adapted.adaptedHeight(curHeight: 20)))
                
                if(sub){
                    Text(subTitle)
                        .font(.subheadline)
                }
            }
            Spacer()
        }
    }
}

struct buttonList: ButtonStyle {
    var font: Font = .title
    var padding: CGFloat = 0
    var bgColor: Color = Color.white
    var fgColor: Color = Color.black
    var cornerRadius: CGFloat = 10
    var edges: [Edge] = [.top]
    var linewidth: CGFloat = 0.3
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font)
            .padding(padding)
            .background(bgColor)
            .foregroundColor(fgColor)
            .cornerRadius(cornerRadius)
            .overlay(EdgeBorder(width: 0.5, edges: edges).foregroundColor(fgColor))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut)
    }
}

struct ListInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ListInfoView(navigateToListInfoView: .constant(true))
    }
}

