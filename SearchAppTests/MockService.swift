//
//  MockService.swift
//  SearchAppTests
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import Foundation
import SearchApp

public class MockService {
    public static func readJson() -> Response? {
        let bundle = Bundle(for: MockService.self)
        guard let path = bundle.path(forResource: "sampleData", ofType: "json") else {return nil}
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return nil}
        let decoder = JSONDecoder()
        guard let parsedJson = try? decoder.decode(Response.self, from: data) else {return nil}
        return parsedJson
    }
}
