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
            VStack{
                Image("icono_im")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .offset(x: 0, y: 10)
                    Text("Instituto")
                        .foregroundColor(Color(UIColor(named: "dark-grey")!))
                        .fontWeight(.bold)
                        .offset(x: 0, y: -5)
                    Text("Misionero")
                        .foregroundColor(Color(UIColor(named: "semi-dark-red")!))
                        .fontWeight(.bold)
                        .offset(x: 0, y: -10)
                }// --> VStack
            }// --> ZStack
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
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
