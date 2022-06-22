
import UIKit

class detayVC: UIViewController {

    @IBOutlet weak var TFyapilacakIs: UITextField!
    
    @IBOutlet weak var MyTask: UILabel!
    var yapilacakIs:Yapilacaklar?
        
    var yapilacakDetayPresenterNesnesi: ViewToPresenterYapilacakDetayProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let y = yapilacakIs {
            TFyapilacakIs.text = y.yapilacak_is
                
        }
            
        yapilacakDetayRouter.createModule(ref: self)
    }
        
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let yi = TFyapilacakIs.text, let y = yapilacakIs {
            yapilacakDetayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: yi)
        }
    }
    
}
