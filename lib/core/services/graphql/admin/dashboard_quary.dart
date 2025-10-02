class DashboardQuery{
  const DashboardQuery._();
  static const DashboardQuery _instance = DashboardQuery._();
  factory DashboardQuery() => _instance;




  // products
Map<String,dynamic> numberOfProductsMapQuary(){
  return {
    'quary' : '''
       {
        products{
          title
        }
      }
    
    '''
  };

}Map<String,dynamic> numberOfCategoriesMapQuary(){
  return {
    'quary' : '''
       {
        categories{
          name
        }
      }
    
    '''
  };

}Map<String,dynamic> numberOfUsersMapQuary(){
  return {
    'quary' : '''
       {
        users{
          name
        }
      }
    
    '''
  };

}
}