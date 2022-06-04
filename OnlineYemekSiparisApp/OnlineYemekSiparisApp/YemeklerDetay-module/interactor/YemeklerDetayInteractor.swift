
import Foundation

class YemeklerDetayInteractor: PresenterToInteractorYemeklerDetayProtocol {
    
    func sepeteYemekEkle(yemekAd: String, yemekImageAd: String, yemekFiyat: Int, yemekAdedi: Int, userName: String) {
        
        var request = URLRequest(url: URL(string: Constants.Urller.sepeteYemekEkleUrl)!)
        request.httpMethod = "POST"
                
        let postString = "yemek_adi=\(yemekAd)&yemek_resim_adi=\(yemekImageAd)&yemek_fiyat=\(yemekFiyat)&yemek_siparis_adet=\(yemekAdedi)&kullanici_adi=\(userName)"
                request.httpBody = postString.data(using: .utf8)
                        
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                            
            do{
                let result = try JSONDecoder().decode(SepeteEkleCevap.self, from: data!)
                print(result.message ?? "No message")
            } catch{print(error.localizedDescription)}
        }.resume()
    }
        
    
}
