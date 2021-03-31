//
//  RandomHumanTests.swift
//  RandomHumanTests
//
//  Created by Guerson Perez on 29/03/21.
//

import XCTest
@testable import RandomHuman

class RandomHumanTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }


    //MARK: API
    func testRandomUserAPIConnection() {
        let interactor = APIInteractor()
        let expectation = XCTestExpectation(description: "getRadomUser api")
        var person: Person?
        var requestError: RandomAPIError?
        interactor.getRandomPerson(onCompletion: { result in
            switch result {
            case .success(let personReceived):
                person = personReceived
            case .failure(let error):
                requestError = error
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(person)
        XCTAssertNil(requestError)
    }
    
    func testThreeRandomUserAPIConnection() {
        let expectation = XCTestExpectation(description: "getThreeRandomUser api")
        
        let interactor = APIInteractor()
        var people: People?
        var requestError: RandomAPIError?
        interactor.getThreeRandomPerson { result in
            switch result {
            case .success(let peopleReceived):
                people = peopleReceived
            case .failure(let error):
                requestError = error
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(people)
        XCTAssertEqual(people?.count, 3)
        XCTAssertNil(requestError)
    }
}
