//
//  WeekdayView.swift
//  SwiftUICalendar
//  
//  Created by elmetal on 2023/02/13
//  
//

import SwiftUI

struct WeekdayView: View {
    var body: some View {
        HStack {
            ForEach(1..<8) { date in
                VStack {
                    Text(Calendar.current.veryShortWeekdaySymbols[date-1]).font(.caption)
                    Text("\(date)")
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct WeekdayView_Previews: PreviewProvider {
    static var previews: some View {
        WeekdayView()
    }
}
