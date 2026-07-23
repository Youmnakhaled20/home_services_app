// lib/features/service_listing/widgets/category_banner.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import 'badge.dart';

class CategoryBanner extends StatefulWidget {
  final String title;
  final String image;
  final int servicesCount;
  final Function(String) onSearch;

  const CategoryBanner({
    super.key,
    required this.title,
    required this.image,
    required this.servicesCount,
    required this.onSearch,
  });

  @override
  State<CategoryBanner> createState() => _CategoryBannerState();
}

class _CategoryBannerState extends State<CategoryBanner> {
  bool _isSearchOpen = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isSearchOpen ? 310 : 250,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 250,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: widget.image,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: Colors.grey[800]),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.55),
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.0, 0.4, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(21),
                            border: Border.all(color: Colors.white.withOpacity(0.2)),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSearchOpen = !_isSearchOpen;
                            if (!_isSearchOpen) {
                              _searchController.clear();
                              widget.onSearch('');
                            }
                          });
                        },
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: _isSearchOpen
                                ? (isDark ? AppColors.darkNeon : const Color(0xFF235347))
                                : Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(21),
                            border: Border.all(
                              color: _isSearchOpen ? Colors.transparent : Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: Icon(
                            _isSearchOpen ? Icons.close_rounded : Icons.search_rounded,
                            color: _isSearchOpen && isDark ? Colors.black : Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    widget.title,
                    style: AppTextStyles.headlineSmall(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  CategoryBadge(text: "${widget.servicesCount} Services Available"),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          if (_isSearchOpen)
            Positioned(
              left: 20,
              right: 20,
              bottom: 0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkCard : Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(isDark ? 0.35 : 0.08),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                        border: Border.all(
                          color: isDark ? AppColors.darkBorder : Colors.grey.withOpacity(0.15),
                          width: isDark ? 1.5 : 1.0,
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        autofocus: true,
                        onChanged: widget.onSearch,
                        style: AppTextStyles.bodyMedium(context).copyWith(
                          color: isDark ? Colors.white : const Color(0xFF111111),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search services...",
                          hintStyle: AppTextStyles.bodyMedium(context).copyWith(
                            color: isDark ? const Color(0xFFA0A0A0) : const Color(0xFF6B7280),
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: isDark ? const Color(0xFFA0A0A0) : const Color(0xFF6B7280),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkNeon : const Color(0xFF235347),
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: (isDark ? AppColors.darkNeon : const Color(0xFF235347)).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.tune_rounded,
                      color: isDark ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}