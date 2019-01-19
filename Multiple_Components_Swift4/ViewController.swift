//
//  ViewController.swift
//  Multiple_Components_Swift4
//
//  Created by DeEp KapaDia on 19/05/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class Country {
    
    var country: String
    var cities: [String]
    
    init(country:String,cities:[String]) {
        self.cities = cities
        self.country = country
    }
    
}

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    

    @IBOutlet weak var PickerView: UIPickerView!
    
    @IBOutlet weak var CountryLBL: UILabel!
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        PickerView.delegate = self
        PickerView.dataSource = self
        PickerView.tintColor =  UIColor.black
        
        countries.append(Country(country:"India", cities: ["Delhi","Surat","mumbai"]))
        countries.append(Country(country:"USA", cities: ["New York","DC","Fairfax"]))
        countries.append(Country(country:"Austrailia", cities: ["Sydney","Malbourne"]))
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            
            return countries.count
            
        }else{
            
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].cities.count
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return countries[row].country
            
        }else{
            
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].cities[row]
            
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        
        
        let selectedCountry = pickerView.selectedRow(inComponent: 0)
        let selectedCity = pickerView.selectedRow(inComponent: 1)
        
        let count = countries[selectedCountry].country
        let city = countries[selectedCountry].cities[selectedCity]
        
        CountryLBL.text = "Countery:\(count) And City:\(city)"

        
    }

}

