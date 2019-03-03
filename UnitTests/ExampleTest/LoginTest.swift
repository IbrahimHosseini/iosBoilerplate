//
//  LoginTest.swift
//  UnitTests
//
//  Created by Pazandish on 3/3/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Quick
import Nimble
@testable import baseproject

class ExampleTest: QuickSpec {
    override func spec() {
    
        var test: TestClass!
        
        //Resets that test to a new instance of Board before every test
        beforeEach {
            test = TestClass()
        }
        
        describe("") { // is used to define what action or behavior you’ll be testing
            context("") { // is used to define the specific context of the action you’ll be testing
                it("") { //  is used to define the specific expected result for the test
                    
                }
            }
        }
        
    }
}


public class TestClass {
    // just as test class
}
