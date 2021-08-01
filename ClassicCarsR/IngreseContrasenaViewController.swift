
import UIKit

class IngreseContrasenaViewController: UIViewController {

    
    @IBOutlet weak var txtContrasena: UITextField!
    
    var contrasenaX: String!
    
    var nombreZ: String!
    var ApellidoZ: String!
    
    var EmailZ: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func btnSiguienteContrasena(_ sender: Any) {
        contrasenaX = txtContrasena.text
        
        if contrasenaX.isEmpty {
            
            let ventana = UIAlertController(title: "AVISO", message: "Ingresa una contrasena", preferredStyle: .alert)
            let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            ventana.addAction(botonOK)
            self.present(ventana, animated: true, completion: nil)
            return
        }

        
        performSegue(withIdentifier: "IrAIngresarNacimiento", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vista = segue.destination as? IngresaNacimientoViewController {
            
            vista.ContrasenaZ = contrasenaX
            vista.nombreZ = nombreZ
            vista.ApellidoZ = ApellidoZ
            vista.EmailZ = EmailZ
        }
    }

}
