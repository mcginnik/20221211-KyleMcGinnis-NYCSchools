//
//  _0221211_KyleMcGinnis_NYCSchoolsTests.swift
//  20221211-KyleMcGinnis-NYCSchoolsTests
//
//  Created by Kyle McGinnis on 12/11/22.
//

import XCTest
@testable import _0221211_KyleMcGinnis_NYCSchools

final class _0221211_KyleMcGinnis_NYCSchoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func test_SchoolSearchViewModel_AfterFetchSchools_SchoolsNotNil() throws {
        // Given
        let vm = SchoolSearchViewModel()
        SchoolSearchService.setup(with: SchoolSearchMockService())
        let expectation = XCTestExpectation()
        
        // When
        vm.fetchSchools(){ _ in
            if vm.schools.count > 0 {
                expectation.fulfill()
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 10)
    }
    
    func test_SchoolDetailViewModel_AfterFetchSATs_SATsNotNil() throws {
        // Given
        let mockService = SchoolSearchMockService()
        guard let school = mockService.schools.first else { return }
        let vm = SchoolDetailViewModel(school: school)
        SchoolSearchService.setup(with: mockService)
        let expectation = XCTestExpectation()
        
        // When
        vm.fetchSchoolDetail(){ _ in
            if vm.sats.count > 0 {
                expectation.fulfill()
            }
        }
        
        // Then
        wait(for: [expectation], timeout: 10)
    }
    
}
