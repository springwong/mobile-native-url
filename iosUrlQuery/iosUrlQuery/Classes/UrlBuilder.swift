public class UrlBuilder {
    var _url: URLComponents
    var _spaceAsPlus: Bool = false
    
    public init() {
        _url = URLComponents()
    }
    
    public init(_ input: String) {
        _url = URLComponents(string: input) ?? URLComponents()
    }
    
    public init(_ input: URL) {
        _url = URLComponents(string: input.absoluteString) ?? URLComponents()
    }
    
    public func build() -> URL? {
        return _url.url
    }
    
    public func _protocol(_ input: String?) -> UrlBuilder {
        _url.scheme = (input ?? "").isEmpty ? nil : input
        return self
    }
    
    public func username(_ input: String?) -> UrlBuilder {
        _url.user = (input ?? "").isEmpty ? nil : input
        return self
    }
    
    public func password(_ input: String?) -> UrlBuilder {
        _url.password = (input ?? "").isEmpty ? nil : input
        return self
    }
    
    public func hostname(_ input: String?) -> UrlBuilder {
        _url.host = (input ?? "").isEmpty ? nil : input
        return self
    }
    
    public func port(_ input: Int?) -> UrlBuilder {
        _url.port = input
        return self
    }
    
    public func search(_ input: String?) -> UrlBuilder {
        _url.query = (input ?? "").isEmpty ? nil : input
        return self
    }
    
    public func searchParamsAdd(_ key: String, _ value: String?) -> UrlBuilder {
        if _url.queryItems == nil {
            _url.queryItems = []
        }
        _url.queryItems?.append(URLQueryItem(name: key, value: value))
        return self
    }
    
    public func searchParamsRemove(_ key: String) -> UrlBuilder {
        _url.queryItems?.removeAll(where: { item in
            return item.name == key
        })
        return self
    }
    
    public func hash(_ input: String?) -> UrlBuilder {
        _url.fragment = (input ?? "").isEmpty ? nil : input
        return self
    }
    
    public func spaceAsPlus() -> UrlBuilder {
        _spaceAsPlus = true
        return self
    }
}
