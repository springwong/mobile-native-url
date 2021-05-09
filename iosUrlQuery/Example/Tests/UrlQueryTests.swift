//
//  UrlQueryTests.swift
//  iosUrlQuery_Tests
//
//  Created by chun yip wong on 9/5/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
import iosUrlQuery

class UrlQueryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasic() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let builder = UrlBuilder("https://www.google.com")
        let _url = builder.build()!
        XCTAssertEqual(_url._host, "www.google.com")
        XCTAssertEqual(_url._href, "https://www.google.com/")
    }
    
    func testQuery() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let builder = UrlBuilder("https://www.google.com")
        let _url = builder
            .searchParamsAdd("space", "hello world")
            .searchParamsAdd("and", "&")
            .build()!
        XCTAssertEqual(_url._host, "www.google.com")
        XCTAssertEqual(_url._search, "?space=hello%20world&and=%26")
        XCTAssertEqual(_url.searchParamsGet("space"), "hello world")
        XCTAssertEqual(_url.searchParamsGet("and"), "&")
        XCTAssertEqual(_url.searchParamsGet("notExist"), nil)
    }
    
    func testQueryRedirectUrl() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let builder = UrlBuilder("https://www.google.com")
        let _url = builder
            .searchParamsAdd("redirectUrl", "https://www.apple.com.hk?space=hello+world&and=%26")
            .build()!
        XCTAssertEqual(_url._host, "www.google.com")
//        XCTAssertEqual(_url._search, "?redirectUrl=https%3A%2F%2Fwww.apple.com.hk%3Fspace%3Dhello%2Bworld%26and%3D%2526")
        XCTAssertEqual(_url.searchParamsGet("redirectUrl"), "https://www.apple.com.hk?space=hello+world&and=%26")
        XCTAssertEqual(_url._href, "https://www.google.com/?redirectUrl=https%3A%2F%2Fwww.apple.com.hk%3Fspace%3Dhello%2Bworld%26and%3D%2526")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
