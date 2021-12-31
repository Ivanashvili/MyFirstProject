//
//  Extensions.swift
//  FinalProjectiOS
//
//  Created by tornike on 24.12.21.
//

import Foundation
import UIKit

extension CarModelsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carModelsArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarModelTableViewCell", for: indexPath) as! CarModelTableViewCell
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        let currentCarModel = carModelsArrays[indexPath.row]
        cell.carModelNameLabel.text = currentCarModel
        cell.carModelImageView.image = self.carModelLogos[currentCarModel] ?? UIImage()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "SpecificCarViewControllerStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "SpecificCarViewController") as? SpecificCarViewController
        vc?.specificCarArray = self.carsArray.filter{$0.make == self.carModelsArrays[indexPath.row]}
        
        self.navigationController?.pushViewController(vc!, animated: true)
        self.CarModelTableView.reloadData()
    }
}

extension SpecificCarViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.specificCarArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificCarTableViewCell", for: indexPath) as! SpecificCarTableViewCell
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        let currentSpecificCarModel = specificCarArray[indexPath.row]
        cell.carMake.text = currentSpecificCarModel.make + " " + currentSpecificCarModel.model
        cell.carHp.text = "ცხენის ძალა:"
        cell.carPrice.text = "ფასი:" + String(currentSpecificCarModel.price) + "$"
        cell.carHpCount.text = String(currentSpecificCarModel.horsepower)
        cell.CarImage.imageFromServerUrl(urlString: currentSpecificCarModel.img_url, PlaceHolderImage: UIImage())
        cell.carCounter.text = String(currentSpecificCarModel.count)
        cell.car = currentSpecificCarModel
        return cell
    }
    
}

extension SelectedCarViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedIndexes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCarTableViewCell", for: indexPath) as! SelectedCarTableViewCell
        let currentCarModel = selectedIndexes[indexPath.row]
        cell.selectedCarImage.imageFromServerUrl(urlString: currentCarModel.img_url, PlaceHolderImage: UIImage())
        cell.carMakeLbl.text = currentCarModel.make + " " + currentCarModel.model
        cell.horsePowerLbl.text = "ცხენის ძალა:"
        cell.carModelPrice.text = String(currentCarModel.price) + "$"
        cell.horsePowerCount.text = String(currentCarModel.horsepower)
//       if selectedIndexes.contains(currentCarModel.make){
//
//        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
}

extension UIImageView {
    public func imageFromServerUrl(urlString: String, PlaceHolderImage: UIImage) {
        
        if self.image == nil{
            self.image = PlaceHolderImage
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}

extension UIViewController {
    func showAlert(alertText : String, alertMessage : String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "დახურვა", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
      }
}
