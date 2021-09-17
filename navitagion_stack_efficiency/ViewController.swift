//
//  ViewController.swift
//  navitagion_stack_efficiency
//
//  Created by Serkan Mehmet Malagiç on 17.09.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController inserted")
        getData()
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        pushVC(vc: self, sb: "NE1VCSB")
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        
        switch segmentController.selectedSegmentIndex
        {
        case 0:
            efficiency = true
            break
        case 1:
            efficiency = false
            break
        default:
            break
        }
    }
}

extension UIViewController {
    
    func cleanViewControllersFromStack(viewcontroller: UIViewController){
        
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        viewcontroller.view.window?.layer.add(transition, forKey: nil)
        
        viewcontroller.navigationController?.viewControllers.removeAll(where: { (vc) -> Bool in
            if vc.isKind(of: NE1ViewController.self) {
                print("NE1ViewController removed")
                return true
            }
            else if vc.isKind(of: NE2ViewController.self) {
                print("NE2ViewController removed")
                return true
            }
            else if vc.isKind(of: NE3ViewController.self) {
                print("NE3ViewController removed")
                return true
            }
            else {
                return false
            }
            
        })
    }
    
    func pushVC (vc : UIViewController, sb : String ) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: sb) as? UIViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func getData(){
        
        for _ in 0 ..< 100 {
            guard let url = URL(string: "https://swapi.dev/api/people") else { return}
            AF.request(url).responseJSON { (reponse) in
                print(reponse)
            }
        }
        
        
    }
}
