import Foundation
public enum HTTMethods : String {
    case get = "GET"
    case post = "POST"
}
enum ErrorHandling : Error {
    case ServerException
    case NoConnection
    case NotAuthorized
    case Result
}

class ServerConnectionClass: NSObject {
    
    var urlString : String = ""
    var url:URL?
    func createRequest() -> URLRequest {
        let finalUrlString = "http://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let requestUrl = URL.init(string: finalUrlString)!
        var requestToReturn = URLRequest.init(url: requestUrl)
        requestToReturn.httpMethod = "GET"
        return requestToReturn
    }
    func getResponse(_ request:URLRequest,completionHandler:@escaping (Data,Error)->Void) {
            let task = URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
                if error == nil{
                    let httpResponse = response as! HTTPURLResponse
                    print(httpResponse)
                    print("httpResponse",httpResponse.statusCode)
                    do{
                        print("data",data!)
                        var dictString = String(decoding: data!, as: UTF8.self)
                        if let dictData = dictString.replacingOccurrences(of: "\n", with: "").data(using: .utf8){
                            completionHandler(dictData,ErrorHandling.Result)
                        }
                    }catch let err{
                        print(err)
                    }
                }
            })
            task.resume()
    }
}
extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
