import UIKit

protocol ViewControllerDelegate: AnyObject {
    func tappedButtonEnter()
}

class ViewController: UIViewController {

    private weak var delegate: ViewControllerDelegate?
    
    public func delegate(delegate: ViewControllerDelegate?){
        self.delegate = delegate
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
        setUpBackgroundColor()
        setUpAllElements()
        setUpConstraints()
        
    }
    
    // MARK: - ELEMENTOS
    
    lazy var titleLoginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LOGIN"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuário:"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress // tipo de teclado
        textField.autocorrectionType = .no // O teclado corrige a palavra automaticamente? Sim ou não
        textField.backgroundColor = .white // Cor de fundo do campo de texto
        textField.borderStyle = .roundedRect // Tipo de borda
        textField.layer.cornerRadius = 7 // Cantos redondos
        textField.placeholder = "Digite seu usuário"
        textField.layer.borderWidth = 1.5 // Espessura da borda
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var securityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha:"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var securityTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 7
        textField.placeholder = "Digite a sua senha"
        textField.layer.borderWidth = 1.5
        textField.textColor = .darkGray
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var buttonEnter: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(tappedButtonEnter), for: .touchUpInside)
        
        return button
    }()
    
    @objc func tappedButtonEnter(){
        print(#function)
        delegate?.tappedButtonEnter()
    }
    
    // MARK: - setUpDelegate

    func setUpNavigationController(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // MARK: - SETUP CONSTRAINTS
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
        
            titleLoginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLoginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            userTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 8),
            userTextField.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor),
            userTextField.trailingAnchor.constraint(equalTo: userLabel.trailingAnchor),
            
            securityLabel.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 30),
            securityLabel.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor),
            securityLabel.trailingAnchor.constraint(equalTo: userTextField.trailingAnchor),
            
            securityTextField.topAnchor.constraint(equalTo: securityLabel.bottomAnchor, constant: 8),
            securityTextField.leadingAnchor.constraint(equalTo: userLabel.leadingAnchor),
            securityTextField.trailingAnchor.constraint(equalTo: userLabel.trailingAnchor),
            
            buttonEnter.topAnchor.constraint(equalTo: securityTextField.bottomAnchor, constant: 150),
            buttonEnter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            buttonEnter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            buttonEnter.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    func setUpBackgroundColor(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.white.cgColor]
        view.layer.addSublayer(gradientLayer)
        
    }
    
    // MARK: - SETUP ELEMENTOS
    
    func setUpAllElements(){
        view.addSubview(titleLoginLabel)
        view.addSubview(userLabel)
        view.addSubview(userTextField)
        view.addSubview(securityLabel)
        view.addSubview(securityTextField)
        view.addSubview(buttonEnter)
    }
}

