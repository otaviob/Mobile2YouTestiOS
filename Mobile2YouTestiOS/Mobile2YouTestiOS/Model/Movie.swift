import Foundation

import Foundation

class Movie: Codable {
    
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: String?
    var budget: Double?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [ProductionCompanie]?
    var production_countries: [ProductionCountrie]?
    var release_date: String?
    var revenue: Int?
    var runtime: Int?
    var spoken_languages: [SpokenLanguage]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    
    private enum CodingKeys: String, CodingKey {
        case adult
        case backdrop_path
        case belongs_to_collection
        case budget
        case genres
        case homepage
        case id
        case imdb_id
        case original_language
        case original_title
        case overview
        case popularity
        case poster_path
        case production_companies
        case production_countries
        case release_date
        case revenue
        case runtime
        case spoken_languages
        case status
        case tagline
        case title
        case video
        case vote_average
        case vote_count
    }
    
    init(
        adult:Bool,
        backdrop_path:String,
        belongs_to_collection:String,
        budget: Double,
        genres: [Genre],
        homepage: String,
        id: Int,
        imdb_id: String,
        original_language: String,
        original_title: String,
        overview: String,
        popularity: Double,
        poster_path: String,
        production_companies: [ProductionCompanie],
        production_countries: [ProductionCountrie],
        release_date: String,
        revenue: Int,
        runtime: Int,
        spoken_languages: [SpokenLanguage],
        status: String,
        tagline: String,
        title: String,
        video: Bool,
        vote_average:Double,
        vote_count:Int
    )
    {
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.belongs_to_collection = belongs_to_collection
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdb_id = imdb_id
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.production_companies = production_companies
        self.production_countries = production_countries
        self.release_date = release_date
        self.revenue = revenue
        self.runtime = runtime
        self.spoken_languages = spoken_languages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
        self.belongs_to_collection = try container.decodeIfPresent(String.self, forKey: .belongs_to_collection)
        self.budget = try container.decodeIfPresent(Double.self, forKey: .budget)
        self.genres =  try container.decodeIfPresent([Genre].self, forKey: .genres)
        self.homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
        self.id = try container.decode(Int.self, forKey: .id)
        self.imdb_id = try container.decodeIfPresent(String.self, forKey: .imdb_id)
        self.original_language = try container.decodeIfPresent(String.self, forKey: .original_language)
        self.original_title = try container.decodeIfPresent(String.self, forKey: .original_title)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
        self.production_companies = try container.decodeIfPresent([ProductionCompanie].self, forKey: .production_companies)
        self.production_countries = try container.decodeIfPresent([ProductionCountrie].self, forKey: .production_countries)
        self.release_date = try container.decodeIfPresent(String.self, forKey: .release_date)
        self.revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
        self.runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
        self.spoken_languages = try container.decodeIfPresent([SpokenLanguage].self, forKey: .spoken_languages)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.vote_average = try container.decodeIfPresent(Double.self, forKey: .vote_average)
        self.vote_count = try container.decodeIfPresent(Int.self, forKey: .id)
        
    }
}

class SpokenLanguage: Codable {
    
    var iso_639_1: String?
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case iso_639_1
        case name
    }
    
    init(iso_639_1:String, name:String) {
        self.iso_639_1 = iso_639_1
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.iso_639_1 = try container.decodeIfPresent(String.self, forKey: .iso_639_1)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        
    }
}

class ProductionCompanie: Codable {
    var id: Int?
    var logo_path: String?
    var name: String?
    var origin_country: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case logo_path
        case name
        case origin_country
    }
    
    init(id:Int, logo_path:String, name:String, origin_country:String) {
        self.id = id
        self.logo_path = logo_path
        self.name = name
        self.origin_country = origin_country
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.logo_path = try container.decodeIfPresent(String.self, forKey: .logo_path)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.origin_country = try container.decodeIfPresent(String.self, forKey: .origin_country)
        
    }
    
}

class ProductionCountrie: Codable {
    var iso_3166_1: String?
    var name:String?
    
    private enum CodingKeys: String, CodingKey {
        case iso_3166_1
        case name
    }
    
    init(iso_3166_1: String, name:String) {
        self.iso_3166_1 = iso_3166_1
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.iso_3166_1 = try container.decodeIfPresent(String.self, forKey: .iso_3166_1)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}

class Genre: Codable {
    var id:Int?
    var name:String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    init(id: Int, name:String) {
        self.id = id
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
