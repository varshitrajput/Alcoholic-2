
import Foundation

class Episode
{
    var name: String?
    var full: String?
    var half: String?
    var quarter: String?
    var category: String?
    
    init(name: String, full: String, half: String, quarter: String, category:  String)
    {
        self.name = name
        self.full = full
        self.half = half
        self.quarter = quarter
        self.category = category
    }
    
    init(epsDictionary: [String : Any]) {
        self.name = epsDictionary["name"] as? String
        full = epsDictionary["full"] as? String
        half = epsDictionary["half"] as? String
        quarter = epsDictionary["quarter"] as? String
        category = epsDictionary["category"] as? String
    }
    
    static func downloadAllEpisodes() -> [Episode]
    {
        var episodes = [Episode]()
        
        let jsonFile = Bundle.main.path(forResource: "Daaru", ofType: "json")
        let jsonFileURL = URL(fileURLWithPath: jsonFile!)
        let jsonData = try? Data(contentsOf: jsonFileURL)
        
        if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
            let epsDictionaries = jsonDictionary["episodes"] as! [[String : Any]]
            for epsDictionary in epsDictionaries {
                let newEpisode = Episode(epsDictionary: epsDictionary)
                episodes.append(newEpisode)
            }
        }
        
        return episodes
    }
}





















