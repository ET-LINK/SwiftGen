//
// SwiftGen
// Copyright © 2019 SwiftGen
// MIT Licence
//

import Foundation

//
// See the documentation file for a full description of this context's structure:
// Documentation/SwiftGenKit Contexts/json.md
//

extension JSON.Parser {
  public func stencilContext() -> [String: Any] {
    let files = self.files
      .sorted { lhs, rhs in lhs.name < rhs.name }
      .map(map(file:))

    return [
      "files": files
    ]
  }

  private func map(file: JSON.File) -> [String: Any] {
    [
      "name": file.name,
      "path": file.path.string,
      "document": StencilContextLazyDocument(data: file.document),
      // Deprecated: remains for legacy/compatibility reasons; will be removed in 7.0
      "documents": [StencilContextLazyDocument(data: file.document)]
    ]
  }
}
