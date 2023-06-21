// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LoadAnimeTitleQuery: GraphQLQuery {
  public static let operationName: String = "LoadAnimeTitleQuery"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query LoadAnimeTitleQuery($page: Int, $perPage: Int, $sort: [MediaSort]) {
        Page(page: $page, perPage: $perPage) {
          __typename
          media(type: ANIME, sort: $sort) {
            __typename
            ...MediaFragment
          }
        }
      }
      """#,
      fragments: [MediaFragment.self]
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "sort": sort
  ] }

  public struct Data: AnimeRankingSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AnimeRankingSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("media", [Medium?]?.self, arguments: [
          "type": "ANIME",
          "sort": .variable("sort")
        ]),
      ] }

      public var media: [Medium?]? { __data["media"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AnimeRankingSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AnimeRankingSchema.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MediaFragment.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: MediaFragment.Title? { __data["title"] }
        /// The cover images of the media
        public var coverImage: MediaFragment.CoverImage? { __data["coverImage"] }
        /// A weighted average score of all the user's scores of the media
        public var averageScore: Int? { __data["averageScore"] }
        /// The number of users with the media on their list
        public var popularity: Int? { __data["popularity"] }
        /// The characters in the media
        public var characters: MediaFragment.Characters? { __data["characters"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var mediaFragment: MediaFragment { _toFragment() }
        }
      }
    }
  }
}
