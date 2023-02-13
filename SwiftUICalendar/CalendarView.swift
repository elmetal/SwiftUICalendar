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
            WeekdayView()
            Text(Date().formatted(date: .complete, time: .omitted))
            Divider()
            ScrollView {
                DateEventsView()
                    .padding(.horizontal, 16)
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
