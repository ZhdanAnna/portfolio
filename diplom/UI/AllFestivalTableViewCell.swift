import UIKit

class AllFestivalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var festivalImage: UIImageView!
    @IBOutlet weak var festivalTitle: UILabel!
    
    func updateCell(festival: Festival) {
        festivalImage.image = festival.festivalIcon
        festivalTitle.text = festival.festivalTitle
    }
}
