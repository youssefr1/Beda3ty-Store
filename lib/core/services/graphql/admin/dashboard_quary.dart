class DashboardQuery {
  const DashboardQuery._();
  static const DashboardQuery _instance = DashboardQuery._();
  factory DashboardQuery() => _instance;

  // products
  Map<String, dynamic> numberOfProductsMapQuery() {
    return {
      'query': '''
        {
          products {
            title
          }
        }
      '''
    };
  }

  Map<String, dynamic> numberOfCategoriesMapQuery() {
    return {
      'query': '''
        {
          categories {
            name
          }
        }
      '''
    };
  }

  Map<String, dynamic> numberOfUsersMapQuery() {
    return {
      'query': '''
        {
          users {
            name
          }
        }
      '''
    };
  }
}
