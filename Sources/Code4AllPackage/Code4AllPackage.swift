import Foundation
import SwiftUI
import Accessibility

@available(iOS 15.0, *)
@available(macOS 12.0, *)
public struct Text4All: View {
    var text:  String
    var color: Color
    var font:  String
    var size:  CGFloat
    var accessibilityTextInfo: String
    @Environment(\.colorScheme) var colorScheme
    public init(text: String, color: Color = Color.accentColor, font: String = "Lato-Regular", size: CGFloat = 20, accessibilityTextInfo: String) {
        self.text = text
        self.color = color
        self.font = font
        self.size = size
        self.accessibilityTextInfo = accessibilityTextInfo
    }
    public var body: some View {
        Section {
            Text( self.text)
                .font( .custom(self.font, size: self.size) )
                .foregroundColor(self.color)
                .accessibilityLabel(self.accessibilityTextInfo)
        }
    }
    
}
@available(iOS 15.0, *)
@available(macOS 12.0, *)
public struct TextField4All: View {
    var textHint: Text4All
    var color: Color
    @Binding var receivedText: String
    @Binding var isSecureField: Bool
    
    public init(textHint: Text4All, receivedText: Binding<String>, color: Color = Color.gray, isSecureField: Binding<Bool> = .constant(false)) {
        self.textHint = textHint
        self._receivedText = receivedText
        self.color = color
        self._isSecureField = isSecureField
    }
    public var body: some View {
        if(isSecureField) {
            SecureField( textHint.text, text: $receivedText)
                .font( .custom(self.textHint.font, size: self.textHint.size) )
                .foregroundColor(self.textHint.color)
                .border(self.color)
                .accessibilityLabel(self.textHint.accessibilityTextInfo)
                .padding()
                .autocapitalization(.none)
        } else {
            TextField( textHint.text, text: $receivedText)
                .font( .custom(self.textHint.font, size: self.textHint.size) )
                .foregroundColor(self.textHint.color)
                .border(self.color)
                .accessibilityLabel(self.textHint.accessibilityTextInfo)
                .padding()
                .autocapitalization(.none)
        }
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
public struct Toggle4All: View {
    @Binding var enableToggle: Bool
    var toggleText: Text4All
    
    public init(enableToggle: Binding<Bool>, toggleLabel: Text4All) {
        self._enableToggle = enableToggle
        self.toggleText = toggleLabel
    }
    
    public var body: some View {
        Toggle(isOn: $enableToggle){
            Text(toggleText.text)
        }
        .accessibilityValue(enableToggle == true ? "enable" : "disable")
        .padding()
    }
}

@available(iOS 15.0, *)
@available(macOS 12.0, *)
public struct Button4All: View {
    var action: () -> Void
    var textObject: Text4All
    var padding:CGFloat
    var cornerRadius:CGFloat
    var borderColor: Color
    var borderWidth: CGFloat
    var borderLength: CGFloat
    var borderHeight: CGFloat
    var isFilled: Bool
    var fillColor: Color
    
    public init(action:@escaping () -> Void, textObject: Text4All, padding: CGFloat = 10.0, cornerRadius:CGFloat = 10.0, borderColor: Color = Color.accentColor, borderWidth: CGFloat = 2.0, borderLength: CGFloat = 100, borderHeight: CGFloat = 30, isFilled: Bool = false, fillColor: Color = Color.blue) {
        self.action = action
        self.textObject = textObject
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.borderLength = borderLength
        self.borderHeight = borderHeight
        self.isFilled = isFilled
        self.fillColor = fillColor
    }
    public var body: some View {
        Button (action: self.action ) {
            textObject
                .padding(self.padding)
                .background(
                    
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                        .stroke(self.borderColor, lineWidth: self.borderWidth)
                        .frame(width:self.borderLength, height: self.borderHeight)
                    
                        .overlay( RoundedRectangle(cornerRadius: self.cornerRadius)
                            .frame(width:self.borderLength, height: self.borderHeight)
                        )
                    
                        .foregroundColor( self.isFilled ? self.fillColor : Color.clear )
                )
        }
        .padding()
    }
}
