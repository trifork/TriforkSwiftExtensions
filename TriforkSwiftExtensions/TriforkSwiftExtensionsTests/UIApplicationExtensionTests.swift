import XCTest
import UIKit
@testable import TriforkSwiftExtensions

class UIApplicationTests: XCTestCase {
    func testCanOpenPhoneUrl() {
        let canOpen = UIApplication.shared.canOpenPhoneUrl()
        // Simulators and non-phone devices cannot open phone urls
        #if targetEnvironment(simulator)
        XCTAssertFalse(canOpen)
        #else
        if UIDevice.current.userInterfaceIdiom == .phone {
            XCTAssertTrue(canOpen)
        } else {
            XCTAssertFalse(canOpen)
        }
        #endif
    }
    
    // Unfortunately, we cannot test the `.present` method, since the system fails to present the view controllers in a unit test
    func testTopViewController() {
        let window = UIWindow()
        let tabBarController = UITabBarController()
        window.rootViewController = tabBarController
        XCTAssertEqual(tabBarController, UIApplication.topViewController(controller: window.rootViewController))
        
        let viewController1 = UIViewController()
        viewController1.title = "1"
        let navCon = UINavigationController(rootViewController: viewController1)
        let viewController2 = UIViewController()
        viewController2.title = "2"
        tabBarController.viewControllers = [ navCon, viewController2 ]
        tabBarController.selectedIndex = 0
        
        XCTAssertEqual(viewController1, UIApplication.topViewController(controller: window.rootViewController))
        tabBarController.selectedIndex = 1
        XCTAssertEqual(viewController2, UIApplication.topViewController(controller: window.rootViewController))
        
        let viewController3 = UIViewController()
        navCon.pushViewController(viewController3, animated: false)
        tabBarController.selectedIndex = 0
        XCTAssertEqual(viewController3, UIApplication.topViewController(controller: window.rootViewController))
    }
}
