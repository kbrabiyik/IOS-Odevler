
import UIKit

class kayitVC: UIViewController {

    
@IBOutlet weak var yapilacakIsTF: UITextField!
@IBOutlet weak var addTasks: UILabel!
    
    var yapilacakKayitPresenterNesnesi:ViewToPresenterYapilacakKayitProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        yapilacakKayitRouter.createModule(ref: self)
    }
        
    @IBAction func buttonKaydet(_ sender: Any) {
        if let yi = yapilacakIsTF.text {
            yapilacakKayitPresenterNesnesi?.ekle(yapilacak_is: yi)
        }
    }
}
