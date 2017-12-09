import QRCodeGenerator_Wrapper

class QRCodeGenerator {
    static func getQRCodeAsSVG(_ text: String, withTolerance tolerance: ErrorTolerance) -> String {
        return QrCodeWrapper.toSVGXML(text, with: tolerance)
    }
}
