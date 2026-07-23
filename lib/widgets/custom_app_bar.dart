// lib/widgets/custom_app_bar.dart
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
              color: isDark ? AppColors.darkCard : AppColors.lightPrimary.withOpacity(.1),
              borderRadius: BorderRadius.circular(14),
              border: isDark
                  ? Border.all(color: AppColors.darkBorder, width: 1.5)
                  : null,
            ),
            child: Icon(
              Icons.menu,
              color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
            ),
          ),
          // ✅ Logo
          SizedBox(
            height: 50,
            width: 200,
            child: SvgPicture.asset(
              'assets/icons/any_service_logo.svg',
              height: 50,
              width: 130,
              colorFilter: ColorFilter.mode(
                isDark ? AppColors.darkNeon : AppColors.lightPrimary,
                BlendMode.srcIn,
              ),
              fit: BoxFit.contain,
            ),
          ),
          // ✅ Theme Toggle Icon
          InkWell(
            onTap: () {
              themeCubit.toggleTheme();
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkCard : AppColors.lightPrimary.withOpacity(.1),
                borderRadius: BorderRadius.circular(14),
                border: isDark
                    ? Border.all(color: AppColors.darkBorder, width: 1.5)
                    : null,
              ),
              child: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}