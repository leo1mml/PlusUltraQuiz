//
//  ViewController.swift
//  PlusUltraQuiz
//
//  Created by Leonel Menezes on 02/09/19.
//  Copyright © 2019 Leonel Menezes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

