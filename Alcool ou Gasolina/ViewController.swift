//
//  ViewController.swift
//  Alcool ou Gasolina
//
//  Created by Luiz Correa on 07/09/20.
//  Copyright © 2020 Luiz Correa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        if let precoAlcool = precoAlcoolCampo.text {
            if let precoGasolina = precoGasolinaCampo.text {
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                
                if (validaCampos) {
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                } else {
                    resultadoLegenda.text = "Digite os preços para validar"
                }
            }
        }
    }
    
    /**
     *  Faz o calculo para saber o melhor valor
     */
    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) {
        // converter valores
        if let valorAlcool = Double(precoAlcool) {
            if let valorGasolina = Double(precoGasolina) {
                let resultadoPreco = valorAlcool / valorGasolina
                
                if (resultadoPreco >= 0.7) {
                    self.resultadoLegenda.text = "Melhor optar por gasolina"
                } else {
                    self.resultadoLegenda.text = "Melhor optar por álcool"
                }
            }
        }
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        var camposValidados = true
            
        if precoAlcool.isEmpty {
            camposValidados = false
        }
        
        if precoGasolina.isEmpty {
            camposValidados = false
        }
        
        return camposValidados
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

