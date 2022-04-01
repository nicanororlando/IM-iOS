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
        pdfView.autoScales = true
        
        var page = pdfView.document?.page(at: 0)
        
        switch (cancion.id) {
        case 18, 29, 41, 62, 70, 149:
            pdfView.document = PDFDocument(url: Bundle.main.bundleURL.appendingPathComponent("cancion\(cancion.id).pdf"))
            page = pdfView.document?.page(at: 0)
        default:
            pdfView.document = PDFDocument(url: Bundle.main.bundleURL.appendingPathComponent("coritario.pdf"))
            page = pdfView.document?.page(at: cancion.id-1)
            pdfView.displayMode = .singlePage
        }

        pdfView.go(to: (page!))
        
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {}
}
