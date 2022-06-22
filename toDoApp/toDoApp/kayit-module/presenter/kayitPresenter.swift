
import Foundation

class yapilacakKayitPresenter : ViewToPresenterYapilacakKayitProtocol {
    var yapilacakKayitInteractor: PresenterToInteractorYapilacakKayitProtocol?
    func ekle(yapilacak_is: String) {
        yapilacakKayitInteractor?.isEkle(yapilacak_is: yapilacak_is)
    }
    
}
