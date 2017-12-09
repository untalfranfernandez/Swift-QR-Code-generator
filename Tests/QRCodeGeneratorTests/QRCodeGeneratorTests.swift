import XCTest

@testable import QRCodeGenerator
@testable import QRCodeGenerator_Wrapper

class QRCodeGeneratorTests: XCTestCase {
    func testHelloWorldHighTolerance() {
        let expectedContent = svgFile("hello-world-high.xml")
        let generatedContent = QRCodeGenerator.getQRCodeAsSVG("hello-world", withTolerance: ErrorTolerance.High)
        XCTAssertEqual(expectedContent, generatedContent)
    }

    func testHelloWorldQuartileTolerance() {
        let expectedContent = svgFile("hello-world-quartile.xml")
        let generatedContent = QRCodeGenerator.getQRCodeAsSVG("hello-world", withTolerance: ErrorTolerance.Quartile)
        XCTAssertEqual(expectedContent, generatedContent)
    }

    func testHelloWorldMediumTolerance() {
        let expectedContent = svgFile("hello-world-medium.xml")
        let generatedContent = QRCodeGenerator.getQRCodeAsSVG("hello-world", withTolerance: ErrorTolerance.Medium)
        XCTAssertEqual(expectedContent, generatedContent)
    }

    func testHelloWorldLowTolerance() {
        let expectedContent = svgFile("hello-world-low.xml")
        let generatedContent = QRCodeGenerator.getQRCodeAsSVG("hello-world", withTolerance: ErrorTolerance.Low)
        XCTAssertEqual(expectedContent, generatedContent)
    }
}

extension QRCodeGeneratorTests {
    private func svgFile(_ filename: String) -> String {
        let path = getPathForFile(filename)
        do {
            return try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        } catch _ {
            print("Error trying to read file \(path). The file does not exist")
            return ""
        }
    }

    private func getPathForFile(_ filename: String) -> String {
        // Super awful hack. There is no way to bundle files with SPM.
        // More info at: https://bugs.swift.org/browse/SR-4725
        return NSString.path(withComponents: [Bundle(for: QRCodeGeneratorTests.self).bundlePath, 
        "..", "..", "..", "..", "Tests", "QRCodeGeneratorTests", filename])
    }
}
