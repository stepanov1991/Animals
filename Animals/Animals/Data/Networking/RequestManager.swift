//
//  RequestManager.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation

class RequestManager {
    
        static func request<T: Codable>(_ endpoint: Endpoint, resultType type: T.Type) async throws -> T? {
            guard let url = endpoint.url else {
                throw AppError.invalidRequestData
            }
            
            logger.debug("Request URL: \(url.absoluteString)")
            
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw AppError.somethingWentWrong
                }
                guard (200...299).contains(httpResponse.statusCode) else {
                    logger.error("Server returned status code: \(httpResponse.statusCode)")
                    throw AppError.somethingWentWrong
                }
                
                guard !data.isEmpty else {
                    logger.error("Data is empty")
                    throw AppError.emptyData
                }
                return try JSONDecoder.default.decode(type, from: data)
            } catch let error as DecodingError {
                logger.error("Parsing error: \(error.localizedDescription)")
                throw AppError.parsingError(error)
            } catch let error as URLError {
                logger.error("Network error: \(error.localizedDescription)")
                throw AppError.networkError(error)
            } catch {
                logger.error("Unexpected error: \(error.localizedDescription)")
                throw AppError.somethingWentWrong
            }
        }
    
}

extension JSONDecoder {
    static let `default`: JSONDecoder  = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

