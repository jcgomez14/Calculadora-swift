//
//  VerticalButtonStyle.swift
//  SwiftUi-Calculadora
//
//  Created by Juan Cruz on 24/05/2022.
//

import SwiftUI

struct VerticalButtonStyle: View {
    
    let data : [KeyboardButton]
    let columns : [GridItem]
    let width: CGFloat
    
    init(data: [KeyboardButton],
         columns: [GridItem],
         width: CGFloat){
        self.data  = data
        self.columns = columns
        self.width = width
    }
    
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(data, id:\.self) { model in
                Button(action: {}, label: {
                    Text(model.title)
                    font(.largeTitle)
                        .frame(width: width * 0.22, height: width * 0.22)
                })
                    .foregroundColor(model.textColor)
                    .background(model.backgroundColor)
                    .cornerRadius(width * 0.25)
            }
        }
        .frame(width: width)
    }
}

struct VerticalButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VerticalButtonStyle(data: Matrix.firstSectionData, columns: Matrix.firstSectionGrid(390 * 0.25), width: 390)
    }
}
