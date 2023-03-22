//
//  RouterTests.swift
//  WeatherTests
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import XCTest
import UIKit
@testable import Weather

class RouterTests: XCTestCase {
    private func getRouterSut(navigationController: UINavigationController) -> Router {
        let router = Router(rootController: navigationController)
        return router
    }
    
    func testPresent() {
        let mockNavigation = NavigationControllerMock()
        let sut = getRouterSut(navigationController: mockNavigation)
        let module = UIViewController()
        sut.present(module,
                    animated: true)
        XCTAssertTrue(mockNavigation.isPresented)
    }
    
    func testSetRootModule() {
        let mockNavigation = NavigationControllerMock()
        let sut = getRouterSut(navigationController: mockNavigation)
        let module = UIViewController()
        sut.setRootModule(module: module)
        XCTAssertTrue(mockNavigation.isRootControllerSet)
    }
}



class NavigationControllerMock: UINavigationController {
    
    var isPresented: Bool = false
    var isRootControllerSet: Bool = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        isPresented = true
    }
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        isRootControllerSet = true
    }
}
