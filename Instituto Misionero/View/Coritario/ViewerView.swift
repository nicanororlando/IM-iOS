//
//  ViewerView.swift
//  Instituto Misionero
//
//  Created by Daniel Scholtus on 29/03/2022.
//  Copyright © 2022 KnorDev. All rights reserved.
//

import SwiftUI
import UIKit
import PDFKit

struct PDFKitRepresentedView: UIViewRepresentable {
    
    let cancion: Cancion
    
    let specialPages = [28, 40, 61, 68, 148]

    init(cancion: Cancion) {
        self.cancion = cancion
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        
        let pdfView = PDFView()
        
        pdfView.document = PDFDocument(url: Bundle.main.bundleURL.appendingPathComponent("coritario.pdf"))
        pdfView.displayMode = .singlePage
        pdfView.autoScales = true
        
        let i = cancion.id - 1
        var page = pdfView.document?.page(at: i)
        
        switch (i) {
        case 0..<18:
            page = pdfView.document?.page(at: i)
        case 18..<29:
            page = pdfView.document?.page(at: i+1)
        case 29..<41:
            page = pdfView.document?.page(at: i+2)
        case 41..<62:
            page = pdfView.document?.page(at: i+3)
        case 62..<69:
            page = pdfView.document?.page(at: i+4)
        case 69..<149:
            page = pdfView.document?.page(at: i+5)
        default:
            page = pdfView.document?.page(at: i+6)
        }
        
        switch (i) {
        case 17, 28, 40, 61, 68, 148:
            pdfView.displaysPageBreaks = false
        default:
            pdfView.displaysPageBreaks = true
        }

        pdfView.go(to: (page!))
        
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {}
}
