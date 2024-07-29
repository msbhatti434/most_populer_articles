import Foundation

class APIService: APIServiceProtocol {
    private let baseURL: URL
    private let session: URLSession
    private let configurationManager: ConfigurationManagerProtocol
    
    init(baseURL: URL, session: URLSession = .shared, configurationManager: ConfigurationManagerProtocol) {
        self.baseURL = baseURL
        self.session = session
        self.configurationManager = configurationManager
    }
    
    func request<T: Decodable>(_ endpoint: RequestBuilder) async throws -> T {
        guard var urlComponents = URLComponents(url: baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: false) else {
            throw APIError.invalidURL
        }
        
        if let queryParameters = endpoint.queryParameters {
            urlComponents.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        if let headers = endpoint.headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        request.httpBody = endpoint.body
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.invalidResponse
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                return decodedResponse
            } catch let decodingError {
                throw APIError.decodingFailed(decodingError)
            }
        } catch let error {
            throw APIError.requestFailed(error)
        }
    }
}
