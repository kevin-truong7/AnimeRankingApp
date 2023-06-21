// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AnimeRankingSchema.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AnimeRankingSchema.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AnimeRankingSchema.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AnimeRankingSchema.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return AnimeRankingSchema.Objects.Query
    case "Page": return AnimeRankingSchema.Objects.Page
    case "Media": return AnimeRankingSchema.Objects.Media
    case "MediaTitle": return AnimeRankingSchema.Objects.MediaTitle
    case "MediaCoverImage": return AnimeRankingSchema.Objects.MediaCoverImage
    case "CharacterConnection": return AnimeRankingSchema.Objects.CharacterConnection
    case "Character": return AnimeRankingSchema.Objects.Character
    case "CharacterName": return AnimeRankingSchema.Objects.CharacterName
    case "PageInfo": return AnimeRankingSchema.Objects.PageInfo
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
