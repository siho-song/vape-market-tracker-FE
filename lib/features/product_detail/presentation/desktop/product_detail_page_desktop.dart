import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pickdam/core/theme/dimens.dart';
import 'package:pickdam/core/theme/app_colors.dart';
import 'package:pickdam/core/utils/responsive.dart';
import 'package:pickdam/core/widgets/layout/page_scaffold.dart';
import 'package:pickdam/features/product_detail/data/models/product_detail.dart';

// 분리된 위젯들
import 'package:pickdam/features/product_detail/presentation/desktop/widgets/product_image_info_section.dart';
import 'package:pickdam/features/product_detail/presentation/desktop/widgets/product_price_graph_section.dart';
import 'package:pickdam/features/product_detail/presentation/desktop/widgets/product_price_info_section.dart';
import 'package:pickdam/features/product_detail/presentation/desktop/widgets/seller_table_section.dart';


class ProductDetailPageDesktop extends StatelessWidget {
  final ProductDetail product;

  const ProductDetailPageDesktop({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.getResponsiveHorizontalPadding(context);
    final imageSize = 60.w;

    return PageScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: padding,
            vertical: Dimens.elementVerticalGap,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ✅ 좌측: 이미지 + 상품정보
              ProductImageInfoSection(product: product),

              /// ✅ 중간 Divider
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Container(
                  width: 1.w,
                  height: imageSize + 160.h,
                  color: AppColors.divider,
                ),
              ),

              /// ✅ 우측: 그래프 + 가격정보 + 셀러 리스트
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimens.elementVerticalGap),
                    const ProductPriceGraphSection(),
                    SizedBox(height: 24.h),
                    ProductPriceInfoSection(seller: product.sellers.first),
                    SizedBox(height: 24.h),

                    /// ✅ 전체 셀러 리스트
                    SellerTableSection(sellers: product.sellers),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
