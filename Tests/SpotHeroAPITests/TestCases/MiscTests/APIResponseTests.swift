// Copyright © 2021 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

final class APIResponseTests: XCTestCase {
    private struct SimpleData: Decodable {
        let name: String
        let count: Int
    }
    
    func testDeserializingDefaultResponseSucceeds() throws {
        let decoder = JSONDecoder.spotHeroAPI
        let json = """
        {
          "meta" : { },
          "data" : {
            "name" : "Foo",
            "count" : 42
          }
        }
        """
        
        let jsonData = try XCTUnwrap(json.data(using: .utf8))
        
        let response = try decoder.decode(APIResponse<SimpleData>.self, from: jsonData)
        
        XCTAssertEqual(response.data.name, "Foo")
        XCTAssertEqual(response.data.count, 42)
    }
    
    func testDeserializingWrappedArrayResponseSucceeds() throws {
        let decoder = JSONDecoder.spotHeroAPI
        let json = """
        {
          "meta" : { },
          "data" : {
            "results" : [
              {
                "name" : "Foo",
                "count" : 42
              },
              {
                "name" : "Bar",
                "count" : 66
              }
            ]
          }
        }
        """
        
        let jsonData = try XCTUnwrap(json.data(using: .utf8))
        
        let response = try decoder.decode(APIResponse<[SimpleData]>.self, from: jsonData)
        
        XCTAssertEqual(response.data.count, 2)
        
        XCTAssertEqual(response.data.first?.name, "Foo")
        XCTAssertEqual(response.data.first?.count, 42)
    }
    
    func testDeserializingUnwrappedArrayResponseFails() throws {
        let decoder = JSONDecoder.spotHeroAPI
        let json = """
        {
          "meta" : { },
          "data" : [
            {
              "name" : "Foo",
              "count" : 42
            },
            {
              "name" : "Bar",
              "count" : 66
            }
          ]
        }
        """
        
        let jsonData = try XCTUnwrap(json.data(using: .utf8))
        
        do {
            _ = try decoder.decode(APIResponse<SimpleData>.self, from: jsonData)
            
            XCTFail("Decoding an unwrapped array response should have failed!")
        } catch let DecodingError.typeMismatch(type, context) {
            XCTAssert(type.self == [String: Any].self)
            
            XCTAssertEqual(context.debugDescription, "Expected to decode Dictionary<String, Any> but found an array instead.")
        }
    }
}
