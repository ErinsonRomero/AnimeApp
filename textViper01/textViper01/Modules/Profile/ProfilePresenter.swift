/*
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import VIPERPLUS

protocol ProfilePresenterProtocol: BasePresenterProtocol {
}

protocol ProfileInteractorOutputProtocol: BaseInteractorOutputProtocol {
}

final class ProfilePresenter: BasePresenter {
    
    // MARK: VIPER Dependencies
    weak var view: ProfileViewProtocol? { super.baseView as? ProfileViewProtocol }
    var router: ProfileRouterProtocol? { super.baseRouter as? ProfileRouterProtocol }
    var interactor: ProfileInteractorInputProtocol? { super.baseInteractor as? ProfileInteractorInputProtocol }
        
    // MARK: Private Functions
    func viewDidLoad() {
    }
    
    func viewWillAppear(isFirstPresentation: Bool) {
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
}
