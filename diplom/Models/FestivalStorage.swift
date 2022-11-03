import UIKit

class FestivalStorage {
    
    static let shared = FestivalStorage()
    
    private lazy var festivals: [Festival] = [
        Festival(festivalTitle: "Tomorrowland",
                 firstDate: getDateFromString(date: "28.07.23"),
                 lastDate: getDateFromString(date: "30.07.23"),
                 location: .belgium,
                 festivalDescription: "Tomorrowland — фестиваль электронной музыки, который проводится в городе Бом, Бельгия. Tomorrowland был впервые проведён в 2005 году и с тех пор стал одним из крупнейших и наиболее известных музыкальных фестивалей в мире. Длится обычно 3 дня, а билеты распродаются за несколько минут. Tomorrowland также проводился в США (TomorrowWorld) и Бразилии (Tomorrowland Brasil).",
                 festivalIcon: UIImage(named: "iconTomorrow"),
                 photo: UIImage(named: "tom"),
                 genre: [.dance, .electronic, .techno],
                 isFavourite: false),
        Festival(festivalTitle: "Coachella",
                 firstDate: getDateFromString(date: "14.04.23"),
                 lastDate: getDateFromString(date: "23.04.23"),
                 location: .usa,
                 festivalDescription: "Фестиваль музыки и искусств в долине Коачелла  — трёхдневный музыкальный фестиваль, проводимый компанией Goldenvoice в городе Индио, штат Калифорния. Один из крупнейших, самых известных и самых прибыльных музыкальных фестивалей в Соединенных Штатах и во всем мире. Впервые мероприятие состоялось в 1999 году. В число выступающих включены группы различной жанровой направленности — инди-рок, хип-хоп, электронная и поп-музыка; в рамках фестиваля также проходят художественные и скульптурные выставки.",
                 festivalIcon: UIImage(named: "iconCoachella"),
                 photo: UIImage(named: "coachella"),
                 genre: [.pop, .rap, .hiphop, .dance, .reggae, .electronic, .country, .instrumental],
                 isFavourite: false),
        Festival(festivalTitle: "Summerfest",
                 firstDate: getDateFromString(date: "22.06.23"),
                 lastDate: getDateFromString(date: "08.07.23"),
                 location: .usa,
                 festivalDescription: "Summerfest — ежегодный музыкальный фестиваль, который проводится в центре города Милуоки, штат Висконсин. Саммерфест расположен в Фестивальном парке Генри Майера, рядом с озером Мичиган и центральным деловым районом Милуоки. В число исполнителей входят местные и общенациональные музыкальные таланты из различных жанров, выступающие на территории с полудня до полуночи. Summerfest также демонстрирует широкий выбор блюд из многих ресторанов в районе Милуоки. Другие достопримечательности Summerfest включают магазины, фейерверки (в том числе «Большой взрыв» в ночь открытия), семейные мероприятия и многое другое.",
                 festivalIcon: UIImage(named: "iconSummerfest"),
                 photo: UIImage(named: "sumfest"),
                 genre: [.instrumental, .country, .reggae, .rock, .dance, .pop, .blues],
                 isFavourite: false),
        Festival(festivalTitle: "Afro Nation",
                 firstDate: getDateFromString(date: "01.06.23"),
                 lastDate: getDateFromString(date: "31.08.23"),
                 location: .portugal,
                 festivalDescription: "Afro Nation — это ежегодный трехдневный музыкальный фестиваль, организованный Live Nation, Event Horizon, Smade Entertainment и Memories of Tomorrow. Платформа была создана для того, чтобы объединить лучших африканских исполнителей в области афробитов, хип-хопа, RnB, dancehall, amapiano, Afro House и других. ",
                 festivalIcon: UIImage(named: "iconAfronation"),
                 photo: UIImage(named: "afronation"),
                 genre: [.hiphop, .dance, .reggae, .rap, .pop, .latin],
                 isFavourite: false),
        Festival(festivalTitle: "Glastonbury",
                 firstDate: getDateFromString(date: "01.06.23"),
                 lastDate: getDateFromString(date: "31.08.23"),
                 location: .uk,
                 festivalDescription: "Гластонберийский фестиваль современного исполнительского искусства — музыкальный фестиваль, проводящийся с 1970 года неподалёку от города Гластонбери в Великобритании. Мероприятие с первых лет своего существования получило репутацию «британского Вудстока» и традиционно считается одним из главных событий музыкального года в Британии. Фестиваль в Гластонбери славится прежде всего своими рок-концертами, однако в рамках его проходят также многочисленные выступления танцевальных, фольклорных, театральных и цирковых коллективов, устраиваются художественные экспозиции. Основатель фестиваля — фермер Майкл Ивис, на территории его фермы и проходит фестиваль.",
                 festivalIcon: UIImage(named: "iconGlastonbury"),
                 photo: UIImage(named: "glastonbury"),
                 genre: [.instrumental, .folk, .rock, .blues, .country, .metal],
                 isFavourite: false),
        Festival(festivalTitle: "Rolling Loud Portugal",
                 firstDate: getDateFromString(date: "01.06.23"),
                 lastDate: getDateFromString(date: "31.08.23"),
                 location: .portugal,
                 festivalDescription: "Rolling Loud Portugal, «крупнейший в мире фестиваль хип-хопа»,  проводится на роскошном пляже Прайя-да-Роша в прибрежном городе Портимао.",
                 festivalIcon: UIImage(named: "iconRLP"),
                 photo: UIImage(named: "rolloud"),
                 genre: [.pop, .rap, .hiphop, .latin],
                 isFavourite: false),
        Festival(festivalTitle: "Sziget",
                 firstDate: getDateFromString(date: "09.08.23"),
                 lastDate: getDateFromString(date: "14.08.23"),
                 location: .hungary,
                 festivalDescription: "Первый фестиваль Sziget был организован в далеком 1993 году, как небольшое мероприятие, но с тех пор вырос в один из крупнейших фестивалей мира. В течение 6 дней подряд проходит более 1000 шоу на 60 площадках фестиваля. На фестивале Sziget представлены более 100 национальностей, причем гости приезжают не только из ближайших стран, но из удаленных уголков мира, например из Бразилии или Новой Зеландии.  Остров Свободы — это мирный марафон различных культур и национальностей, музыки и искусства! Хотя музыка и является важной частью Sziget, разнообразие искусств всегда было основным элементом фестиваля. Можно посетить цирк, театр, музейный квартал и многое другое. Художники и артисты приезжают на Остров Свободы со всего мира, чтобы показать свои лучшие таланты, а гости фестиваля всегда могут работать с ними, чтобы вместе создавать незабываемые и значимые произведения искусства.",
                 festivalIcon: UIImage(named: "iconSziget"),
                 photo: UIImage(named: "sziget"),
                 genre: [ .latin, .country, .instrumental, .dance, .folk, .reggae, .pop],
                 isFavourite: false),
        
    ]
    
    private init() { }
    
    func getFestivals() -> [Festival] {
        festivals
    }
    
    func getFavouriteFestivals() -> [Festival] {
        let favouriteFestivals = festivals.filter {
            $0.isFavourite
        }
        return favouriteFestivals
    }
    
    private func getDateFromString(date: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter.date(from: date) ?? Date()
    }
}
