//
//  SecurityTipsViewController.swift
//  SuperSenha
//
//  Created by Aluno on 20/11/21.
//

import UIKit

class SecurityTipsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func fechar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
