//
//  ViewController.swift
//  SuperSenha
//
//  Created by Aluno on 20/11/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfTotalPasswords: UITextField!
       @IBOutlet weak var tfNumberOfCharacters: UITextField!
       @IBOutlet weak var swLetters: UISwitch!
       @IBOutlet weak var swNumbers: UISwitch!
       @IBOutlet weak var swSpecialCharacters: UISwitch!
       @IBOutlet weak var swCaptitalLetters: UISwitch!
        
       @IBOutlet weak var gerarSenhas: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gerarSenhas.isEnabled = true
        
        tfTotalPasswords.addTarget(self, action: #selector(ViewController.totalPasswordsChange(_:)), for: .editingChanged)
        
        tfNumberOfCharacters.addTarget(self, action: #selector(ViewController.totalCaractersChange(_:)), for: .editingChanged)
    }
        
       
                                        
            
                                        
            
  //  @IBAction func gerarSenhas(_ sender: Any) {
        
        
   // }
    
    
    /// Metodo que executa ao trocar o valor dos switchs
       @IBAction func switchChange(_ sender: Any) {
           
           gerarSenhas.isEnabled = swLetters.isOn ||
               swNumbers.isOn ||
             swSpecialCharacters.isOn ||
           swCaptitalLetters.isOn
           
           //muda a opacidade do botão dependendo se ele esta habilitado ou não
           if(gerarSenhas.isEnabled){
               gerarSenhas.alpha = 1.0;
           }else{
               gerarSenhas.alpha = 0.5;
           }
           
       }
       
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! PasswordViewController
               
                // forma mais segura (usar if let)
                if let numberOfPasswords = Int(tfTotalPasswords.text!) {
                    // se conseguir obter o valor do campo e converter para inteiro
                    vc.numberOfPasswords = numberOfPasswords
                }
                if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
                    vc.numberOfCharacters = numberOfCharacters
                }
                vc.useNumbers = swNumbers.isOn
                vc.useCapitalLetters = swCaptitalLetters.isOn
                vc.useLetters = swLetters.isOn
                vc.useSpecialCharacters = swSpecialCharacters.isOn
               
                // forcar encerrar o modo de edicao // remove o foco e libera teclado
                view.endEditing(true)
    }
    
    
     /// Change validate do campo de total de senhas
     @objc func totalPasswordsChange(_ textField: UITextField){
         if let totalPass = Int(tfTotalPasswords.text!){
             if(totalPass == 0 || totalPass > 99){
                 let template = "O valor %d é inválido para a quantidade de senhas."
                 emitAlert(title: "Quantidade de senhas inválida", message: String(format: template, totalPass))
                 tfTotalPasswords.text = "1"
             }
         }
     }
     
     
     /// Change validate do campo de total de caracteres
     @objc func totalCaractersChange(_ textField: UITextField){
         if let totalCaracters = Int(tfNumberOfCharacters.text!){
             if(totalCaracters == 0 || totalCaracters > 16){
                 let template = "O valor %d é inválido para o total de carateres."
                 emitAlert(title: "Total de caracteres inválido", message: String(format: template, totalCaracters))
                 tfNumberOfCharacters.text = "10"
             }
         }
     }
     
     
     /// Metodo emite alertas
     func emitAlert(title: String , message: String) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         
         alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
         NSLog("The \"OK\" alert occured.")
         }))
         
         self.present(alert, animated: true, completion: nil)
     }
     
}

