//
//  DateEventView.swift
//  SwiftUICalendar
//  
//  Created by elmetal on 2023/02/16
//  
//

import SwiftUI

struct DateEventView: View {
    let color = Color.red
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .stroke(lineWidth: 2)
            .foregroundColor(color)
            .background(RoundedRectangle(cornerRadius: 4).foregroundColor(color.opacity(0.2)))

    }
}

struct DateEventView_Previews: PreviewProvider {
    static var previews: some View {
        DateEventView()
            .padding(16)
    }
}
