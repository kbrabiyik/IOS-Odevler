
import Foundation

class YemeklerInteractor: PresenterToInteractorYemeklerProtocol {
    
    var yemeklerPresenter: InteractorToPresenterYemeklerProtocol?
    
    func yemekleriSec() {
        
        let url = URL(string: Constants.Urller.tumYemekleriGetirUrl)!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do {
                let response = try JSONDecoder().decode(YemeklerCevap.self, from: data!)
                if let liste = response.yemekler {
                    self.yemeklerPresenter?.PresenteraVeriGonder(yemekListe: liste)}
            }catch{
                print(error.localizedDescription)
                }
            
        }.resume()
        
    }
    
}
