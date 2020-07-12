
import XCTest
@testable import app

class appTests: XCTestCase {

    func testInvalidApiResponse(){
        do{
            let testJsonMissingTitle = try JSONDecoder().decode(Rows.self, from: jsonMissingTitle)
            XCTAssertNil(testJsonMissingTitle.title)
            let testJsonMissingDescription = try JSONDecoder().decode(Rows.self, from: jsonMissingDescription)
            XCTAssertNil(testJsonMissingDescription.description)
            let testJsonMissingImageUrl = try JSONDecoder().decode(Rows.self, from: jsonMissingImageUrl)
            XCTAssertNil(testJsonMissingImageUrl.imageHref)
        }catch{
            
        }
    }
    func testvalidApiResponse(){
        do{
            let testJsonValidData = try JSONDecoder().decode(Rows.self, from: validJson)
            XCTAssertNotNil(testJsonValidData.title)
            XCTAssertNotNil(testJsonValidData.description)
            XCTAssertNotNil(testJsonValidData.title)
        }catch{
            
        }
    }
    private let jsonMissingTitle = Data("{  \"description\":\"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony\",    \"imageHref\":\"http:\\/\\/upload.wikimedia.org\\/wikipedia\\/commons\\/thumb\\/6\\/6b\\/American_Beaver.jpg\\/220px-American_Beaver.jpg\"    }".utf8)

    private let jsonMissingDescription = Data("{    \"title\":\"Beavers\", \"imageHref\":\"http:\\/\\/upload.wikimedia.org\\/wikipedia\\/commons\\/thumb\\/6\\/6b\\/American_Beaver.jpg\\/220px-American_Beaver.jpg\"    }".utf8)
    private let jsonMissingImageUrl = Data("{    \"title\":\"Beavers\",    \"description\":\"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony\"}".utf8)
    private let validJson = Data("{    \"title\":\"Beavers\",    \"description\":\"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony\",    \"imageHref\":\"http:\\/\\/upload.wikimedia.org\\/wikipedia\\/commons\\/thumb\\/6\\/6b\\/American_Beaver.jpg\\/220px-American_Beaver.jpg\"    }".utf8)
}
