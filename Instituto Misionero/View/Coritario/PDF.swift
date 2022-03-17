//
//  PDF.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 19/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI
import UIKit
import PDFKit

struct PDF: View {
    var cancion: Cancion
    @Binding var navigateToPdf: Bool
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height

    func adaptedWidth(curWidth: CGFloat) -> CGFloat {
        let percentajeWidth = curWidth / 414
        let adaptedWidth = percentajeWidth * screenWidth
        return adaptedWidth
    }
    func adaptedHeight(curHeight: CGFloat) -> CGFloat {
        let percentajeHeight = curHeight / 896
        let adaptedHeight = percentajeHeight * screenHeight
        return CGFloat(adaptedHeight)
    }
    
    var body: some View {
        ZStack{
            VStack{
            
            PDFKitRepresentedView(cancion: cancion)
                .frame(width: adaptedWidth(curWidth: 660), height: adaptedHeight(curHeight: 880), alignment: .center)
        }// --> VStack
        .navigationBarBackButtonHidden(false)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
	
        }// --> ZStack
    }// --> View
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
    }// --> Vista del pdf

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        
        let i = cancion.id - 1
        var page = self.pdfView.document?.page(at: i)

        if(i == 17 || i == 28 || i == 40 || i == 61 || i == 68 || i == 148) {
            
            if (i == 17) {
                pdfView.displayMode = .singlePage
                pdfView.usePageViewController(true)
                pdfView.go(to: (page!))
            }
            else if (i == 28) {
                pdfView.displayMode = .singlePage
                pdfView.usePageViewController(true)
                page = self.pdfView.document?.page(at: i+1)
                pdfView.go(to: (page!))
            }
            else if (i == 40){
                pdfView.displayMode = .singlePage
                pdfView.usePageViewController(true)
                page = self.pdfView.document?.page(at: i+2)
                pdfView.go(to: (page!))
            }
            else if (i == 61){
                pdfView.displayMode = .singlePage
                pdfView.usePageViewController(true)
                page = self.pdfView.document?.page(at: i+3)
                pdfView.go(to: (page!))
            }
            else if(i == 68){
                pdfView.displayMode = .singlePage
                pdfView.usePageViewController(true)
                page = self.pdfView.document?.page(at: i+4)
                pdfView.go(to: (page!))
            }
            else {
                pdfView.displayMode = .singlePage
                pdfView.usePageViewController(true)
                page = self.pdfView.document?.page(at: i+5)
                pdfView.go(to: (page!))
            }
        }// --> Logica para cuando las canciones tienen dos paginas
        else if(i >= 18 && i <= 27) {
            page = self.pdfView.document?.page(at: i+1)
            pdfView.go(to: (page!))
            pdfView.displaysPageBreaks = true
            pdfView.displayMode = .singlePage
        }
        else if(i >= 29 && i <= 39){
            page = self.pdfView.document?.page(at: i+2)
            pdfView.go(to: (page!))
            pdfView.displaysPageBreaks = true
            pdfView.displayMode = .singlePage
        }
        else if(i >= 41 && i <= 60) {
            page = self.pdfView.document?.page(at: i+3)
            pdfView.go(to: (page!))
            pdfView.displaysPageBreaks = true
            pdfView.displayMode = .singlePage
        }
        else if(i >= 62 && i <= 67) {
            page = self.pdfView.document?.page(at: i+4)
            pdfView.go(to: (page!))
            pdfView.displaysPageBreaks = true
            pdfView.displayMode = .singlePage
        }
        else if(i >= 69 && i <= 148) {
            page = self.pdfView.document?.page(at: i+5)
            pdfView.go(to: (page!))
            pdfView.displaysPageBreaks = true
            pdfView.displayMode = .singlePage
        }
        else if (i >= 149){
            page = self.pdfView.document?.page(at: i+6)
            pdfView.go(to: (page!))
            pdfView.displaysPageBreaks = true
            pdfView.displayMode = .singlePage
        }
        else{
            pdfView.go(to: (page!))
            pdfView.displaysPageBreaks = true
            pdfView.displayMode = .singlePage
        }
        pdfView.autoScales = true
    }// -->UpdateUIView
}// --> PDFKit

struct PDF_Preview: PreviewProvider {
    static var previews: some View {
        PDFKitRepresentedView(cancion: Cancion(id: 3,
                                               name: "Ejemplo",
                                               favorite: false))
            .frame(width: 600, height: 600, alignment: .center)
    }
}

