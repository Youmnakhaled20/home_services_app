import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onSearch,
        decoration: InputDecoration(
          hintText: "Search services...",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.grey,
            ),
            onPressed: () {
              _controller.clear();
              widget.onSearch('');
              setState(() {});
            },
          )
              : Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: Colors.white,
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