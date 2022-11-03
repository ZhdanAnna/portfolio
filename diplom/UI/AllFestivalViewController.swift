import UIKit

class AllFestivalViewController: UIViewController,
                                 UITableViewDataSource,
                                 UITableViewDelegate,
                                 UISearchBarDelegate {
    
    private let storageFestival = FestivalStorage.shared
    private var sortModel: SortModel = SortModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func sortButtonDidPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sortingViewController = storyboard.instantiateViewController(identifier: "SortingViewControllerID") as? SortingViewController
        guard let sortingViewController = sortingViewController else {
            print("SortingViewController did't found")
            return
        }
        sortingViewController.sortModel = sortModel
        sortingViewController.applyHeandler = { [weak self] model in
            self?.sortModel = model
            self?.dismiss(animated: true)
            self?.tableView.reloadData()
        }
        present(sortingViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getDisplayedFestivals().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "AllFestivalTableViewCellID"
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath) as? AllFestivalTableViewCell else {
            return UITableViewCell()
        }
        let festival = getDisplayedFestivals()[indexPath.row]
        cell.updateCell(festival: festival)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedFestival = getDisplayedFestivals()[indexPath.row]
        showDetailsViewController(festival: selectedFestival)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableView.reloadData()
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
    
    func getDisplayedFestivals() -> [Festival] {
        var festivals = storageFestival.getFestivals()
        
        if let searchText = searchBar.text, !searchText.isEmpty {
            festivals = festivals.filter { $0.festivalTitle.lowercased().contains(searchText.lowercased()) }
        }
        
        if let gener = sortModel.gener {
            festivals = festivals.filter { $0.genre.contains(gener) }
        }
        if let country = sortModel.country {
            festivals = festivals.filter { $0.location == country }
        }
        return festivals
    }
}

