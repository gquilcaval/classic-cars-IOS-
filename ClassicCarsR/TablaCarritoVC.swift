//
//  TablaCarritoVC.swift
//  ClassicCarsR
//
//  Created by Jonathan Quilla valenzuela on 12/8/20.
//  Copyright © 2020 Axel Romani. All rights reserved.
//

import UIKit

class TablaCarritoVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
     let mangerDB = CoreDataManager()
     var modelo : [Favorito] = []
     
     
     struct CustomData {
         var image: UIImage
     }
     
   
     
     
     
     
   
     
     
     
     
    
         
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         modelo.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cellIndex = indexPath.item
         let cell = tableView.dequeueReusableCell(withIdentifier: "cellCarrito", for: indexPath) as! ProductoViewCell
         
         cell.layer.cornerRadius = 20
        
         
         let url =  modelo[cellIndex].foto
         let urlPhoto1 = url
         
         
         
         if let objURL = URL(string: urlPhoto1!){
             
             if let datos = try? Data(contentsOf: objURL){
                 if let imagen = UIImage(data: datos) {
                    cell.Imagen.image = imagen
                 }else {
                     //error
                 }
             }else{
                 //error
             }
         }
      
         cell.Nombre.text = (String) (modelo[cellIndex].id)
         cell.Precio.text = "S./" + (String)(modelo[cellIndex].precio)
         cell.lblCantidad.text = (String)(modelo[cellIndex].cantidad)
         
         cell.delegate = self
         cell.cod = modelo[cellIndex].id
         cell.nom = "Ceviche"/*modelo[cellIndex].modelo*/
         cell.pre = 25/*modelo[cellIndex].precio*/
         cell.cant = modelo[cellIndex].cantidad
         cell.foto =
             "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Cebiche_de_corvina.JPG/1200px-Cebiche_de_corvina.JPG"/*modelo[cellIndex].img*/
        
         return cell
     }
     

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }



}
