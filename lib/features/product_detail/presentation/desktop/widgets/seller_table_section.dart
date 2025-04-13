import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickdam/core/theme/app_colors.dart';
import 'package:pickdam/core/theme/app_text_styles.dart';
import 'package:pickdam/features/product_detail/data/models/seller_info.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerTableSection extends StatefulWidget {
  final List<SellerInfo> sellers;

  const SellerTableSection({super.key, required this.sellers});

  @override
  State<SellerTableSection> createState() => _SellerTableSectionState();
}

class _SellerTableSectionState extends State<SellerTableSection> {
  bool includeShipping = true;

  void _launchSellerUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  List<SellerInfo> _sortedSellers() {
    final sorted = [...widget.sellers];
    if (includeShipping) {
      sorted.sort((a, b) => (a.price + a.shippingFee).compareTo(b.price + b.shippingFee));
    } else {
      sorted.sort((a, b) => a.price.compareTo(b.price));
    }
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    final sellers = _sortedSellers();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: AppColors.divider),
        SizedBox(height: 24.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('판매처 정보', style: AppTextStyles.productDetailTextStyleDesktop),
            Row(
              children: [
                Text('배송비 포함', style: AppTextStyles.productDetailTextStyleDesktop),
                SizedBox(width: 8.w),
                Switch(
                  value: includeShipping,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      includeShipping = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 16.h),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.divider),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              // 👉 헤더
              Container(
                color: AppColors.grayLighter,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Text('판매처', style: AppTextStyles.productDetailTextStyleDesktop)),
                    Expanded(flex: 3, child: Text('가격', style: AppTextStyles.productDetailTextStyleDesktop)),
                    Expanded(flex: 2, child: Text('배송비', style: AppTextStyles.productDetailTextStyleDesktop)),
                    Expanded(flex: 2, child: Text('구매', style: AppTextStyles.productDetailTextStyleDesktop)),
                  ],
                ),
              ),

              // 👉 본문: 최대 높이만 제한 + 내부 스크롤 가능
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 300.h),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sellers.length,
                  itemBuilder: (context, index) {
                    final seller = sellers[index];
                    final isLowest = index == 0;

                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                      decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: AppColors.divider, width: 0.5)),
                      ),
                      child: Row(
                        children: [
                          // 판매처 (하이퍼링크)
                          Expanded(
                            flex: 3,
                            child: GestureDetector(
                              onTap: () => _launchSellerUrl(seller.url),
                              child: Text(
                                seller.name,
                                style: AppTextStyles.productDetailTextStyleDesktop.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),

                          // 가격 (최저가 스티커)
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                if (isLowest)
                                    // child: 
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(2.r),
                                      ),
                                      child: Text(
                                        '최저가',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 3.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                Text('${seller.price}원', style: AppTextStyles.productDetailTextStyleDesktop),
                              ],
                            ),
                          ),

                          // 배송비
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${seller.shippingFee}원',
                              style: AppTextStyles.productDetailTextStyleDesktop,
                            ),
                          ),

                          // 구매 버튼
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () => _launchSellerUrl(seller.url),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                              ),
                              child: const Text('구매'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
