import UIKit

class DetailsViewController: UIViewController {
    // Create an image view that holds the weather icons
    private let weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.fill")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Create a label for weather description
    private let weatherDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Today is rainy"
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // Create a label for value of the temprature
    private let tempratureValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "21 ℃"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private func setUpCollectionView()  {
        // Create a collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        layout.itemSize = CGSize(width: view.bounds.width/3.5, height: view.bounds.width/4)
        
        // Create a collection view
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        addCollectionViewConstraints(collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(weatherIcon)
        addWeatherIconConstraitns()
        
        view.addSubview(weatherDescription)
        addWeatherDescriptionConstraints()
        
        view.addSubview(tempratureValue)
        addTempratureValueConstraints()
        
        setUpCollectionView()
    }
    
}

extension DetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
}
//This extension only holds functions that add constraints for views.
extension DetailsViewController {
    
    // Add constraints to the weatherIcon imageView
   private func addWeatherIconConstraitns() {
        NSLayoutConstraint.activate([
            weatherIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherIcon.topAnchor.constraint(equalTo: view.topAnchor),
            weatherIcon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            weatherIcon.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    // Add constraints to weatherDescription label
    private func addWeatherDescriptionConstraints() {
        NSLayoutConstraint.activate([
            weatherDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherDescription.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 10)
        ])
    }
    
    // Add constraints to tempratureLabel
    private func addTempratureValueConstraints() {
        NSLayoutConstraint.activate([
            tempratureValue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tempratureValue.topAnchor.constraint(equalTo: weatherDescription.bottomAnchor, constant: 15)
        ])
    }
    
    private func addCollectionViewConstraints(_ collectionView: UICollectionView) {
        // Add constraints to the collection view
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: tempratureValue.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: view.bounds.width/4 + 10)
        ])
    }
    
}
