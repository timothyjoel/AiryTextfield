import SwiftUI
import Combine
    
public struct AiryTextfield: View {
        
        // MARK: - Standard AiryTextfield variables
        private var placeholder: String
        private var title: String
        @Binding public var text: String
        @State public var titleFont: Font = .system(size: 12, weight: .bold, design: .rounded)
        @State public var titleUppercased: Bool = false
        @State public var font: Font = .system(size: 16, weight: .bold, design: .rounded)
        @State public var lineHeight: CGFloat = 1
        @State public var mainColor: Color = .black
        @State public var secondaryColor: Color = .gray
        @State public var isEditing: Bool = false
        @State public var textAlignment: TextAlignment = .leading
        @State public var titleAlignment: TextAlignment = .leading
        
        public init(title: String, placeholder: String, text: Binding<String>) {
            self.title = title
            self.placeholder = placeholder
            self._text = text
        }
        
        public var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                Text(text != "" ? title : "")
                    .multilineTextAlignment(titleAlignment)
                    .font(titleFont)
                    .foregroundColor(isEditing ? mainColor : secondaryColor)
                    .animation(.easeInOut)
                TextField(self.placeholder, text: self.$text, onEditingChanged: { isEditing in
                        self.isEditing = isEditing
                })
                    .multilineTextAlignment(textAlignment)
                    .font(font)
                    .foregroundColor(mainColor)
                    .padding(.vertical, 4)
                HStack {
                    Spacer()
                }
                .frame(height: lineHeight)
                .background(isEditing ? mainColor : secondaryColor)
            }
        }
        
}

extension AiryTextfield {
    

    // MARK: - Standard methods
    /// Color of text input
    @inlinable public func mainColor(_ color: Color) -> some View {
        let textfield = self
        textfield.mainColor = color
        return textfield
    }
    
    /// Default color of title and line when not selected
    @inlinable public func secondaryColor(_ color: Color) -> some View {
        let textfield = self
        textfield.secondaryColor = color
        return textfield
    }
    
    /// Font of title above textfield
    @inlinable public func titleFont(_ font: Font) -> some View {
        let textfield = self
        textfield.titleFont = font
        return textfield
    }
    
    /// Height of line under textfield
    @inlinable public func lineHeight(_ height: CGFloat) -> some View {
        let textfield = self
        textfield.lineHeight = height
        return textfield
    }
    
    /// Defines whether title above textfield is uppercased
    @inlinable public func titleUppercased(_ bool: Bool) -> some View {
        let textfield = self
        textfield.titleUppercased = bool
        return textfield
    }
    
    /// Defines alignment of title
    @inlinable public func titleAlignment(_ alignment: TextAlignment) -> some View {
        let textfield = self
        textfield.titleAlignment = alignment
        return textfield
    }
    
    /// Defines alignment of text input
    @inlinable public func textAlignment(_ alignment: TextAlignment) -> some View {
        let textfield = self
        textfield.textAlignment = alignment
        return textfield
    }
    
}
