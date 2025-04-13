import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pickdam/core/utils/responsive.dart';
import 'package:pickdam/core/router/route_names.dart';

import 'package:pickdam/features/home/presentation/screens/home_screen.dart';
import 'package:pickdam/features/search/presentation/screens/search_page.dart';
import 'package:pickdam/features/product_detail/data/mock/product_detail_mock.dart';
import 'package:pickdam/features/product_detail/presentation/desktop/product_detail_page_desktop.dart';
import 'package:pickdam/features/product_detail/presentation/mobile/product_detail_page_mobile.dart';


final router = GoRouter(
  initialLocation: RouteNames.home,
  routes: [
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouteNames.search,
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: RouteNames.productDetail,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final product = mockProductDetails.firstWhere((p) => p.id == id);

        return Responsive.isDesktop(context)
            ? ProductDetailPageDesktop(product: product)
            : ProductDetailPageMobile(product: product);
      },
    ),
  ],
);