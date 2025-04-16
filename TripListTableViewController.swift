import UIKit

class TripListTableViewController: UITableViewController {

    var trips: [Trip] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Trips"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadTrips()
        sortTrips()
        tableView.reloadData()
    }

    func loadTrips() {
        if let data = UserDefaults.standard.data(forKey: "savedTrips") {
            let decoder = JSONDecoder()
            trips = (try? decoder.decode([Trip].self, from: data)) ?? []
        }
    }

    func saveTrips() {
        if let encoded = try? JSONEncoder().encode(trips) {
            UserDefaults.standard.set(encoded, forKey: "savedTrips")
        }
    }

    func sortTrips() {
        // Show pinned trips first
        trips.sort { $0.isPinned && !$1.isPinned }
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath)
        let trip = trips[indexPath.row]
        let pinSymbol = trip.isPinned ? "📍 " : ""
        cell.textLabel?.text = "\(pinSymbol)\(trip.city)"
        return cell
    }

    // MARK: - Swipe Actions (Delete + Pin)

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        // Delete
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completionHandler in
            self?.trips.remove(at: indexPath.row)
            self?.saveTrips()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }

        // Pin / Unpin
        let trip = trips[indexPath.row]
        let pinTitle = trip.isPinned ? "Unpin" : "Pin"
        let pinAction = UIContextualAction(style: .normal, title: pinTitle) { [weak self] _, _, completionHandler in
            self?.trips[indexPath.row].isPinned.toggle()
            self?.sortTrips()
            self?.saveTrips()
            tableView.reloadData()
            completionHandler(true)
        }

        pinAction.backgroundColor = .systemBlue

        let config = UISwipeActionsConfiguration(actions: [deleteAction, pinAction])
        return config
    }

    // MARK: - Navigation to Detail

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TripDetailSegue",
           let destinationVC = segue.destination as? TripDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedTrip = trips[indexPath.row]
        }
    }
}


