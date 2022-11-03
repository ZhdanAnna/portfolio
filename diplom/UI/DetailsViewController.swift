import UIKit
class DetailsViewController: UIViewController {
    @IBOutlet weak var festivalPhoto: UIImageView!
    @IBOutlet weak var festivalIcon: UIImageView!
    @IBOutlet weak var festivalTitle: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var festivalDescription: UILabel!
    @IBOutlet weak var isFavourite: UIButton!
    
    var festival: Festival?
    
    @IBAction func buttonValueChange(_ sender: UIButton) {
        festival?.isFavourite.toggle()
        updateFavouriteIcon()
    }
    
    func configUI() {
        festivalPhoto.image = festival?.photo
        festivalIcon.image = festival?.festivalIcon
        festivalTitle.text = festival?.festivalTitle
        location.text = festival?.location.rawValue.capitalized
        festivalDescription.text = festival?.festivalDescription
        updateFavouriteIcon()
        
    }
    
    func updateFavouriteIcon() {
        if festival?.isFavourite == true {
            isFavourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            isFavourite.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        configUI()
    }
}
