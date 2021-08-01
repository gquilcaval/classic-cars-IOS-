//
//  DetalleVC.swift
//  ClassicCarsR
//
//  Created by Jonathan Quilla valenzuela on 12/11/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import UIKit

class DetalleVC: UIViewController {

    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    static var nombre: String = ""
    static var precio: String = ""
    static var foto: String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNombre.text = DetalleVC.nombre
        lblPrecio.text = "S./"+DetalleVC.precio
        if let objURL = URL(string: DetalleVC.foto!){
            
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

}
