import 'package:flutter/material.dart';
import 'package:pickdam/core/theme/app_text_styles.dart';
import 'package:pickdam/core/theme/app_colors.dart';
import 'package:pickdam/core/theme/dimens.dart';

class SearchBarDesktop extends StatelessWidget {
  final double height;
  final double iconSize;
  final Key? anchorKey;

  const SearchBarDesktop({
    super.key,
    required this.height,
    required this.iconSize,
    this.anchorKey,
  });

  @override
  Widget build(BuildContext context) {
    final String hintText = '상품, 브랜드, 성분 검색';
    return Container(
      key: anchorKey,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: Dimens.searchBarIconPadding),
      decoration: BoxDecoration(
        color: AppColors.grayLighter,
        borderRadius: BorderRadius.circular(Dimens.searchBarRadius),
        border: Border.all(color: AppColors.primary, width: 1.2),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.gray, size: iconSize),
          SizedBox(width: Dimens.searchBarInputLeftPadding),
          Expanded(
            child: TextField(
              style: AppTextStyles.logoSearchInputText,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: Dimens.searchBarInputVerticalPadding,
                ),
                hintText: hintText,
                hintStyle: AppTextStyles.logoSearchHintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}