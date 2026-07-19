import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SearchServiceField extends StatefulWidget {
  final Function(String) onSearch;

  const SearchServiceField({
    super.key,
    required this.onSearch,
  });

  @override
  State<SearchServiceField> createState() => _SearchServiceFieldState();
}

class _SearchServiceFieldState extends State<SearchServiceField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: isDark ? Colors.transparent : AppColors.primary,
        borderRadius: BorderRadius.circular(18),
        border: isDark
            ? Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1.5,
        )
            : null,
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.20)
                : AppColors.primary.withOpacity(0.20),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          widget.onSearch(value); // ✅ الـ Search شغال
        },
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? Colors.transparent : AppColors.primary,
          hintText: "Search services...",
          hintStyle: TextStyle(
            color: isDark
                ? Colors.white.withOpacity(0.5)
                : Colors.white.withOpacity(0.7),
            fontSize: 15,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isDark
                ? Colors.white.withOpacity(0.5)
                : Colors.white.withOpacity(0.7),
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
            icon: Icon(
              Icons.clear,
              color: isDark
                  ? Colors.white.withOpacity(0.5)
                  : Colors.white.withOpacity(0.7),
            ),
            onPressed: () {
              _controller.clear();
              widget.onSearch(''); // ✅ مسح البحث
              setState(() {});
            },
          )
              : Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.transparent
                  : Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: isDark
                  ? Border.all(
                color: Colors.white.withOpacity(0.15),
              )
                  : Border.all(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            child: Icon(
              Icons.tune_rounded,
              color: isDark
                  ? Colors.white.withOpacity(0.7)
                  : Colors.white,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
      ),
    );
  }
}