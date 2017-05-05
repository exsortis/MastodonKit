import Foundation

public final class Client {
    let baseURL: String
    public var accessToken: String?
    lazy var session = URLSession.shared

    public init(baseURL: String, accessToken: String? = nil) {
        self.baseURL = baseURL
        self.accessToken = accessToken
    }

    public func run<Model>(_ resource: Resource<Model>, completion: @escaping (Model?, Error?) -> Void) {
        guard
            let components = URLComponents(baseURL: baseURL, resource: resource),
            let requestURL = components.url
            else {
                completion(nil, ClientError.malformedURL)
                return
        }

        let request = URLRequest(url: requestURL, resource: resource, accessToken: accessToken)

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard
                let httpResponse = response as? HTTPURLResponse
                else {
                    completion(nil, ClientError.unexpectedResponse)
                    return
            }
            guard
                httpResponse.statusCode == 200
                else {
                    //                    let mastodonError = MastodonError(json: jsonObject)
                    completion(nil, ClientError.unsuccessfulResponse(httpResponse.statusCode))
                    return
            }

            guard
                let data = data
                else {
                    completion(nil, ClientError.noData)
                    return
            }
            let json : Any?
            do {
                json = try JSONSerialization.jsonObject(with: data, options: [])
            }
            catch {
                completion(nil, ClientError.dataSerializationError(error))
                return
            }
            guard
                let jsonObject = json
                else {
                    completion(nil, ClientError.noData)
                    return
            }

            completion(resource.parse(jsonObject), nil)
        }
        
        task.resume()
    }
}
