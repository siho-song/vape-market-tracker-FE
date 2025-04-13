/// 모든 라우트 경로를 상수로 정의
class RouteNames {
  static const home = '/';
  static const search = '/search';
  static const productDetail = '/product/:id';
}

class RoutePaths {
  static String productDetail(String id) => '/product/$id';
}
