//
//  ModalView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 06/02/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    
    @ObservedObject var adapted = Adapted()
    @Binding var isShowing: Bool
    @State private var isDragging = false
    @State var navigateToListInfoView = false
    @State var curHeight: CGFloat
    
    var minHeight: CGFloat {
        return adapted.adaptedHeight(curHeight: 450)
    }
    var maxHeight: CGFloat {
        return adapted.adaptedHeight(curHeight: 700)
    }
    
    let startOpacity: Double = 0.5
    let endOpacity: Double = 0.8
    
    //Funcion para la opacidad
    var dragPercentage: Double {
        let res = Double((curHeight - minHeight) / (maxHeight - minHeight))
        return max(0, min(1, res))
    }
    //Padding top en funcion de la altura
    var paddingTop: CGFloat {
        let res = CGFloat(((-2/5)*curHeight) + adapted.adaptedHeight(curHeight: 180))
        return res
    }
    //Padding bottom en funcion de la altura
    var paddingBottom: CGFloat {
        let res = CGFloat(((2/5)*curHeight) - 380)
        return res
    }

    var body: some View {
        ZStack(alignment: .bottom){
            if(isShowing){
                Color.black
                    .opacity(startOpacity + (endOpacity - startOpacity) * dragPercentage)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.isShowing = false
                }
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.all)
        .animation(.easeInOut)
    }// --> End body

var mainView: some View {
    VStack{
        ZStack{
            Capsule()
                .frame(width: adapted.adaptedWidth(curWidth: 45), height: adapted.adaptedHeight(curHeight: 6))
        }// --> ZStack Capsule
        .frame(height: adapted.adaptedHeight(curHeight: 35))
        .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001)) ///Importante para el dragging
            .gesture(dragGesture)
        
        // Vista Interior //
        ZStack{
            VStack(alignment: .center){
                HStack{
                    Image("icono_im")
                        .resizable()
                        .frame(width: adapted.adaptedHeight(curHeight: 80), height: adapted.adaptedHeight(curHeight: 80))

                    VStack(alignment: .leading){
                        Text("Instituto")
                            .fontWeight(.bold)
                            .font(.system(size: adapted.adaptedHeight(curHeight: 25), weight: .regular))
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color(UIColor(named: "dark-red")!))
                        Text("Misionero")
                            .fontWeight(.bold)
                            .font(.system(size: adapted.adaptedHeight(curHeight: 25), weight: .regular))
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color(UIColor(named: "dark-grey")!))
                        
                        }// -> VStack IM
                }// -> HStack icono + IM
                .padding(.vertical, 10)
                
                Group{
                
                Text("Somos un grupo de jóvenes misioneros de la Universidad Adventista del Plata, que llevamos esperanza y salud al mundo.")
                    .fontWeight(.light)
                    .font(.system(size: adapted.adaptedHeight(curHeight: 20), weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, adapted.adaptedWidth(curWidth: 490) - (35840 / adapted.screenHeight))
                    .multilineTextAlignment(.center)
                
                Text("¡Proclamamos la 2º venida de Jesús!")
                    .fontWeight(.light)
                    .font(.system(size: adapted.adaptedHeight(curHeight: 20), weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 10)
                
                Text("Nuestro principal objetivo es ser misioneros como lo fue Jesús. Así seguir su ejemplo a partir del estudio de su Palabra y la práctica del espíritu de servicio en todos los ministerios que él realizaba: “Recorría Jesús todas las ciudades y aldeas, enseñando en las sinagogas de ellos, y predicando el evangelio del reino, y sanando toda enfermedad y toda dolencia en el pueblo.”")
                    .font(.system(size: adapted.adaptedHeight(curHeight: 20), weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, adapted.adaptedWidth(curWidth: 490) - (35840 / adapted.screenHeight))
                    .padding(.bottom, 40)
                    
                if(adapted.screenHeight >= 700){
                    
                    // Boton Acerca de Nosotros //
                    NavigationLink(
                    destination: ListInfoView(navigateToListInfoView: $navigateToListInfoView),
                    isActive: $navigateToListInfoView,
                    label: {
                        Button(action: {
                            self.navigateToListInfoView = true
                        }) {
                        HStack{
                            Image(systemName: "info.circle")
                            Text("Mas info")
                                .fontWeight(.bold)
                            }
                        }
                        .buttonStyle(filledRoundedCornerButtonStyle(font: .title, padding: adapted.adaptedWidth(curWidth: 10), bgColor: Color(UIColor(named: "dark-red")!).opacity(0.8), bgColor2: Color(UIColor(named: "dark-red")!).opacity(0.8), fgColor: .white, cornerRadius: 10, opacity: 1, X: 0, Y: -(adapted.adaptedHeight(curHeight: 30)), linewidth: 0))
                        .padding(.bottom, 20)
                    })
                }
            
                }// --> Group texto
            }// --> VStack interno
            
        }// --> ZStack
        .frame(maxHeight: .infinity)
        .padding(.top, paddingTop)
        .padding(.bottom, paddingBottom)
        .background(Color.white.opacity(0.6))
        
    }// --> VStack potoca
    .frame(height: curHeight)
    .frame(maxWidth: .infinity)
    .background(// Bordes superiores redondeados
        ZStack{
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .frame(width: adapted.screenWidth, height: curHeight)
        }// --> ZStack
        .foregroundColor(Color(UIColor(named: "dark-red")!).opacity(0.7))
    )// --> Background
    .animation(isDragging ? nil  : .easeInOut(duration: 0.45))
    .onDisappear { self.curHeight = self.minHeight }
}// --> End mainView
    
    @State private var prevDragTranslation = CGSize.zero

    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !self.isDragging {
                    self.isDragging = true
                }
                let dragAmount = val.translation.height - self.prevDragTranslation.height
                
                if self.curHeight > self.maxHeight || self.curHeight < self.minHeight {
                    self.curHeight -= dragAmount / 6
                } else{
                    self.curHeight -= dragAmount
                }
                
                self.prevDragTranslation = val.translation
            }
            .onEnded { val in
                self.prevDragTranslation = .zero
                self.isDragging = false
                
                if self.curHeight > self.maxHeight {
                    self.curHeight = self.maxHeight
                }
                else if self.curHeight < self.minHeight {
                    self.isShowing = false
                }
                else { self.curHeight = self.maxHeight }
            }
    }// --> End dragGesture
    
}// --> End ModalView

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        .previewDevice("iPhone 11 Pro")
        //ModalView(isShowing: .constant(true))
    }
}
