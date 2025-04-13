import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickdam/features/product_detail/data/models/product_detail.dart';
import 'package:pickdam/features/product_detail/data/models/review.dart';

class ProductDetailPageMobile extends StatelessWidget {
  final ProductDetail product;

  const ProductDetailPageMobile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일
            Image.network(
              product.thumbnailUrl,
              width: double.infinity,
              height: 250.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.h),

            // 기본 정보
            Text(product.name, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 6.h),
            Text('맛: ${product.flavor} / 용량: ${product.capacity}'),
            Text('호흡 방식: ${product.inhaleType}'),
            Text('카테고리: ${product.productCategory.name}'),
            SizedBox(height: 12.h),

            // 평균 리뷰
            Text('⭐ 평균 평점: ${product.averageReviewInfo.rating.toStringAsFixed(1)} '
                '(${product.averageReviewInfo.totalReviewCount}개 리뷰)'),
            Text('당도: ${product.averageReviewInfo.sweetness}, 멘솔: ${product.averageReviewInfo.menthol}, '
                '목긁음: ${product.averageReviewInfo.throatHit}'),

            SizedBox(height: 20.h),
            Text('🛒 판매처', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            ...product.sellers.map((s) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s.name),
                  Text('${s.price}원 + 배송비 ${s.shippingFee}원'),
                ],
              ),
            )),

            SizedBox(height: 24.h),
            Text('💬 리뷰', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            ...product.reviews.map((Review r) => Container(
              margin: EdgeInsets.only(top: 12.h),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${r.nickname} • ${r.createdAt.toLocal().toString().split(" ").first}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6.h),
                  Text(r.content),
                  SizedBox(height: 8.h),
                  Text('당도: ${r.sweetness}, 멘솔: ${r.menthol}, 목긁음: ${r.throatHit}, 바디감: ${r.body}, 상큼함: ${r.freshness}'),
                  SizedBox(height: 8.h),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: r.imageUrls
                        .map((img) => ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: Image.network(img, width: 80.w, height: 80.w, fit: BoxFit.cover),
                            ))
                        .toList(),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}