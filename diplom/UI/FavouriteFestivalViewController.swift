
import UIKit
class FavouriteFestivalViewController: UIViewController,
                                       UITableViewDataSource,
                                       UITableViewDelegate,
                                       UISearchBarDelegate {
    
    private let storageFestival = FestivalStorage.shared
    private var displaedFestival: [Festival] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaedFestival = storageFestival.getFavouriteFestivals()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storageFestival.getFavouriteFestivals().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "FavouriteFestivalViewControllerID"
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? AllFestivalTableViewCell
        else {
            return UITableViewCell()
        }
        let festival = self.storageFestival.getFavouriteFestivals()[indexPath.row]
        cell.updateCell(festival: festival)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFestival = storageFestival.getFavouriteFestivals()[indexPath.row]
        showDetailsViewController(festival: selectedFestival)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            displaedFestival = storageFestival.getFavouriteFestivals()
        } else {
            displaedFestival = storageFestival.getFavouriteFestivals().filter({ $0.festivalTitle.lowercased().contains(searchText.lowercased())
            })
        }
    }
    
    func showDetailsViewController(festival: Festival) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyboard.instantiateViewController(identifier: "DetailsViewControllerID") as? DetailsViewController
        guard let detailsViewController = detailsViewController else {
            print("DetailsViewController did't found")
            return
        }
        detailsViewController.festival = festival
        show(detailsViewController, sender: nil)
    }
}
