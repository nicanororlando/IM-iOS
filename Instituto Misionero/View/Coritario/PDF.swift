//
//  PDF.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 19/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI
import PDFKit

/*
struct ListDetails: View {
    
    var programmer: Programmer
    
    ///Binding es una variable que llego de otra clase y puede ser modificada
    @Binding var favorite: Bool
    
    var body: some View {
        
        VStack {
            programmer.avatar
                .resizable()
            
            ///ajusto imagen del circle
                .padding()
            
            ///para que llene el ancho
                .scaledToFit()
            
            ///Circulo
                .clipShape(Circle())
                .overlay(Circle()
                
                ///borde de circle
                .stroke(Color.black,
                        lineWidth: 5))
                .shadow(color: Color.red,
                        radius: 20)
            
                ///ajusto total
                .padding(20)
            
            Text(programmer.id.description).font(.largeTitle)
            HStack{
                Text(programmer.name).font(.largeTitle)
                Button(action: {
                    self.favorite.toggle()
                }) {
                    if favorite{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }else{
                        Image(systemName: "star")
                            .foregroundColor(.black)
                    }
                }

            }
            
            Spacer()
        }
    }
}
*/

struct PDF: View {
    var cancion: Cancion
    @Binding var favorite: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                self.favorite.toggle()
            }) {
                if favorite{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }else{
                    Image(systemName: "star")
                        .foregroundColor(.black)
                }
            }
            //.offset(x:0, y: 0)
            .frame(width: 50, height: 50, alignment: .center)
            
            PDFKitRepresentedView(cancion: cancion)
                .frame(width: 600, height: 800, alignment: .center)
        }
    }
}

struct PDFKitRepresentedView: UIViewRepresentable {
    let cancion: Cancion
    
    private var pdfView = PDFView()

    init(cancion: Cancion) {
        self.cancion = cancion
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        
        /// Create a `PDFView` and set its `PDFDocument`.
        pdfView.document = PDFDocument(url: Bundle.main.bundleURL.appendingPathComponent("coritario.pdf"))
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        
        /// Update the view.
        var page = self.pdfView.document?.page(at: self.cancion.id-1)
        
        pdfView.go(to: (page!))
        pdfView.displayMode = .singlePage
        
        pdfView.autoScales = true
        pdfView.displaysPageBreaks = true
    }
}

/*
struct PDF_Preview: PreviewProvider {
    static var previews: some View {
        PDFKitRepresentedView(cancion: Cancion(id: 3,
                                               name: "Ejemplo",
                                               favorite: false))
            .frame(width: 600, height: 600, alignment: .center)
    }
}
*/

/*
struct ListDetails_Previews: PreviewProvider {
    static var previews: some View {
        PDF(programmer: Programmer(id: 5,
        name: "Nicanor",
        languages: "Swift",
        avatar: Image("nose"),
        favorite: false), favorite: .constant(false))
    }
}
*/
