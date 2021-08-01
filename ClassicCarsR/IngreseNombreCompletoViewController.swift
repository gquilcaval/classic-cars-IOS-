

import UIKit

class IngreseNombreCompletoViewController: UIViewController {

    
   
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    
    
    var nombreX: String!
    var apellidox: String!
    
    var EmailZ: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    @IBAction func btnSiguienteNombreCompleto(_ sender: Any) {
        
        nombreX = txtNombre.text
        apellidox = txtApellido.text
        
        
        if nombreX.isEmpty {
            
            let ventana = UIAlertController(title: "AVISO", message: "Ingresa tu nombre", preferredStyle: .alert)
            let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            ventana.addAction(botonOK)
            self.present(ventana, animated: true, completion: nil)
            return
        
        }else if apellidox.isEmpty {
            
            let ventana = UIAlertController(title: "AVISO", message: "Ingresa tu Apellido", preferredStyle: .alert)
            let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            ventana.addAction(botonOK)
            self.present(ventana, animated: true, completion: nil)
            return
        }
        
        performSegue(withIdentifier: "IrAIngresarContrasena", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vista = segue.destination as? IngreseContrasenaViewController {
            
            vista.nombreZ = nombreX
            vista.ApellidoZ = apellidox
            vista.EmailZ = EmailZ
        }
    }
    
}
