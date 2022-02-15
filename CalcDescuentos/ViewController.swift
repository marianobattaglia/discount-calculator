//
//  ViewController.swift
//  CalcDescuentos
//
//  Created by Mariano Battaglia on 16/01/2022.
//

import UIKit

class ViewController: UIViewController {

    // Espacio para funciones de los INPUTS
    
    @IBOutlet weak var resultado: UILabel!
    
    @IBOutlet weak var resultadoDescuento: UILabel!
    
    @IBOutlet weak var cantidadtxt: UITextField!
    
    @IBOutlet weak var porcentajetxt: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Funcion para corregir posicion de pantalla al abrir el teclado. Va a desplazar hacia arriba cuando se abra en pantallas pequeñas:
        NotificationCenter.default.addObserver(self, selector: #selector((tecladoUp)), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Funcion para cuando esconde teclado
        NotificationCenter.default.addObserver(self, selector: #selector((tecladoDown)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    // Funcion para que el teclado suba
    @objc func tecladoUp() {
        // Defino variable a la que aplica funcion, para pantallas menores a 1136 pixeles
        let sizeScreen = UIScreen.main.nativeBounds.height
        if sizeScreen <= 1136 {
            // condicion para que la pantalla suba al abrir teclado:
            if self.view.frame.origin.y == 0 { //si la pos. inicial=0
                self.view.frame.origin.y = -100 //desplazar -50 y
            }
        }
    }
    
    //Funcion para que el teclado baje
    @objc func tecladoDown() {
        if self.view.frame.origin.y != 0 { //si es distinto q 0
            self.view.frame.origin.y = 0  // volver a pos. 0
        }
    }

    // Quitar teclado
    // cuando demos click en la pantalla desaparece teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
    
    
    
    
    // Funcion de Botones
    
    @IBAction func calcular(_ sender: UIButton) {
        guard let cantidad = cantidadtxt.text else { return  }
        guard let porcentaje = porcentajetxt.text else { return  }
        // convierto los Strings a numero tipo Float
        let cant = (cantidad as NSString).floatValue
        let porciento = (porcentaje as NSString).floatValue
        
        //logica
        let desc = cant * porciento/100 //Defino variable para el "descuento"
        let res = cant - desc //Calculo resultado en variable "res"
        
        resultado.text = "$\(res)"
        resultadoDescuento.text = "$\(desc)"
        //limpiar teclado
        self.view.endEditing(true)
    }
    
    @IBAction func limpiar(_ sender: UIButton) {
        //Limpio las variables
        cantidadtxt.text = ""
        porcentajetxt.text = ""
        
        //Vuelvo a colocar en cero los outputs 
        resultado.text = "$0.00"
        resultadoDescuento.text = "$0.00"
    }
    
}

