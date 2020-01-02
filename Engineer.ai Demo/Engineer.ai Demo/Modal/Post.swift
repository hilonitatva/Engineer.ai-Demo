//
//  Post.swift
//  Engineer.ai Demo
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation
struct HighlightResult : Codable {
    let title : Title?
    let author : Author?
    let story_text : StoryText?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case author = "author"
        case story_text = "story_text"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(Title.self, forKey: .title)
        author = try values.decodeIfPresent(Author.self, forKey: .author)
        story_text = try values.decodeIfPresent(StoryText.self, forKey: .story_text)
    }
    
}

struct Author : Codable {
    let value : String?
    let matchLevel : String?
    let matchedWords : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case matchLevel = "matchLevel"
        case matchedWords = "matchedWords"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        matchLevel = try values.decodeIfPresent(String.self, forKey: .matchLevel)
        matchedWords = try values.decodeIfPresent([String].self, forKey: .matchedWords)
    }
    
}

struct Hits : Codable {
    let created_at : String?
    let title : String?
    let url : String?
    let author : String?
    let points : Int?
    let story_text : String?
    let comment_text : String?
    let num_comments : Int?
    let story_id : String?
    let story_title : String?
    let story_url : String?
    let parent_id : String?
    let created_at_i : Int?
    let _tags : [String]?
    let objectID : String?
    let _highlightResult : HighlightResult?
    var isActive : Bool = false
    
    enum CodingKeys: String, CodingKey {
        
        case created_at = "created_at"
        case title = "title"
        case url = "url"
        case author = "author"
        case points = "points"
        case story_text = "story_text"
        case comment_text = "comment_text"
        case num_comments = "num_comments"
        case story_id = "story_id"
        case story_title = "story_title"
        case story_url = "story_url"
        case parent_id = "parent_id"
        case created_at_i = "created_at_i"
        case _tags = "_tags"
        case objectID = "objectID"
        case _highlightResult = "_highlightResult"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        points = try values.decodeIfPresent(Int.self, forKey: .points)
        story_text = try values.decodeIfPresent(String.self, forKey: .story_text)
        comment_text = try values.decodeIfPresent(String.self, forKey: .comment_text)
        num_comments = try values.decodeIfPresent(Int.self, forKey: .num_comments)
        story_id = try values.decodeIfPresent(String.self, forKey: .story_id)
        story_title = try values.decodeIfPresent(String.self, forKey: .story_title)
        story_url = try values.decodeIfPresent(String.self, forKey: .story_url)
        parent_id = try values.decodeIfPresent(String.self, forKey: .parent_id)
        created_at_i = try values.decodeIfPresent(Int.self, forKey: .created_at_i)
        _tags = try values.decodeIfPresent([String].self, forKey: ._tags)
        objectID = try values.decodeIfPresent(String.self, forKey: .objectID)
        _highlightResult = try values.decodeIfPresent(HighlightResult.self, forKey: ._highlightResult)
    }
    
}

struct Post : Codable {
    let hits : [Hits]?
    let nbHits : Int?
    let page : Int?
    let nbPages : Int?
    let hitsPerPage : Int?
    let exhaustiveNbHits : Bool?
    let query : String?
    let params : String?
    let processingTimeMS : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case hits = "hits"
        case nbHits = "nbHits"
        case page = "page"
        case nbPages = "nbPages"
        case hitsPerPage = "hitsPerPage"
        case exhaustiveNbHits = "exhaustiveNbHits"
        case query = "query"
        case params = "params"
        case processingTimeMS = "processingTimeMS"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hits = try values.decodeIfPresent([Hits].self, forKey: .hits)
        nbHits = try values.decodeIfPresent(Int.self, forKey: .nbHits)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        nbPages = try values.decodeIfPresent(Int.self, forKey: .nbPages)
        hitsPerPage = try values.decodeIfPresent(Int.self, forKey: .hitsPerPage)
        exhaustiveNbHits = try values.decodeIfPresent(Bool.self, forKey: .exhaustiveNbHits)
        query = try values.decodeIfPresent(String.self, forKey: .query)
        params = try values.decodeIfPresent(String.self, forKey: .params)
        processingTimeMS = try values.decodeIfPresent(Int.self, forKey: .processingTimeMS)
    }
    
}

struct StoryText : Codable {
    let value : String?
    let matchLevel : String?
    let matchedWords : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case matchLevel = "matchLevel"
        case matchedWords = "matchedWords"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        matchLevel = try values.decodeIfPresent(String.self, forKey: .matchLevel)
        matchedWords = try values.decodeIfPresent([String].self, forKey: .matchedWords)
    }
    
}

struct Title : Codable {
    let value : String?
    let matchLevel : String?
    let matchedWords : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case value = "value"
        case matchLevel = "matchLevel"
        case matchedWords = "matchedWords"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(String.self, forKey: .value)
        matchLevel = try values.decodeIfPresent(String.self, forKey: .matchLevel)
        matchedWords = try values.decodeIfPresent([String].self, forKey: .matchedWords)
    }
    
}
