//
//  ViewController.swift
//  DeeplinkResolver
//
//  Created by Yuri Cavalcanti on 14/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let components1 = URLComponents(string: "/payments/reprocessing?id=123") else { return }
        guard let components2 = URLComponents(string: "/bankslip") else { return }
        guard let components3 = URLComponents(string: "/home") else { return }
        guard let components4 = URLComponents(string: "/invalid") else { return }
        Coordinator(deeplink: components4).start()
    }
}

