import 'package:dowerly/core/global_imports.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ErrorMapWidget extends StatelessWidget {
  const ErrorMapWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 10.h),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: Text(
              message,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 3.h),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text("إعادة المحاولة"),
            style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.greenA700,
            ),
          ),
          if (message.contains('الإعدادات')) SizedBox(height: 2.h),
          ElevatedButton.icon(
            onPressed: openAppSettings,
            icon: const Icon(Icons.settings),
            label: const Text("فتح الإعدادات"),
            style: ElevatedButton.styleFrom(backgroundColor: appTheme.blue800),
          ),
        ],
      ),
    );
  }
}
