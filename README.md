# QRCodeGenerator [![Build Status](https://travis-ci.org/fjfdeztoro/Swift-QR-Code-generator.svg?branch=master)](https://travis-ci.org/fjfdeztoro/Swift-QR-Code-generator)

This project intends to be a small wrapper around C++ code from https://github.com/nayuki/QR-Code-generator in order to be able to use it with Swift easily.

### Build it
#### Swift Package Manager
1. `git clone git@github.com:fjfdeztoro/Swift-QR-Code-generator.git`
2. `cd Swift-QR-Code-generator/`
3. `swift build && swift test`

#### With Xcode
All the steps from previous entry and:
1. `swift package generate-xcodeproj`
2. `open QRCodeGenerator.xcodeproj/`
3. `Select target: QRCodeGenerator-Package`
4. `Go to Build Settings for the project.`
5. `Select All`
6. `Look for Apple LLVM - Language - C++ section`
7. `Change C++ Language Dialect to C++11[-std=c++11]`
8. `Change C++ Standard Library to libc++`
9. `cmd+b`

### Use it
#### Resolving dependencies
In your `Package.swift` add this entry as a new dependency:
```
.package(url: "https://github.com/fjfdeztoro/Swift-QR-Code-generator.git", from: "0.0.2")
```

And in your target, add this dependency: `"QRCodeGenerator"`

#### Mixing it with your code.

```
import QRCodeGenerator
print(QRCodeGenerator.getQRCodeAsSVG("https://github.com/fjfdeztoro/Swift-QR-Code-generator/blob/master/README.md", withTolerance: .High))

```

That code will print the content of a SVG file that will contain a QR with a URL to this file.

![Demo screenshot][1]

## License
Copyright © [Project Nayuki](https://www.nayuki.io/page/qr-code-generator-library)

Copyright © Fran Fernández

MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

* The Software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the Software or the use or other dealings in the Software.

[1]: ./art/qr-to-readme.png
