import UIKit

class CustomButton2: UIButton {
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    func setup(image: UIImage?, text: String) {
        if let image = image {
            iconImageView.image = image
            addSubview(iconImageView)
        }
        
        textLabel.text = text
        addSubview(textLabel)
        
        let spacing: CGFloat = 8.0
        
        NSLayoutConstraint.activate([
            
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -spacing),
            
            
            
            textLabel.widthAnchor.constraint(equalToConstant: 100),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
