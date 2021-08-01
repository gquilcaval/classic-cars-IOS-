

import UIKit

class IngresaNacimientoViewController: UIViewController {

   
    @IBOutlet weak var txtNacimiento: UITextField!
    
    var fechaX: String!
    
    var nombreZ: String!
    var ApellidoZ: String!
    
    var EmailZ: String!
    
    var ContrasenaZ: String!
    
    
    
    let datePicker1 = UIDatePicker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createDatePicker()
    }
    
    func createDatePicker(){
        
        txtNacimiento.textAlignment = .center
        
        let toolbarX = UIToolbar()
        
        toolbarX.sizeToFit()
        
        let doneBtnX = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
    
        toolbarX.setItems([doneBtnX], animated: true)
        
        txtNacimiento.inputAccessoryView = toolbarX
        
        txtNacimiento.inputView = datePicker1
        
        datePicker1.datePickerMode = .date
    }
    
    @objc func donePressed(){
        
        let formato = DateFormatter()
        
        formato.dateStyle = .medium
        formato.timeStyle = .none
        
        txtNacimiento.text = formato.string(from: datePicker1.date)
        
        self.view.endEditing(true)
    }
    
    

    @IBAction func btnSiguienteNacimiento(_ sender: Any) {
        fechaX = txtNacimiento.text
        
        if fechaX.isEmpty {
            
            let ventana = UIAlertController(title: "AVISO", message: "Ingresa tu Fecha Nacimiento", preferredStyle: .alert)
            let botonOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            ventana.addAction(botonOK)
            self.present(ventana, animated: true, completion: nil)
            return
        }
        
        
        performSegue(withIdentifier: "IrADatosAdicionales", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vista = segue.destination as? IngresaAdicionalesViewController {
            
            vista.NacimientoZ = fechaX
            vista.nombreZ = nombreZ
            vista.ApellidoZ = ApellidoZ
            vista.EmailZ = EmailZ
            vista.ContrasenaZ = ContrasenaZ
        }
    }
}
