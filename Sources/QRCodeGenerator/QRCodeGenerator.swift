import QRCodeGenerator_Wrapper

public class QRCodeGenerator {
    public static func getQRCodeAsSVG(_ text: String, withTolerance tolerance: ErrorTolerance) -> String {
        return QrCodeWrapper.toSVGXML(text, with: tolerance)
    }
}
