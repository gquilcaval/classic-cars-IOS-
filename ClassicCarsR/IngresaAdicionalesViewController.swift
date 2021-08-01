
import UIKit

class IngresaAdicionalesViewController: UIViewController {

   
    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtTLF: UITextField!
    
    var dniX: String!
    var direccionX: String!
    var tlfX: String!
    

    var nombreZ: String!
    var ApellidoZ: String!
    var EmailZ: String!
    var DniZ: String!
    var DireccionZ: String!
    var TLFZ: String!
    var NacimientoZ: String!
    var ContrasenaZ: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    @IBAction func btnSiguiente(_ sender: Any) {
        
        dniX = txtDni.text
        direccionX = txtDireccion.text
        tlfX = txtTLF.text
        
        if dniX.isEmpty {
            
            let ventana = UIAlertController(title: "AVISO", message: "Ingresa tu DNI", preferredStyle: .alert)
            let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            ventana.addAction(botonOK)
            self.present(ventana, animated: true, completion: nil)
            return
            
        }else if direccionX.isEmpty {
            
            let ventana = UIAlertController(title: "AVISO", message: "Ingresa tu Direccion", preferredStyle: .alert)
            let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            ventana.addAction(botonOK)
            self.present(ventana, animated: true, completion: nil)
            return
            
        }else if tlfX.isEmpty {
            
            let ventana = UIAlertController(title: "AVISO", message: "Ingresa tu Telefono", preferredStyle: .alert)
            let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            ventana.addAction(botonOK)
            self.present(ventana, animated: true, completion: nil)
            return
        }
        
        
        
        
        
        var parametros = ["nombre": nombreZ, "apellido": ApellidoZ, "email": EmailZ, "dni": dniX, "direccion": direccionX, "telefono": tlfX,
                          "fechaNac": NacimientoZ, "password": ContrasenaZ]
        
        guard let urlX = URL(string: "https://companycars.herokuapp.com/api/usuario/registrar") else {return}
        
        var urlRequest = URLRequest(url: urlX)
        
        urlRequest.httpMethod = "POST"
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parametros, options: []) else {return}
        
        urlRequest.httpBody = httpBody
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            
            
            if let response = response{
                print(response)
            }
            
            guard let data = data else{return}
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
            }catch {
                print(error)
            }
        }.resume()
        
        performSegue(withIdentifier: "goLogin", sender: nil)

    }
    


    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vista = segue.destination as? IngresaAdicionalesViewController {
            
            vista.nombreZ = nombreZ
            vista.ApellidoZ = ApellidoZ
            vista.EmailZ = EmailZ
            vista.ContrasenaZ = ContrasenaZ
            vista.NacimientoZ = NacimientoZ
        }
    }

}
