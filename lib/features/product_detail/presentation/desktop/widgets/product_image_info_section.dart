import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickdam/core/theme/app_colors.dart';
import 'package:pickdam/core/theme/app_text_styles.dart';
import 'package:pickdam/core/theme/dimens.dart';
import 'package:pickdam/features/product_detail/data/models/product_detail.dart';

class ProductImageInfoSection extends StatelessWidget {
  final ProductDetail product;

  const ProductImageInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final imageSize = 60.w;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Dimens.elementVerticalGap),
        ClipRRect(
          child: Image.network(
            product.thumbnailUrl,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: imageSize,
              height: imageSize,
              color: AppColors.grayLighter,
              alignment: Alignment.center,
              child: Icon(Icons.image_not_supported, size: imageSize, color: AppColors.gray),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text('상품명: ${product.name}', style: AppTextStyles.productDetailTextStyleDesktop),
        SizedBox(height: 8.h),
        Text('호흡 방식: ${product.inhaleType}', style: AppTextStyles.productDetailTextStyleDesktop),
        Text('맛: ${product.flavor}', style: AppTextStyles.productDetailTextStyleDesktop),
        Text('용량: ${product.capacity}', style: AppTextStyles.productDetailTextStyleDesktop),
        SizedBox(height: 16.h),
        Text('조회수: ${product.totalViews}', style: AppTextStyles.productDetailTextStyleDesktop),
        Text('찜한 수: ${product.totalFavorites}', style: AppTextStyles.productDetailTextStyleDesktop),
      ],
    );
  }
}
