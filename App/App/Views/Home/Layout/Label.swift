import UIKit

class Label: UILabel {
    
    var textInsets: UIEdgeInsets = .zero
    var lineHeight: Int = -1 {
        didSet {
            guard let attributedText = self.attributedText else { return }
            let textWithLineHeight = NSMutableAttributedString(attributedString: attributedText)
            guard let range = NSRange(textWithLineHeight.string) else { return }
            textWithLineHeight.addAttribute(NSAttributedString.Key.paragraphStyle, value: lineHeight, range: range)
            self.attributedText = textWithLineHeight
        }
    }
    
    override var text: String? {
        didSet {
            guard let text = text else { return }
            self.attributedText = NSAttributedString(string: text)
        }
    }
    
    override var attributedText: NSAttributedString? {
        didSet {
            guard let attributedText = self.attributedText, lineHeight != -1 else { return }
            let textWithLineHeight = NSMutableAttributedString(attributedString: attributedText)
            guard let range = NSRange(textWithLineHeight.string) else { return }
            textWithLineHeight.addAttribute(NSAttributedString.Key.paragraphStyle, value: lineHeight, range: range)
            self.attributedText = textWithLineHeight
        }
    }
    
    override var bounds: CGRect {
        didSet { preferredMaxLayoutWidth = bounds.width - (textInsets.left + textInsets.right) }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + textInsets.left + textInsets.right, height: size.height + textInsets.top + textInsets.bottom)
    }
}
