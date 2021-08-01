
import UIKit
import  GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        
        print("entro qui")
        performSegue(withIdentifier: "goMain", sender: nil)
        PerfilViewController.nombre = user.profile.name
        PerfilViewController.correo = user.profile.email
        PerfilViewController.foto = user.profile.imageURL(withDimension: 200)?.absoluteString
        print( user.profile.imageURL(withDimension: 200))
        
    }
   
    @IBOutlet weak var btnLoginGoogle: UIButton!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegistrar: UIButton!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
        self.btnLogin.layer.cornerRadius = 20
        self.btnRegistrar.layer.borderWidth = 1
        self.btnRegistrar.layer.cornerRadius = 20
        self.btnRegistrar.layer.borderColor = UIColor.systemBlue.cgColor
        
        self.btnLoginGoogle.layer.borderWidth = 1
        self.btnLoginGoogle.layer.cornerRadius = 20
        self.btnLoginGoogle.layer.borderColor = UIColor.black.cgColor
        
    }

    
    @IBAction func googleLogin(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
                 
    }
    
    
    @IBAction func login(_ sender: Any) {
        print("Dio Click en login")
        
        
        guard let usuario = txtEmail.text else{return}
        guard let clave = txtContrasena.text else{return}
        
    
        var listaEntradas = [usuario, clave]
        
        for valor in listaEntradas{
            
            if valor.isEmpty ?? true{
                
                let ventana = UIAlertController(title: "AVISO", message: "Ingresa los campos respectivos", preferredStyle: .alert)
                let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                ventana.addAction(botonOK)
                self.present(ventana, animated: true, completion: nil)
                return
            }
        }
        
        
        print(usuario)
        print(clave)

        let parameters = "{\"email\": \"\(usuario)\", \"password\": \"\(clave)\"}"
        let postData = parameters.data(using: .utf8)
        
        let urlString = "https://companycars.herokuapp.com/api/usuario/logueo"
        if let urlRequest = URL(string: urlString) {
            var request = URLRequest(url: urlRequest)
            request.httpMethod = "POST"
            request.httpBody = postData
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let urlSession = URLSession.shared.dataTask(with: request) { (datos, cabecera, er) in
                //AQUI NUESTRO CODIGO
                
                if let er = er {
                    //SI error no es NIL, existe un ERROR
                    print(er)
                } else {
                    if let datos = datos {
                        
                        if let respuestaString = String(data: datos, encoding: .utf8) {
                            print(respuestaString)
                            
                            if respuestaString.contains("no ingreso"){
                                
                                DispatchQueue.main.async {
                                    
                                    let ventana = UIAlertController(title: "AVISO", message: "El correo o contrasena que ingresaste son incorrectos", preferredStyle: .alert)
                                    let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                                    ventana.addAction(botonOK)
                                    self.present(ventana, animated: true, completion: nil)
                                    return
                                }
                                
                            }else{
                                
                                /*SI EL CORREO Y LA CLAVE SON CORRECTAS*/
                                /*DENTRO DE ESTE "ELSE" SE TIENE Q LLAMAR AL "VIEWCONTROLLER(pantalla)" LISTADO DE AUTOS!,
                                 eso demuestra que pude ingresar a mi cuenta*/
                                DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "goMain", sender: nil)
                                print("Exito!")
                                }
                            }
                            
                            
                        } else {
                            print("ERROR AL LEER")
                        }
                        
                        
                    } else {
                        //Error desconocido
                    }
                }
            }
            //Ejecutamos el llamado a la URL
            print("EJECUTA")
            urlSession.resume()
        } else {
            //URLREQUEST es nullo
        }
        
       
    }
    
  
    @IBAction func registrar(_ sender: Any) {
        print("Dio Click en rigistrar")
        
        //Llamo a la sgte pantalla
        performSegue(withIdentifier: "irRegistro", sender: nil)
    }
}

