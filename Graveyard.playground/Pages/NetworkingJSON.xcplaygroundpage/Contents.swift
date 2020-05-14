import Foundation


struct SearchResult: Codable {
    var title: String?
    var creator: String?

    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
    }
}
//this allows us to dig deeper into the JSON.
struct SearchResults: Codable {
       let results: [SearchResult]
   }


enum ResultType: String {
    case software
    case musicTrack
    case movie
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class SearchResultController{

    //MARK: Properties
    //data source for the table view
    var searchResults: [SearchResult] = []

    //MARK: Networking

    let baseURL = URL(string: "https://itunes.apple.com/search")!

    //MARK: Neworking Method Call

    func performSearch(searchTerm: String, resultType: ResultType, completion: @escaping () -> Void) {

        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)

      let parameters: [String : String] = ["term": searchTerm, "entity": resultType.rawValue]

      let queryItems = parameters.compactMap({ URLQueryItem(name: $0.key, value: $0.value) })
      urlComponents?.queryItems = queryItems

      guard let requestURL = urlComponents?.url else { return }

        var request = URLRequest(url: requestURL)

               request.httpMethod = HTTPMethod.get.rawValue

               URLSession.shared.dataTask(with: request) { data, _, error in
                   if let error = error {
                       print("Error fetching data: \(error)")
                       return
                   }

                   guard let data = data else {
                       print("No data returned from data Task")
                       return
                   }

                   let jsonDecoder = JSONDecoder()

                   jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                   do{
                    let iTunesSearch = try jsonDecoder.decode(SearchResults.self, from: data)
                    self.searchResults = iTunesSearch.results
                   } catch {
                       print("Unable to decode data into object of type [SearchResults]: \(error)")
                   }

                   completion()
               }.resume()
           }
    }

searchResultsController.performSearch(searchTerm: searchTerm, resultType: resultType) {
    DispatchQueue.main.async {
        self.tableView.reloadData()
    }
}
