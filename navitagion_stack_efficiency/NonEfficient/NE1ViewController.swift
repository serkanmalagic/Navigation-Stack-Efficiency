//
//  NE1ViewController.swift
//  navitagion_stack_efficiency
//
//  Created by Serkan Mehmet Malagiç on 17.09.2021.
//

import UIKit

class NE1ViewController: UIViewController {
    
    override func viewDidLoad() {super.viewDidLoad()}
    @IBAction func nextTapped(_ sender: Any) {
        pushVC(vc: self, sb: "NE2VCSB")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("NE1ViewController inserted")
        getData()
    }
}
class NE2ViewController: UIViewController {
    
    override func viewDidLoad() {super.viewDidLoad()}
    @IBAction func nextTapped(_ sender: Any) {
        pushVC(vc: self, sb: "NE3VCSB")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("NE2ViewController inserted")
        getData()
    }
}

class NE3ViewController: UIViewController {
    
    override func viewDidLoad() {super.viewDidLoad()}
    
    @IBAction func nextTapped(_ sender: Any) {
        pushVC(vc: self, sb: "NE4VCSB")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("NE3ViewController inserted")
        getData()
    }
}
class NE4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if efficiency{
            self.cleanViewControllersFromStack(viewcontroller: self)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        print("NE4ViewController inserted")
        getData()
    }
}
