const String getMe = r'''
query GetMe {
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
    repositories(first: 10) {
      totalCount
      nodes {
        id
        name
      }
    }
  }
}
''';
