//
//  ModalView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 06/02/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var isShowing: Bool
    @State private var curHeight: CGFloat = 450
    @State private var isDragging = false
    
    let minHeight: CGFloat = 450
    let maxHeight: CGFloat = 700
    
    let startOpacity: Double = 0.4
    let endOpacity: Double = 0.8
    
    var dragPercentage: Double {
        let res = Double((curHeight - minHeight) / (maxHeight - minHeight))
        return max(0, min(1, res))
    }
    
    //Padding top en funcion de la altura
    var paddingTop: CGFloat {
        let res = CGFloat(((-2/5)*curHeight) + 180)
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
        ///Handle
        ZStack {
            Capsule()
                .frame(width: 40, height: 6)
        }
        .frame(height: 40)
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.00001)) ///Importante para el dragging
            .gesture(dragGesture)
        
        ZStack{
            VStack(alignment: .center){
                HStack{
                    Image("icono_im")
                        .resizable()
                        .frame(width: 80, height: 80)

                    VStack(alignment: .leading){
                        Text("Instituto")
                            .fontWeight(.bold)
                            .font(.system(size: 25, weight: .regular))
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color(UIColor(named: "dark-red")!))
                        Text("Misionero")
                            .fontWeight(.bold)
                            .font(.system(size: 25, weight: .regular))
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(Color(UIColor(named: "dark-grey")!))
                        
                        }// -> VStack
                }// -> HStack
                .padding(.bottom, 10)
            
                Text("Somos un grupo de jóvenes misioneros de la Universidad Adventista del Plata, que llevamos esperanza y salud al mundo.")
                    .font(.system(size: 20, weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 450)
                    .multilineTextAlignment(.center)
                
                Text("Proclamamos la 2º venida de Jesús.")
                    .font(.system(size: 20, weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 10)
                
                Text("Nuestro principal objetivo es ser misioneros como lo fue Jesús. Así seguir su ejemplo a partir del estudio de su Palabra y la práctica del espíritu de servicio en todos los ministerios que él realizaba: “Recorría Jesús todas las ciudades y aldeas, enseñando en las sinagogas de ellos, y predicando el evangelio del reino, y sanando toda enfermedad y toda dolencia en el pueblo.”")
                    .font(.system(size: 20, weight: .regular))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 450)
                    .padding(.bottom, 40)
                
                Button(action: {
                    
                }) {
                HStack{
                    Image(systemName: "info.circle")
                    Text("Mas info")
                        .fontWeight(.bold)
                    }
                }
                .buttonStyle(filledRoundedCornerButtonStyle(font: .title, padding: 15, bgColor: Color(UIColor(named: "semi-dark-red")!).opacity(0.8), fgColor: .white, cornerRadius: 10, opacity: 1, X: 0, Y: -30))
                .padding(.bottom, 20)
                
                }// --> VStack
            }// --> ZStack
            .frame(maxHeight: .infinity)
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)
        }// --> VStack
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ///Rounded corners only top
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curHeight / 2)
            }
            .foregroundColor(.white)
        )
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
                    self.curHeight = self.minHeight
                }
            }
    }// --> End dragGesture
}// --> End ModalView

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
