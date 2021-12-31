//
//  SelectedCarViewController.swift
//  FinalProjectiOS
//
//  Created by tornike on 29.12.21.
//

import UIKit

class SelectedCarViewController: UIViewController {
    @IBOutlet weak var SelectedCarTableView: UITableView!
    @IBOutlet weak var presentToPurchasePage: UIButton!
    
    var selectedIndexes = [Cars]()
    override func viewDidLoad() {
        super.viewDidLoad()
        SelectedCarTableView.dataSource = self
        SelectedCarTableView.delegate = self
    }

    
    @IBAction func presentPurchasePage(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "SuccessfulPurchaseStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "SuccessfulPurchaseViewController") as? SuccessfulPurchaseViewController
        self.present(vc!, animated: true)
    }

}


