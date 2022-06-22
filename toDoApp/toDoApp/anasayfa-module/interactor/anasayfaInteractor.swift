
import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true).first!
        
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ToDo.db")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumIsleriAl() {
        var liste = [Yapilacaklar]()
       
        db?.open()
        
        do {
            let satirlar = try db!.executeQuery("SELECT * FROM todo", values: nil)
            
            while satirlar.next() {
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(satirlar.string(forColumn: "yapilacak_id"))!, yapilacak_is:satirlar.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacakIs)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func isAra(aramaKelimesi: String) {
        var liste = [Yapilacaklar]()
       
        db?.open()
        
        do {
            let satirlar = try db!.executeQuery("SELECT * FROM todo WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
            
            while satirlar.next() {
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(satirlar.string(forColumn: "yapilacak_id"))!, yapilacak_is: satirlar.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacakIs)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func isSil(yapilacak_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM todo WHERE yapilacak_id=?", values: [yapilacak_id])
            tumIsleriAl()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
