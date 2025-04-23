import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var sayHelloButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - メモリリークするパターン
        
        // クロージャ内で self（SecondViewController）を強参照しているため、SecondViewController が解放されない
        // 強参照の循環参照が発生:
        //     クロージャ -> self（SecondViewController）-> UIView（背景）-> UIButton -> UIAction -> クロージャ
        sayHelloButton.addAction(.init(handler: { _ in
            self.showAlert()
        }), for: .touchUpInside)

        closeButton.addAction(.init(handler: { _ in
            self.dismiss(animated: true)
        }), for: .touchUpInside)

        
        // MARK: - メモリリークしないパターン

        /*
        // クロージャから self（SecondViewController）への参照が弱参照のため、画面を閉じれば SecondViewController は解放される
        sayHelloButton.addAction(.init(handler: { [weak self] _ in
            self?.showAlert()
        }), for: .touchUpInside)

        closeButton.addAction(.init(handler: { [weak self] _ in
            self?.dismiss(animated: true)
        }), for: .touchUpInside)
         */
    }
    
    /// アラートダイアログを表示
    private func showAlert() {
        let alert = UIAlertController(title: "Hello!",
                                      message: "Hello from SecondViewController",
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    // 循環参照によるメモリリークがなければ、画面を閉じた際にこのメッセージがコンソールに表示されるはず
    deinit {
        print("==== SecondViewController deinit ====")
    }
}
