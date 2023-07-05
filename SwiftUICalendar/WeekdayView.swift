//
//  WeekdayView.swift
//  SwiftUICalendar
//  
//  Created by elmetal on 2023/02/13
//  
//

import Foundation
import SwiftUI

struct WeekdayView: View {
    @Binding var selectedDate: Date

    @State private var offset: CGSize = .zero

    private let calendar = Calendar.init(identifier: .gregorian)

    var body: some View {
        HStack {
            ForEach(weekdays().map { calendar.dateComponents(in: .current, from: $0) }, id: \.self) { dateComponents in
                VStack {
                    Text(calendar.veryShortWeekdaySymbols[dateComponents.weekday! - 1])
                    Text("\(dateComponents.day!)")
                        .bold(dateComponents.date! == selectedDate)
                        .offset(offset)
                        .gesture(drag)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    func weekdays() -> [Date] {
        let selectedDateComponents = calendar.dateComponents(in: .current, from: selectedDate)

        switch selectedDateComponents.weekday! {
            case 1...7:
                return (0...6)
                    .map { calendar.date(byAdding: .day,
                                         value: $0 - selectedDateComponents.weekday! + 1,
                                         to: selectedDate)! }
            default:
                fatalError()

        }
    }

    var drag: some Gesture {
        DragGesture()
            .onChanged { a in self.offset = CGSize(width: a.translation.width, height: offset.height) }
            .onEnded { a in
                withAnimation {
                    if a.predictedEndTranslation.width > 0 {
                        selectedDate = calendar.date(byAdding: .day,
                                                     value: -7,
                                                     to: selectedDate)!
                    }

                    if a.predictedEndTranslation.width < -0 {
                        selectedDate = calendar.date(byAdding: .day,
                                                     value: 7,
                                                     to: selectedDate)!
                    }

                    offset = .zero
                }
            }
    }
}

#Preview {
    WeekdayView(selectedDate: .constant(.now))
}
