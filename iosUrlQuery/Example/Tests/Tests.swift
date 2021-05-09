import XCTest
import iosUrlQuery

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAuthUrl() {
        // WHATWG URL standard - auth url
        let builder = UrlBuilder("https://user:pass@sub.example.com:8080/p/a/t/h?query=string#hash")
        let _url = builder.build()!
        
        XCTAssertEqual(_url._protocol, "https:")
        XCTAssertEqual(_url._username, "user")
        XCTAssertEqual(_url._password, "pass")
        XCTAssertEqual(_url._host, "sub.example.com:8080")
        XCTAssertEqual(_url._hostname, "sub.example.com")
        XCTAssertEqual(_url._port, "8080")
        XCTAssertEqual(_url._pathname, "/p/a/t/h")
        XCTAssertEqual(_url._search, "query=string")
        XCTAssertEqual(_url._hash, "#hash")
        XCTAssertEqual(_url._origin, "https://sub.example.com:8080")
        XCTAssertEqual(_url._href, "https://user:pass@sub.example.com:8080/p/a/t/h?query=string#hash")
    }
    
    func testAuthNoPassword() {
        // WHATWG URL standard - auth url
        let builder = UrlBuilder("https://user@sub.example.com:8080/p/a/t/h?query=string#hash")
        let _url = builder.build()!
        
        XCTAssertEqual(_url._protocol, "https:")
        XCTAssertEqual(_url._username, "user")
        XCTAssertEqual(_url._password, "")
        XCTAssertEqual(_url._host, "sub.example.com:8080")
        XCTAssertEqual(_url._hostname, "sub.example.com")
        XCTAssertEqual(_url._port, "8080")
        XCTAssertEqual(_url._pathname, "/p/a/t/h")
        XCTAssertEqual(_url._search, "query=string")
        XCTAssertEqual(_url._hash, "#hash")
        XCTAssertEqual(_url._origin, "https://sub.example.com:8080")
        XCTAssertEqual(_url._href, "https://user@sub.example.com:8080/p/a/t/h?query=string#hash")
    }
    
    func testHost() {
        // WHATWG URL standard - auth url
        let builder = UrlBuilder("https://sub.example.com/p/a/t/h?query=string#hash")
        let _url = builder.build()!
        
        XCTAssertEqual(_url._protocol, "https:")
        XCTAssertEqual(_url._username, "")
        XCTAssertEqual(_url._password, "")
        XCTAssertEqual(_url._host, "sub.example.com")
        XCTAssertEqual(_url._hostname, "sub.example.com")
        XCTAssertEqual(_url._port, "")
        XCTAssertEqual(_url._pathname, "/p/a/t/h")
        XCTAssertEqual(_url._search, "query=string")
        XCTAssertEqual(_url._hash, "#hash")
        XCTAssertEqual(_url._origin, "https://sub.example.com")
        XCTAssertEqual(_url._href, "https://sub.example.com/p/a/t/h?query=string#hash")
    }
    
    func testHostNoHash() {
        // WHATWG URL standard - auth url
        let builder = UrlBuilder("https://sub.example.com/p/a/t/h?query=string")
        let _url = builder.build()!
        
        XCTAssertEqual(_url._protocol, "https:")
        XCTAssertEqual(_url._username, "")
        XCTAssertEqual(_url._password, "")
        XCTAssertEqual(_url._host, "sub.example.com")
        XCTAssertEqual(_url._hostname, "sub.example.com")
        XCTAssertEqual(_url._port, "")
        XCTAssertEqual(_url._pathname, "/p/a/t/h")
        XCTAssertEqual(_url._search, "query=string")
        XCTAssertEqual(_url._hash, "")
        XCTAssertEqual(_url._origin, "https://sub.example.com")
        XCTAssertEqual(_url._href, "https://sub.example.com/p/a/t/h?query=string")
    }
    
    func testHostDomainOnly() {
        // WHATWG URL standard - auth url
        let builder = UrlBuilder("https://sub.example.com?query=string")
        let _url = builder.build()!
        
        XCTAssertEqual(_url._protocol, "https:")
        XCTAssertEqual(_url._username, "")
        XCTAssertEqual(_url._password, "")
        XCTAssertEqual(_url._host, "sub.example.com")
        XCTAssertEqual(_url._hostname, "sub.example.com")
        XCTAssertEqual(_url._port, "")
        XCTAssertEqual(_url._pathname, "/")
        XCTAssertEqual(_url._search, "query=string")
        XCTAssertEqual(_url._hash, "")
        XCTAssertEqual(_url._origin, "https://sub.example.com")
        XCTAssertEqual(_url._href, "https://sub.example.com/?query=string")
    }
    
    func testHostNoQuery() {
        // WHATWG URL standard - auth url
        let builder = UrlBuilder("https://sub.example.com")
        let _url = builder.build()!
        
        XCTAssertEqual(_url._protocol, "https:")
        XCTAssertEqual(_url._username, "")
        XCTAssertEqual(_url._password, "")
        XCTAssertEqual(_url._host, "sub.example.com")
        XCTAssertEqual(_url._hostname, "sub.example.com")
        XCTAssertEqual(_url._port, "")
        XCTAssertEqual(_url._pathname, "/")
        XCTAssertEqual(_url._search, "")
        XCTAssertEqual(_url._hash, "")
        XCTAssertEqual(_url._origin, "https://sub.example.com")
        XCTAssertEqual(_url._href, "https://sub.example.com/")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
