import Foundation

internal class Helper {
    internal class func stringFromFile(_ name: String) -> String? {
        let bundle = Bundle(for: self)
        let path = bundle.pathForResource(name, ofType: "json")
        if let path = path {
            let string = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return string
        }
        return nil
    }

    internal class func JSONFromFile(_ name: String) -> AnyObject {
        let bundle = Bundle(for: self)
        let path = bundle.pathForResource(name, ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let dict: AnyObject? = try? JSONSerialization.jsonObject(with: data,
        options: JSONSerialization.ReadingOptions.mutableContainers)
        return dict!
    }
}
