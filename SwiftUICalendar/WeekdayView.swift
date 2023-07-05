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

    @State private var selection: WeekTab = .current
    private let weeks: [WeekTab] = [.previous, .current, .next]

    private let calendar = Calendar.init(identifier: .gregorian)

    var body: some View {
        TabView(selection: $selection) {
            ForEach(weeks, id: \.self) { week in
                HStack {
                    ForEach(weekdays(week).map { calendar.dateComponents(in: .current, from: $0) }, id: \.self) { dateComponents in
                        VStack {
                            Text(calendar.veryShortWeekdaySymbols[dateComponents.weekday! - 1])
                            Text("\(dateComponents.day!)")
                                .bold(dateComponents.date! == selectedDate)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                .tag(week)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: selection) { newSelection in // ios17で変更する
            if newSelection == .previous {
                selectedDate = calendar.date(byAdding: .day,
                                             value: -7,
                                             to: selectedDate)!
            }

            if newSelection == .next {
                selectedDate = calendar.date(byAdding: .day,
                                             value: 7,
                                             to: selectedDate)!
            }

            selection = .current
        }
    }

    private func weekdays(_ week: WeekTab) -> [Date] {
        let selectedDateComponents = calendar.dateComponents(in: .current, from: selectedDate)

        switch selectedDateComponents.weekday! {
            case 1...7:
                return (0...6)
                    .map { calendar.date(byAdding: .day,
                                         value: $0 - selectedDateComponents.weekday! + 1 + week.addingValue,
                                         to: selectedDate)! }
            default:
                fatalError()

        }
    }

    private enum WeekTab: Hashable {
        case previous
        case current
        case next

        var addingValue: Int {
            switch self {
                case .previous:
                    return -7
                case .current:
                    return 0
                case .next:
                    return 7
            }
        }
    }
}

#Preview {
    WeekdayView(selectedDate: .constant(.now))
}
