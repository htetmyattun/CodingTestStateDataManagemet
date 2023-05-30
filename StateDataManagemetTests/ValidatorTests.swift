//
//  ValidatorTests.swift
//  StateDataManagemetTests
//
//  Created by Htet Myat Tun on 31/05/2023.
//

import XCTest
@testable import StateDataManagemet

final class ValidatorTests: XCTestCase {

    var sut: FormViewModel?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = FormViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testValidator_checkSim_returnPassed() {
        let sim = "091234567"
        var passed = false
        var reason = ""
        (passed, reason) = sut?.simCheck(simNo: sim) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
    }
    
    func testValidator_checkSim_returnNotPassedBezOfDigitNumbers() {
        let sim = "111111"
        var passed = false
        var reason = ""
        (passed, reason) = sut?.simCheck(simNo: sim) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Sim number should be between 7 and 9")
    }

    func testValidator_checkNumber_returnTrue() {
        let num = "1234567890"
        var passed = false
        var reason = ""
        (passed, reason) = sut?.numberCheck(num: num) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
    }
    
    func testValidator_checkNumber_returnFalse() {
        let num = "-1234567890"
        var passed = false
        var reason = ""
        (passed, reason) = sut?.numberCheck(num: num) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please type valid amount to transfer.")
    }
    
    func testValidator_checkValidEmail_returnTrue() {
        var email = "htetmyat@gamil.com"
        var passed = false
        var reason = ""
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "email@example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "firstname.lastname@example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "email@subdomain.example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "1234567890@example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "email@example-one.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "email@example.name"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "email@example.museum"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "email@example.co.jp"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
        
        email = "firstname-lastname@example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertTrue(passed)
        XCTAssertEqual(reason, "")
    }
    
    func testValidator_checkValidEmail_returnFalse() {
        var email = "plainaddress"
        var passed = false
        var reason = ""
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "#@%^%#$@#$@#.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "@example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "Joe Smith <email@example.com>"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "email.example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "email@example@example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "email@example.com (Joe Smith)"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "あいうえお@example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "email@111.222.333.44444"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
        
        email = "\"(),:;<>[\\]@example.com"
        (passed, reason) = sut?.emailCheck(email: email) ?? (false, "")
        XCTAssertFalse(passed)
        XCTAssertEqual(reason, "Please enter valid email address.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
