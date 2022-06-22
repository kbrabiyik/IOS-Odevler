
import UIKit

protocol HucreProtocol {
    func check(indexPath:IndexPath)
    
}
class anasayfaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var yapilacakIsListesi: UILabel!
    @IBOutlet weak var durumView: UIView!
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var checkButton: UIButton!
    
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        hucreProtocol?.check(indexPath: indexPath!)
        durumView.layer.borderColor = UIColor(rgb: 0x5DC5C0).cgColor

    }
}
