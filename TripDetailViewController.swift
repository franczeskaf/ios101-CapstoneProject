import UIKit

class TripDetailViewController: UIViewController {

    var selectedTrip: Trip?

    @IBOutlet weak var tripLabel: UILabel!
    @IBOutlet weak var outfitLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trip Details"
        
        if let trip = selectedTrip {
            tripLabel.text = "Trip: \(trip.city)"
            typeLabel.text = "Destination Type: \(trip.type)"
            weatherLabel.text = "Weather: \(trip.weather)"
            outfitLabel.text = "Outfit: \(trip.outfit)"
        }
    }
}
