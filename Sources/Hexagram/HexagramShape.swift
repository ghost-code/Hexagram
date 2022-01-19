import SwiftUI

@available(macOS 10.15, iOS 13.0, *)
public struct HexagramShape: Shape {

    public let hexagram: Hexagram
    
    public init(_ hexagram: Hexagram) {
        self.hexagram = hexagram
    }

    public func path(in rect: CGRect) -> Path {

        let middleX = rect.width / 2
        let lineWidth = rect.height * 0.125
        let horizontalSpacing = rect.width * 0.05
        let verticalSpacing = rect.height * 0.05
        let brokenSegmentWidth = middleX - horizontalSpacing / 2

        var path = Path()
        var y: CGFloat = 0

        for i in (0..<6) {
            if (hexagram.lines >> i) & 1 == 1 {
                path.addRect(CGRect(x: 0, y: y, width: rect.width, height: lineWidth))
            } else {
                path.addRect(CGRect(x: 0, y: y, width: brokenSegmentWidth, height: lineWidth))
                path.addRect(CGRect(x: middleX + horizontalSpacing / 2,
                                    y: y,
                                    width: brokenSegmentWidth,
                                    height: lineWidth))
            }
            y += lineWidth + verticalSpacing
        }

        return path
    }

}

@available(macOS 10.15, iOS 13.0, *)
struct HexagramShape_Previews: PreviewProvider {
    static var previews: some View {
        HexagramShape(Hexagram(number: 23)!)
            .frame(width: 400, height: 240)
            .previewLayout(.sizeThatFits)
    }
}
