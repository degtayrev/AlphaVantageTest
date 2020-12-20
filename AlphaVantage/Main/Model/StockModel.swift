//
//  StockModel.swift
//  AlphaVantage
//
//  Created by Muhammad Raihan on 16/12/20.
//

import Foundation
import UIKit

// MARK: - Response
struct Response1: Codable {
    let metaData: MetaData
    let timeSeries1Min: [String: TimeSeries1Min]

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries1Min = "Time Series (1min)"
    }
}

struct Response2: Codable {
    let metaData: MetaData
    let timeSeries5Min: [String: TimeSeries5Min]

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries5Min = "Time Series (5min)"
    }
}

struct Response3: Codable {
    let metaData: MetaData
    let timeSeries15Min: [String: TimeSeries15Min]

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries15Min = "Time Series (15min)"
    }
}

struct Response4: Codable {
    let metaData: MetaData
    let timeSeries30Min: [String: TimeSeries30Min]

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries30Min = "Time Series (30min)"
    }
}

struct Response5: Codable {
    let metaData: MetaData
    let timeSeries60Min: [String: TimeSeries60Min]

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries60Min = "Time Series (60min)"
    }
}

// MARK: - MetaData
struct MetaData: Codable {
    let the1Information, the2Symbol, the3LastRefreshed, the4Interval: String
    let the5OutputSize, the6TimeZone: String

    enum CodingKeys: String, CodingKey {
        case the1Information = "1. Information"
        case the2Symbol = "2. Symbol"
        case the3LastRefreshed = "3. Last Refreshed"
        case the4Interval = "4. Interval"
        case the5OutputSize = "5. Output Size"
        case the6TimeZone = "6. Time Zone"
    }
}



// MARK: - TimeSeries1Min
struct TimeSeries1Min: Codable {
    let the1Open, the2High, the3Low, the4Close: String
    let the5Volume: String

    enum CodingKeys: String, CodingKey {
        case the1Open = "1. open"
        case the2High = "2. high"
        case the3Low = "3. low"
        case the4Close = "4. close"
        case the5Volume = "5. volume"
    }
}

// MARK: - TimeSeries5Min
struct TimeSeries5Min: Codable {
    let the1Open, the2High, the3Low, the4Close: String
    let the5Volume: String

    enum CodingKeys: String, CodingKey {
        case the1Open = "1. open"
        case the2High = "2. high"
        case the3Low = "3. low"
        case the4Close = "4. close"
        case the5Volume = "5. volume"
    }
}

// MARK: - TimeSeries15Min
struct TimeSeries15Min: Codable {
    let the1Open, the2High, the3Low, the4Close: String
    let the5Volume: String

    enum CodingKeys: String, CodingKey {
        case the1Open = "1. open"
        case the2High = "2. high"
        case the3Low = "3. low"
        case the4Close = "4. close"
        case the5Volume = "5. volume"
    }
}

// MARK: - TimeSeries30Min
struct TimeSeries30Min: Codable {
    let the1Open, the2High, the3Low, the4Close: String
    let the5Volume: String

    enum CodingKeys: String, CodingKey {
        case the1Open = "1. open"
        case the2High = "2. high"
        case the3Low = "3. low"
        case the4Close = "4. close"
        case the5Volume = "5. volume"
    }
}

// MARK: - TimeSeries60Min
struct TimeSeries60Min: Codable {
    let the1Open, the2High, the3Low, the4Close: String
    let the5Volume: String

    enum CodingKeys: String, CodingKey {
        case the1Open = "1. open"
        case the2High = "2. high"
        case the3Low = "3. low"
        case the4Close = "4. close"
        case the5Volume = "5. volume"
    }
}
