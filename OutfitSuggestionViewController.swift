import UIKit

class OutfitSuggestionViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var saveTrip: UIButton!
    @IBOutlet weak var outfitLabel: UILabel!
    @IBOutlet weak var tripLabel: UILabel!
    
    // MARK: - Variables to receive data
    var city: String?
    var destinationType: String?
    var weather: String?
    var outfit: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Outfit Suggestion"
        
        // Display passed-in data
        tripLabel.text = city ?? "Unknown City"
        weatherLabel.text = weather ?? "No Weather Info"
        outfitLabel.text = outfit ?? "No Outfit Suggested"
    }
    
    // MARK: - Actions
    @IBAction func saveTripTapped(_ sender: UIButton) {
        guard let city = city,
                 let type = destinationType,
                 let weather = weather,
                 let outfit = outfit else {
               print("Missing trip info")
               return
           }

           let newTrip = Trip(city: city, type: type, weather: weather, outfit: outfit)

           // Fetch existing trips
           var savedTrips: [Trip] = []
           if let data = UserDefaults.standard.data(forKey: "savedTrips") {
               let decoder = JSONDecoder()
               savedTrips = (try? decoder.decode([Trip].self, from: data)) ?? []
           }

           // Add and save back
           savedTrips.append(newTrip)
        if let encoded = try? JSONEncoder().encode(savedTrips) {
            UserDefaults.standard.set(encoded, forKey: "savedTrips")
            print("Trip saved!")
            
            // ✅ Confirmation Alert
            let alert = UIAlertController(
                title: "Trip Saved!",
                message: "Your trip to \(city) has been saved.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}

