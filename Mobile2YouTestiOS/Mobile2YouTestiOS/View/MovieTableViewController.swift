import UIKit
import SDWebImage

class MovieTableViewController: UITableViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var numberLike: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var like: UIButton!
    
    private var viewModel = MovieViewModel()
    private var service = ServiceConnection()
    
    private let likeOn = UIImage(systemName: "heart.fill")
    private let likeOff = UIImage(systemName: "heart")
    private var auxLike = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovieSimilarDetails()
        getMovieDetails()
        
        image.alpha = 0.0
        
        UIView.animate(withDuration: 3.5) {
            self.image.alpha = 1.0
        }
    }
   
    @IBAction func actionLike(_ sender: Any) {
        if auxLike == false {
            auxLike = true
            like.setImage(likeOn , for: .normal)
        }else{
            auxLike = false
            like.setImage(likeOff , for: .normal)
        }
    }
    
    // MARK: - obtendo Filmes similares
    func getMovieSimilarDetails() {
        viewModel.fetchPopularSimilarMoviesData { [weak self] in
            self?.tableView.reloadData()
        }
    }
    // MARK: - obtendo Filme
    func getMovieDetails() {
        viewModel.fetchPopularMoviesData { [weak self] in
            
            if let vote_count = self?.viewModel.movie?.vote_count{
                self?.numberLike.text = String(vote_count) + " Likes"
            }
            if let popu = self?.viewModel.movie?.popularity{
                self?.popularity.text = String(popu)
            }
            
            if let name = self?.viewModel.movie?.original_title{
                self?.nameMovie.text = name
            }
            
            if let poster_path = self?.viewModel.movie?.poster_path{
                 let url = URL.init(string: TheMovieDBAPI.urlImages + ImageSize.poster_big.rawValue + poster_path)
                 self?.image.sd_setImage(with: url, completed: nil)
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        return cell
    }
}
