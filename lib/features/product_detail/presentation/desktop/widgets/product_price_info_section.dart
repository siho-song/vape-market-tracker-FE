import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickdam/core/theme/app_colors.dart';
import 'package:pickdam/core/theme/app_text_styles.dart';
import 'package:pickdam/features/product_detail/data/models/seller_info.dart';

class ProductPriceInfoSection extends StatelessWidget {
  final SellerInfo seller;
  const ProductPriceInfoSection({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    final totalPrice = seller.price + seller.shippingFee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '배송비 포함 최저가',
          style: AppTextStyles.productDetailTextStyleDesktop,
        ),
        SizedBox(height: 8.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '최저가 ${totalPrice}원',
              style: AppTextStyles.productPriceStyleDesktop.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // launchUrl(Uri.parse(seller.url));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: const Text('최저가 사러 가기'),
            ),
          ],
        ),

        SizedBox(height: 8.h),

        Row(
          children: [
            Icon(Icons.local_shipping, size: 7.w, color: AppColors.gray),
            SizedBox(width: 4.w),
            Text('${seller.shippingFee}원 포함', style: AppTextStyles.productDetailTextStyleDesktop),
            SizedBox(width: 4.w),
            Text('|', style: AppTextStyles.productDetailTextStyleDesktop),
            SizedBox(width: 4.w),
            Text(seller.name, style: AppTextStyles.productDetailTextStyleDesktop),
          ],
        ),
      ],
    );
  }
}
