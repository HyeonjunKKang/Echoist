

import Foundation

import UIKit

public class BaseNavigationController: UINavigationController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }
}
