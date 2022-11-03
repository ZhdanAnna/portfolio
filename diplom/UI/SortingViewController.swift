import UIKit

class SortingViewController: UIViewController,
                             UIPickerViewDelegate,
                             UIPickerViewDataSource {
    
    @IBOutlet weak var generPicker: UIPickerView!
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    private let allGeners: [Genre] = Genre.allCases
    private let allCountries: [Country] = Country.allCases
    
    var sortModel: SortModel = SortModel()
    var applyHeandler: ((SortModel) -> Void)?
    
    @IBAction func applyButtonDidPress(_ sender: Any) {
        applyHeandler?(sortModel)
    }
    
    @IBAction func clearButtonDidPress(_ sender: Any) {
        generPicker.selectRow(0, inComponent: 0, animated: true)
        self.pickerView(generPicker, didSelectRow: 0, inComponent: 0)
        countryPicker.selectRow(0, inComponent: 0, animated: true)
        self.pickerView(countryPicker, didSelectRow: 0, inComponent: 0)
        clearButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generPicker.tag = 1
        countryPicker.tag = 2
        generPicker.delegate = self
        generPicker.dataSource = self
        countryPicker.delegate = self
        countryPicker.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let generIndex = allGeners.firstIndex(where: { $0 == sortModel.gener }) {
            generPicker.selectRow(generIndex, inComponent: 0, animated: true)
            clearButton.isHidden = false
        }
        if let countryIndex = allCountries.firstIndex(where: { $0 == sortModel.country }) {
            countryPicker.selectRow(countryIndex, inComponent: 0, animated: true)
        }
        
        if sortModel.gener == nil && sortModel.country == nil {
            clearButton.isHidden = true
        }
        else {
            clearButton.isHidden = false
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return allGeners.count
        } else {
            return allCountries.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return allGeners[row].rawValue
        } else {
            return allCountries[row].rawValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        clearButton.isHidden = false
        if pickerView.tag == 1 {
            if row == 0 {
                sortModel.gener = nil
            }
            else {
                sortModel.gener = allGeners[row]
            }
        } else {
            if row == 0 {
                sortModel.country = nil
            }
            else {
                sortModel.country = allCountries[row]
            }
        }
    }
}
