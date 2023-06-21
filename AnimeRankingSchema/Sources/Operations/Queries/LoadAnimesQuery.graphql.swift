// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LoadAnimesQuery: GraphQLQuery {
  public static let operationName: String = "LoadAnimesQuery"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query LoadAnimesQuery($mediaId: Int) {
        Media(id: $mediaId) {
          __typename
          title {
            __typename
            english
          }
          averageScore
          popularity
        }
      }
      """#
    ))

  public var mediaId: GraphQLNullable<Int>

  public init(mediaId: GraphQLNullable<Int>) {
    self.mediaId = mediaId
  }

  public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: AnimeRankingSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: AnimeRankingSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.Media }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("title", Title?.self),
        .field("averageScore", Int?.self),
        .field("popularity", Int?.self),
      ] }

      /// The official titles of the media in various languages
      public var title: Title? { __data["title"] }
      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? { __data["averageScore"] }
      /// The number of users with the media on their list
      public var popularity: Int? { __data["popularity"] }

      /// Media.Title
      ///
      /// Parent Type: `MediaTitle`
      public struct Title: AnimeRankingSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.MediaTitle }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("english", String?.self),
        ] }

        /// The official english title
        public var english: String? { __data["english"] }
      }
    }
  }
}
