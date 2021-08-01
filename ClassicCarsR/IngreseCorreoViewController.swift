

import UIKit

class IngreseCorreoViewController: UIViewController {

  
    @IBOutlet weak var txtEmail: UITextField!
    
    var emailX: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    @IBAction func btnSiguienteCorreo(_ sender: Any) {
        
        emailX = txtEmail.text
        
        if emailX.isEmpty {
            
            let ventana = UIAlertController(title: "AVISO", message: "Ingresa tu correo", preferredStyle: .alert)
            let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            ventana.addAction(botonOK)
            self.present(ventana, animated: true, completion: nil)
            return
        }
        
        performSegue(withIdentifier: "IrAIngresarNombreCompleto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vista = segue.destination as? IngreseNombreCompletoViewController {
            
            vista.EmailZ = emailX
        }
    }
    
}
