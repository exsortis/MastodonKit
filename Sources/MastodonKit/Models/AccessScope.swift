import Foundation

public enum AccessScope: String {
    case read
    case write
    case follow
}

extension AccessScope {
    init(string: String) {
        switch string {
        case "read": self = .read
        case "write": self = .write
        case "follow": self = .follow
        default: self = .read
        }
    }
}
