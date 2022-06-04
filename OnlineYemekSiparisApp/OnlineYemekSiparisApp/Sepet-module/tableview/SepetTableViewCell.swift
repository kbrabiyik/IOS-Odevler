

import UIKit

class SepetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sepetView: UIView!
    @IBOutlet weak var yemekImageView: UIImageView!
    @IBOutlet weak var yemekAD: UILabel!
    @IBOutlet weak var yemekFIYAT: UILabel!
    @IBOutlet weak var yemekADET: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        yemekADET.text = Int(sender.value).description
    }

}
