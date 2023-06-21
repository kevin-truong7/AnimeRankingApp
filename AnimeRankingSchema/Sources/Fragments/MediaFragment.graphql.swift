// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct MediaFragment: AnimeRankingSchema.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment MediaFragment on Media {
      __typename
      id
      title {
        __typename
        english
      }
      coverImage {
        __typename
        large
      }
      averageScore
      popularity
      characters {
        __typename
        nodes {
          __typename
          name {
            __typename
            full
          }
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.Media }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("title", Title?.self),
    .field("coverImage", CoverImage?.self),
    .field("averageScore", Int?.self),
    .field("popularity", Int?.self),
    .field("characters", Characters?.self),
  ] }

  /// The id of the media
  public var id: Int { __data["id"] }
  /// The official titles of the media in various languages
  public var title: Title? { __data["title"] }
  /// The cover images of the media
  public var coverImage: CoverImage? { __data["coverImage"] }
  /// A weighted average score of all the user's scores of the media
  public var averageScore: Int? { __data["averageScore"] }
  /// The number of users with the media on their list
  public var popularity: Int? { __data["popularity"] }
  /// The characters in the media
  public var characters: Characters? { __data["characters"] }

  /// Title
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

  /// CoverImage
  ///
  /// Parent Type: `MediaCoverImage`
  public struct CoverImage: AnimeRankingSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.MediaCoverImage }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("large", String?.self),
    ] }

    /// The cover image url of the media at a large size
    public var large: String? { __data["large"] }
  }

  /// Characters
  ///
  /// Parent Type: `CharacterConnection`
  public struct Characters: AnimeRankingSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.CharacterConnection }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("nodes", [Node?]?.self),
    ] }

    public var nodes: [Node?]? { __data["nodes"] }

    /// Characters.Node
    ///
    /// Parent Type: `Character`
    public struct Node: AnimeRankingSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.Character }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", Name?.self),
      ] }

      /// The names of the character
      public var name: Name? { __data["name"] }

      /// Characters.Node.Name
      ///
      /// Parent Type: `CharacterName`
      public struct Name: AnimeRankingSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.CharacterName }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("full", String?.self),
        ] }

        /// The character's first and last name
        public var full: String? { __data["full"] }
      }
    }
  }
}
