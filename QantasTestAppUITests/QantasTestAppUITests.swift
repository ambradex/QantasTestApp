//
//  QantasTestAppUITests.swift
//  QantasTestAppUITests
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import XCTest

final class AirportAppUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testAirportListAppears() throws {
        let airportList = app.collectionViews["AirportList"]

        XCTAssertTrue(airportList.waitForExistence(timeout: 10), "Airport list should appear")

        let firstCell = airportList.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "At least one airport cell should exist")

        let navBar = app.navigationBars["Airports"]
        XCTAssertTrue(navBar.exists, "Navigation bar with title 'Airports' should exist")
    }

    func testAirportDetailViewDisplays() throws {
        let airportList = app.collectionViews["AirportList"]
        XCTAssertTrue(
            airportList.waitForExistence(timeout: 10), "Airport list should appear before tapping")

        let firstCell = airportList.cells.firstMatch
        XCTAssertTrue(firstCell.exists, "First airport cell should exist before tapping")
        firstCell.tap()

        let detailList = app.collectionViews["AirportDetailList"]
        XCTAssertTrue(
            detailList.waitForExistence(timeout: 10),
            "Airport detail list should appear after tapping an airport"
        )

        let codeRow = detailList.staticTexts["Code"]
        let nameRow = detailList.staticTexts["Name"]
        let countryRow = detailList.staticTexts["Country"]

        XCTAssertTrue(codeRow.exists, "Detail row for 'Code' should exist")
        XCTAssertTrue(nameRow.exists, "Detail row for 'Name' should exist")
        XCTAssertTrue(countryRow.exists, "Detail row for 'Country' should exist")

        let title = app.navigationBars.firstMatch
        XCTAssertTrue(title.exists, "Navigation title should exist in AirportDetailView")
    }

    func testLoadingOrErrorViews() throws {
        let loadingView = app.staticTexts["LoadingView"]
        let errorView = app.staticTexts["ErrorView"]
        let listView = app.collectionViews["AirportList"]

        XCTAssertTrue(
            loadingView.exists || errorView.exists || listView.exists,
            "Either loading view, error view, or airport list should be visible"
        )
    }
}



