//
//  PerfilViewController.swift
//  ClassicCarsR
//
//  Created by AnthonyDeca on 18/11/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {
    
    
 
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblCorreo: UILabel!
   @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var btnCerrarSecion: UIButton!
    
    static var nombre: String!
    static var correo: String!
    static var foto: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnCerrarSecion.layer.cornerRadius = 20
        self.btnCerrarSecion.layer.borderWidth = 1
        self.btnCerrarSecion.layer.cornerRadius = 20
        self.btnCerrarSecion.layer.borderColor = UIColor.systemBlue.cgColor
        
        lblNombre.text = PerfilViewController.nombre
        lblCorreo.text = PerfilViewController.correo
        if let objURL = URL(string: PerfilViewController.foto){
            
            if let datos = try? Data(contentsOf: objURL){
                if let imagen = UIImage(data: datos) {
                    foto.image = imagen
                }else {
                    //error
                }
            }else{
                //error
            }
        }

        foto.layer.borderWidth = 1.0
        foto.layer.masksToBounds = false
        foto.layer.borderColor = UIColor.white.cgColor
        foto.layer.cornerRadius = foto.frame.size.width / 2
        foto.clipsToBounds = true
    }
    
  
    @IBAction func cerrarSecion(_ sender: Any) {
    }
}

