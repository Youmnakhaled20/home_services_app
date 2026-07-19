import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/theme/app_colors.dart';
import '../core/cubit/theme_cubit.dart';
import '../core/cubit/theme_state.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final isDark = context.watch<ThemeCubit>().state.isDarkMode;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ✅ Menu Icon
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(0.15)
                  : AppColors.primary.withOpacity(.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              Icons.menu,
              color: isDark ? Colors.white : AppColors.primary,
            ),
          ),
          // ✅ Logo
          SizedBox(
            height: 50,
            width: 250,
            child: SvgPicture.asset(
              'assets/icons/any_service_logo.svg',
              height: 50,
              width: 130,
              colorFilter: ColorFilter.mode(
                isDark ? Colors.white : AppColors.primary,
                BlendMode.srcIn,
              ),
              fit: BoxFit.contain,
            ),
          ),
          InkWell(
            onTap: () {
              themeCubit.toggleTheme();
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.15)
                    : AppColors.primary.withOpacity(.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: isDark ? Colors.white : AppColors.primary,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}