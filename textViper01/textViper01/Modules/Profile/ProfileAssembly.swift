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
import UIKit

// MARK: - dto
struct ProfileAssemblyDTO {
}
// MARK: - module builder
final class ProfileAssembly: BaseAssembly {

    static func navigationController(dto: ProfileAssemblyDTO? = nil) -> UINavigationController {
         UINavigationController(rootViewController: view(dto: dto))
    }

    
    static func view(dto: ProfileAssemblyDTO? = nil) -> ProfileViewController {
        let view = ProfileViewController(nibName:"ProfileViewController", bundle: nil)
        let viper = BaseAssembly.assembly(baseView: view,
                                          presenter: ProfilePresenter.self,
                                          router: ProfileRouter.self,
                                          interactor: ProfileInteractor.self)
        viper.interactor.assemblyDTO = dto
        viper.interactor.provider = DataAssembly.provider(providerType: ProfileProvider.self,
                                                          protocolType: ProfileProviderProtocol.self,
                                                          interactor: viper.interactor)
        return view
    }
}
