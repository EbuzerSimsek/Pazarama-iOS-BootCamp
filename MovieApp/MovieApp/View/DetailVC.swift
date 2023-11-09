//
//  DetailVC.swift
//  MovieApp
//
//  Created by Ebuzer Şimşek on 6.11.2023.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
    
    
    var selectedMovie : Movie?
    var visualEffectView: UIVisualEffectView?
    
    
    
    
    var movieImage : UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: 5, height: 5)
        image.layer.shadowOpacity = 0.8
        image.backgroundColor = .white
        image.layer.shadowRadius = 5
        return image
    }()
    
    
    var imdbImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "imdb")
        image.backgroundColor = .white
        return image
    }()
    
    
    
    var MovieName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.textAlignment = .left
        label.baselineAdjustment = .alignBaselines
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    
    
    var DateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    
    var TypeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.text = "Action"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    
    var DurationLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.text = "1h 26m"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    
    var MovieOrSeriesLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    
    
    var DirectorLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textAlignment = .left
        label.text = "Director:"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    
    var DirectorNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textAlignment = .left
        label.text = "Kubrick"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    
    var ActorsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textAlignment = .left
        label.text = "Actors:"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    
    
    var ActorsNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Robert De Niro, Leonardo Di Caprio, Tom Stark"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    
    
    
    
    var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("←", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(dismissed), for: .touchUpInside)
        return button
    }()
    
    
    var playbutton : CustomButton = {
        let button = CustomButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.setup(image:UIImage(systemName: "play.fill") , text: "Play")
        button.backgroundColor = .systemPink
        return button
    }()
    
    
    
    var AddToListButton : CustomButton2 = {
        let button = CustomButton2()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.textLabel.textColor = .white
        button.iconImageView.tintColor = .white
        button.setup(image: UIImage(systemName: "plus"), text: "Add to List")
        return button
    }()
    
    
    var LikeButton : CustomButton2 = {
        let button = CustomButton2()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.textLabel.textColor = .white
        button.iconImageView.tintColor = .white
        button.setup(image: UIImage(systemName: "hand.thumbsup"), text: "Rate")
        return button
    }()
    
    
    var DownloadButton : CustomButton2 = {
        let button = CustomButton2()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.textLabel.textColor = .white
        button.iconImageView.tintColor = .white
        button.setup(image: UIImage(systemName: "square.and.arrow.down"), text: "Download")
        return button
    }()
    
    
    var ShareButton : CustomButton2 = {
        let button = CustomButton2()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.textLabel.textColor = .white
        button.iconImageView.tintColor = .white
        button.setup(image: UIImage(systemName: "square.and.arrow.up"), text: "Share")
        return button
    }()
    
    
    
    var SummariesLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.text = "Summaries"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    
    var imdbLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.text = "imdb"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    
    var SummaryLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .light)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = view.bounds
        
        
        view.addSubview(DurationLabel)
        view.addSubview(MovieOrSeriesLabel)
        view.addSubview(visualEffectView)
        view.addSubview(backButton)
        view.addSubview(movieImage)
        view.addSubview(MovieName)
        view.addSubview(playbutton)
        view.addSubview(AddToListButton)
        view.addSubview(LikeButton)
        view.addSubview(DownloadButton)
        view.addSubview(ShareButton)
        view.addSubview(SummariesLabel)
        view.addSubview(SummaryLabel)
        view.addSubview(DirectorLabel)
        view.addSubview(DirectorNameLabel)
        view.addSubview(ActorsLabel)
        view.addSubview(ActorsNameLabel)
        view.addSubview(imdbImage)
        view.addSubview(imdbLabel)
        
        
        setupUI()
        downloadImageWithKingfisher(from: selectedMovie?.poster ?? "", imageView: movieImage)
        MovieName.text = selectedMovie?.title
        DateLabel.text = selectedMovie?.year
        let text = selectedMovie?.type ?? ""
        MovieOrSeriesLabel.text = text.capitalized
        SummaryLabel.text = selectedMovie?.plot
        DirectorNameLabel.text = selectedMovie?.director
        ActorsNameLabel.text = selectedMovie?.actors
        DurationLabel.text = selectedMovie?.runtime
        imdbLabel.text = "\(selectedMovie?.imdbRating ?? "imdb")/10"
        TypeLabel.text = selectedMovie?.genre.capitalized
        
    }
    
    
    
    @objc func dismissed() {
        self.dismiss(animated:true)
        
    }
    
    
    
    
    private func setupUI(){
        
        
        
        
        let dateAndTypeStack = UIStackView(arrangedSubviews: [ DateLabel,TypeLabel])
        dateAndTypeStack.translatesAutoresizingMaskIntoConstraints = false
        dateAndTypeStack.spacing = 6
        dateAndTypeStack.axis = .horizontal
        view.addSubview(dateAndTypeStack)
        
        
        let MoSLabelAndDurationLabel = UIStackView(arrangedSubviews: [ MovieOrSeriesLabel,DurationLabel])
        MoSLabelAndDurationLabel.translatesAutoresizingMaskIntoConstraints = false
        MoSLabelAndDurationLabel.spacing = 20
        MoSLabelAndDurationLabel.axis = .horizontal
        view.addSubview(MoSLabelAndDurationLabel)
        
        
        var seperator = UIView(frame: .zero)
        seperator.translatesAutoresizingMaskIntoConstraints = false
        seperator.backgroundColor = .lightGray
        view.addSubview(seperator)
        
        
        var seperator2 = UIView(frame: .zero)
        seperator2.translatesAutoresizingMaskIntoConstraints = false
        seperator2.backgroundColor = .lightGray
        view.addSubview(seperator2)
        
        
        
        
        NSLayoutConstraint.activate([
            
            movieImage.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.40),
            movieImage.leadingAnchor.constraint(equalTo: playbutton.leadingAnchor),
            movieImage.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            movieImage.heightAnchor.constraint(equalToConstant: 220),
            
            imdbImage.topAnchor.constraint(equalTo: MoSLabelAndDurationLabel.bottomAnchor,constant: 15),
            imdbImage.leadingAnchor.constraint(equalTo: MovieName.leadingAnchor),
            imdbImage.heightAnchor.constraint(equalToConstant: 20),
            imdbImage.widthAnchor.constraint(equalToConstant: 40),
            
            imdbLabel.topAnchor.constraint(equalTo: MoSLabelAndDurationLabel.bottomAnchor,constant: 15),
            imdbLabel.leadingAnchor.constraint(equalTo: imdbImage.trailingAnchor,constant: 8),
            
            
            
            MovieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor,constant: 15),
            MovieName.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 15),
            MovieName.trailingAnchor.constraint(equalTo: playbutton.trailingAnchor),
            
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            
            
            
            dateAndTypeStack.topAnchor.constraint(equalTo: MovieName.bottomAnchor,constant: 10),
            dateAndTypeStack.leadingAnchor.constraint(equalTo: MovieName.leadingAnchor),
            dateAndTypeStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            
            
            
            MoSLabelAndDurationLabel.topAnchor.constraint(equalTo: dateAndTypeStack.bottomAnchor, constant: 5),
            MoSLabelAndDurationLabel.leadingAnchor.constraint(equalTo: MovieName.leadingAnchor),
            
            
            
            playbutton.topAnchor.constraint(equalTo: movieImage.bottomAnchor,constant: 25),
            playbutton.heightAnchor.constraint(equalToConstant: 50),
            playbutton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.90),
            playbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            seperator.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            seperator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            seperator.topAnchor.constraint(equalTo: playbutton.bottomAnchor, constant: 30),
            seperator.heightAnchor.constraint(equalToConstant: 0.5),
            
            
            seperator2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
            seperator2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            seperator2.topAnchor.constraint(equalTo: AddToListButton.bottomAnchor, constant: 20),
            seperator2.heightAnchor.constraint(equalToConstant: 0.5),
            
            
            
            
            
            AddToListButton.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 20),
            AddToListButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            AddToListButton.heightAnchor.constraint(equalToConstant: 50),
            AddToListButton.widthAnchor.constraint(equalToConstant: 50),
            
            
            LikeButton.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 20),
            LikeButton.leadingAnchor.constraint(equalTo: AddToListButton.trailingAnchor,constant: 30),
            LikeButton.heightAnchor.constraint(equalToConstant: 50),
            LikeButton.widthAnchor.constraint(equalToConstant: 50),
            
            
            DownloadButton.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 20),
            DownloadButton.leadingAnchor.constraint(equalTo: LikeButton.trailingAnchor,constant: 30),
            DownloadButton.heightAnchor.constraint(equalToConstant: 50),
            DownloadButton.widthAnchor.constraint(equalToConstant: 50),
            
            
            ShareButton.topAnchor.constraint(equalTo: seperator.bottomAnchor, constant: 20),
            ShareButton.leadingAnchor.constraint(equalTo: DownloadButton.trailingAnchor,constant: 30),
            ShareButton.heightAnchor.constraint(equalToConstant: 50),
            ShareButton.widthAnchor.constraint(equalToConstant: 50),
            
            
            SummariesLabel.topAnchor.constraint(equalTo: seperator2.bottomAnchor, constant: 15),
            SummariesLabel.leadingAnchor.constraint(equalTo: playbutton.leadingAnchor),
            
            
            SummaryLabel.topAnchor.constraint(equalTo: SummariesLabel.bottomAnchor, constant: 15),
            SummaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SummaryLabel.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.90),
            
            
            DirectorLabel.topAnchor.constraint(equalTo: SummaryLabel.bottomAnchor, constant: 15),
            DirectorLabel.leadingAnchor.constraint(equalTo: playbutton.leadingAnchor),
            DirectorLabel.widthAnchor.constraint(equalToConstant: 70),
            
            
            DirectorNameLabel.topAnchor.constraint(equalTo: SummaryLabel.bottomAnchor, constant: 15),
            DirectorNameLabel.leadingAnchor.constraint(equalTo: DirectorLabel.trailingAnchor,constant: 3),
            
            
            
            ActorsLabel.topAnchor.constraint(equalTo: DirectorLabel.bottomAnchor, constant: 15),
            ActorsLabel.leadingAnchor.constraint(equalTo: playbutton.leadingAnchor),
            ActorsLabel.widthAnchor.constraint(equalToConstant: 70),
            
            
            ActorsNameLabel.topAnchor.constraint(equalTo: DirectorNameLabel.bottomAnchor, constant: 15),
            ActorsNameLabel.leadingAnchor.constraint(equalTo: ActorsLabel.trailingAnchor),
            ActorsNameLabel.trailingAnchor.constraint(equalTo: playbutton.trailingAnchor),
            
            
            
            
            
            
            
        ])
        
    }
    
    
    
    
    func downloadImageWithKingfisher(from urlString: String, imageView: UIImageView) {
        DispatchQueue.main.async {
            if let url = URL(string: urlString) {
                imageView.kf.setImage(with: url)
            }
        }
        
    }
    
    
    
}
