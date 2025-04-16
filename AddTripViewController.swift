//
//  AddTripViewController.swift
//  StyleCast
//
//  Created by Franczeska Ferariza on 4/9/25.
//

import UIKit

class AddTripViewController: UIViewController {

   
    @IBOutlet weak var destinationTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var getOutfitButton: UIButton!
    @IBOutlet weak var destinationTypeLabel: UILabel!

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var enterCityLabel: UILabel!
    
    // MARK: - Stored Data
    let apiKey = "bb42cd229a55b90a60f27048098a64e2"
    var selectedCity: String = ""
    var selectedDestinationType: String = ""

      // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Trip"
      }
    @IBAction func getOutfitTapped(_ sender: UIButton) {
        // You’ll handle API call and outfit logic here
        guard let cityInput = cityTextField.text, !cityInput.isEmpty else {
            print("Please enter a city.")
                return
            }

        selectedCity = cityInput
        let typeIndex = destinationTypeSegmentControl.selectedSegmentIndex
        let destinationTypes = ["City", "Beach", "Nature"]
        selectedDestinationType = destinationTypes[typeIndex]
        fetchWeather(for: selectedCity)
    }
    
    func fetchWeather(for city: String) {
        let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityEncoded)&appid=\(apiKey)&units=imperial"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let main = json["main"] as? [String: Any],
                   let temp = main["temp"] as? Double,
                   let weatherArray = json["weather"] as? [[String: Any]],
                   let description = weatherArray.first?["description"] as? String {

                    let weatherString = "\(Int(temp))°F, \(description.capitalized)"
                    let outfit = self.generateOutfit(for: temp, type: self.selectedDestinationType)

                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "ShowOutfitSuggestion", sender: (weatherString, outfit))
                    }
                }
            } catch {
                print("JSON parsing error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    // MARK: - Outfit Logic
    func generateOutfit(for temp: Double, type: String) -> String {
        switch temp {
        case ..<50:
            return "Warm coat, sweater, boots"
        case 50..<70:
            return "Light jacket, jeans, sneakers"
        default:
            return "T-shirt, shorts, sandals"
        }
    }
    
    //MARk: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowOutfitSuggestion",
           let destinationVC = segue.destination as? OutfitSuggestionViewController,
           let data = sender as? (String, String) {

            destinationVC.city = selectedCity
            destinationVC.destinationType = selectedDestinationType
            destinationVC.weather = data.0
            destinationVC.outfit = data.1
        }
    }
}

