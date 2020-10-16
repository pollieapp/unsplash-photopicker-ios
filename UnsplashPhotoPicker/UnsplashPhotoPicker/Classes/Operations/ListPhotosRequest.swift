//
//  ListPhotosRequest.swift
//  Unsplash
//
//  Created by Olivier Collet on 2017-09-27.
//  Copyright © 2017 Unsplash. All rights reserved.
//

import Foundation

class ListPhotosRequest: UnsplashPagedRequest {

    static func cursor(page: Int = 1, perPage: Int = 10) -> UnsplashPagedRequest.Cursor {
        return Cursor(page: page, perPage: perPage, parameters: nil)
    }

    convenience init(page: Int = 1, perPage: Int = 10) {
        let cursor = ListPhotosRequest.cursor(page: page, perPage: perPage)
        self.init(with: cursor)
    }

    // MARK: - Prepare the request

    override var endpoint: String { return "/photos" }

    // MARK: - Process the response

    override func processJSONResponse() {
        if let photos = photosFromJSONResponse() {
            self.items = photos
        }
        super.processJSONResponse()
    }

    func photosFromJSONResponse() -> [UnsplashPhoto]? {
        guard let results = jsonResponse as? [Any] else {
            return nil
        }
//        guard let jsonResponse = jsonResponse as? [String: Any],
//            let results = jsonResponse["results"] as? [Any] else {
//            return nil
//        }

        do {
            let data = try JSONSerialization.data(withJSONObject: results, options: [])
            return try JSONDecoder().decode([UnsplashPhoto].self, from: data)
        } catch {
            self.error = error
        }
        return nil
    }

}
