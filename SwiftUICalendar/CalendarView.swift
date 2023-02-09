//
//  CalendarView.swift
//  SwiftUICalendar
//  
//  Created by elmetal on 2023/02/09
//  
//

import Foundation
import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(1..<8) { date in
                    VStack {
                        Text(Calendar.current.veryShortWeekdaySymbols[date-1]).font(.caption)
                        Text("\(date)")
                    }
                }
                .padding(.horizontal, 16)
            }
            Text(Date().formatted(date: .complete, time: .omitted))
            ScrollView {
                Text("Calendar Events Area")
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CalendarView()
        }
    }
}
