import 'package:flutter/material.dart';
import 'package:pickdam/core/utils/responsive.dart';
import 'package:pickdam/core/theme/dimens.dart';
import 'header/desktop/top_menu.dart';
import 'header/logo_search_section.dart';
import 'header/category_bar.dart';

class HeaderWidget extends StatefulWidget {
  final bool isApp;

  const HeaderWidget({
    super.key,
    required this.isApp,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String _selectedTab = '홈';

  void _handleTabSelect(String label) {
    setState(() {
      _selectedTab = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = Responsive.getResponsiveHorizontalPadding(context);
    bool isApp = widget.isApp;

    final verticalSpacing = isApp
        ? Dimens.headerVerticalSpacingMobile
        : Dimens.headerVerticalSpacingDesktop;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //Top 바
        if (!isApp)
          Column(
            children: [
              SizedBox(height: verticalSpacing * Dimens.headerTopMenuSpacingFactor),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: const TopMenu(),
              ),
            ],
          ),

        //로고, 검색 섹션
        SizedBox(height: verticalSpacing),
        Padding(
          padding: isApp
              ? EdgeInsets.only(left: horizontalPadding)
              : EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: LogoSearchSection(
            isApp: isApp,
          ),
        ),

        SizedBox(height: verticalSpacing),
        //카테고리 바
        CategoryBar(
          padding: horizontalPadding,
          onSelected: _handleTabSelect,
          selectedTab: _selectedTab,
          isApp: isApp,
        ),
      ],
    );
  }
}