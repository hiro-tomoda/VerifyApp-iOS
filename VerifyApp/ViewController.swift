//
//  ViewController.swift
//  VerifyApp
//
//  Created by yuwa on 2019/01/11.
//  Copyright © 2019 yuwa-seisakusho. All rights reserved.
//

import UIKit

/**
 * メニュー画面
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func noStoryboardButton(_ sender: Any) {
        let vc = NoStoryBoardViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

