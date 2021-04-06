const String getMe = r'''
query GetMe($repoFirst: Int, $repoAfter: String) {
  viewer {
    login
    name
    email
    createdAt
    avatarUrl
    followers {
      totalCount
    }
    following {
      totalCount
    }
    starredRepositories {
      totalCount
    }
    status {
      emoji
      message
    }
    repositories(first: $repoFirst, after: $repoAfter) {
      totalCount
      edges {
        cursor
        node {
          id
          name
        }
      }
    }
  }
}
''';

const String queryRepo = r'''
query QueryRepo($repoFirst: Int, $repoAfter: String) {
  viewer {
    repositories(first: $repoFirst, after: $repoAfter) {
      totalCount
      edges {
        cursor
        node {
          id
          name
        }
      }
    }  
  }
}
''';