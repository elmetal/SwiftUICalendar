//
//  DateEventsView.swift
//  SwiftUICalendar
//  
//  Created by elmetal on 2023/02/09
//  
//

import SwiftUI

struct DateEventsView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            ForEach(0..<25) { time in
                TimelineView(time: "\(time):00")
                    .onPreferenceChange(CGFloatPreference.self) { value in
                        print(value)
                    }

                Rectangle()
                    .frame(height: 24)
                    .foregroundColor(.clear)
            }

            TimelineView(time: "0:00")
        }
    }
}

fileprivate struct TimelineView: View {
    let time: String

    var body: some View {
        HStack {
            Text(time)
                .font(.caption)
                .background(GeometryReader { geometry in
                    Color.clear.preference(key: CGFloatPreference.self,
                                           value: geometry.size.width)
                })
            TimeLine()
                .stroke()
                .foregroundColor(Color(.separator))
        }
    }
}

fileprivate struct TimeLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))

        return path
    }

    static var role: ShapeRole { .separator }
}

fileprivate struct CGFloatPreference: PreferenceKey {
    typealias Value = CGFloat

    static var defaultValue: Value = .zero

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct DateEventsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            DateEventsView()
        }
    }
}
