import Foundation
import UIKit


// MARK: - ActivityViewController Simplenote Methods
//
extension UIActivityViewController {

    /// Initializes a UIActivityViewController instance that will be able to export a given Note
    ///
    @objc
    convenience init?(note: Note) {
        guard let content = note.content else {
            return nil
        }

        let print = SPSimpleTextPrintFormatter(text: content)
        let source = SimplenoteActivityItemSource(note: note)
        let link = PDFLinkActivityItemProvider(content: content, filename: String(format: "%@.pdf", note.exportFilename()))

        self.init(activityItems: [print, source, link], applicationActivities: nil)
    }
}
