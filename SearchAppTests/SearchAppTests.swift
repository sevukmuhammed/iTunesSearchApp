//
//  SearchAppTests.swift
//  SearchAppTests
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import XCTest
import SearchApp
import RxSwift
import RxTest
import RxBlocking

@testable import SearchApp
@testable import RxTest
@testable import RxSwift
@testable import RxBlocking

class SearchAppTests: XCTestCase {
    
    var viewModel: SearchPageViewModel!
    var disposeBag: DisposeBag!
    var scheduler: TestScheduler!
    
    override func setUpWithError() throws {
        self.scheduler = TestScheduler(initialClock: 0)
        self.disposeBag = DisposeBag()
        self.viewModel = SearchPageViewModel(disposeBag: self.disposeBag, SearchPageRepository: SearchPageRepository())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFileManager() throws {
        guard let items = MockService.readJson() else {return}

        viewModel.behaviorRelay.accept(items)
        let trackName = try viewModel.behaviorRelay.toBlocking().first()?.results?.first?.trackName
        XCTAssertEqual(trackName, "Harry Potter and the Deathly Hallows, Part 2")

    }
    
    func testRelays() {
        guard let data = MockService.readJson() else {return}

        // create scheduler
        let rates = scheduler.createObserver(Response.self)

        viewModel.behaviorRelay.asDriver().drive(rates).disposed(by: disposeBag)

        let coldObservable = scheduler.createColdObservable([.next(10, data.results?.first),.next(20, data.results?.last)])

        scheduler.start()

        XCTAssertEqual(coldObservable.recordedEvents.first!.value.element!?.trackName, "Harry Potter and the Deathly Hallows, Part 2")
        XCTAssertEqual(coldObservable.recordedEvents.last!.value.element!?.trackName, "Harry Connick, Jr.: Lyrics to Live By")
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
