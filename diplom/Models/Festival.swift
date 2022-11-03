import UIKit

class Festival {
    let festivalTitle: String
    let firstDate: Date
    let lastDate: Date
    let location: Country
    let festivalDescription: String
    let festivalIcon: UIImage?
    let photo: UIImage?
    let genre: [Genre]
    var isFavourite: Bool
    
    init(festivalTitle: String,
         firstDate: Date,
         lastDate: Date,
         location: Country,
         festivalDescription: String,
         festivalIcon: UIImage?,
         photo: UIImage?,
         genre: [Genre],
         isFavourite: Bool) {
        self.festivalTitle = festivalTitle
        self.firstDate = firstDate
        self.lastDate = lastDate
        self.location = location
        self.festivalDescription = festivalDescription
        self.festivalIcon = festivalIcon
        self.photo = photo
        self.genre = genre
        self.isFavourite = isFavourite
    }
}
