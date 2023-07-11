//
//  TestViewController.swift
//  skylab-kino
//
//  Created by Леонід Квіт on 10.07.2023.
//

import UIKit

class TestViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var testLabel: UILabel!
    //    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        //fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = "TExt"
        testLabel.textColor = .red
        
        view.backgroundColor = .orange
        //navigationController?.tabBarController?.tabBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
