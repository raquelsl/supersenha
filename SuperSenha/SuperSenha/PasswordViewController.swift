//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Aluno on 20/11/21.
//

import UIKit

class PasswordViewController: UIViewController {

    
    
    
    @IBOutlet weak var tvPasswords: UITextView!
        var passwordGenerator: PasswordGenerator!
        var numberOfCharacters: Int = 10 // default se usuario nao enviar
        var numberOfPasswords: Int = 1
        var useLetters: Bool!
        var useNumbers: Bool!
        var useCapitalLetters: Bool!
        var useSpecialCharacters: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialLetters: useSpecialCharacters)
        gerarSenhasnovamente()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func gerarNovamente(_ sender: Any) {
        
        gerarSenhasnovamente()
    }
   private func gerarSenhasnovamente() {
        
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0)) // posiciona a scroll no topo da view
        tvPasswords.text = "" // limpa a view
               
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }

}
