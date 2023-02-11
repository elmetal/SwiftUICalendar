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
        GeometryReader { geometry in
            HStack {
                Text(time)
                    .font(.caption)

                TimeLine()
                    .stroke()
                    .foregroundColor(Color(.separator))
            }

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

struct DateEventsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            DateEventsView()
        }
    }
}
