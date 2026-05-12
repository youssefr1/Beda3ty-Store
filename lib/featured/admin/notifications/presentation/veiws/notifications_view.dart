import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/common/widjets/custom_linear_button.dart';
import 'package:astro/core/common/widjets/custom_text_field.dart';
import 'package:astro/core/common/widjets/show_toast.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/services/fcm/firebase_cloud_messaging.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _sendNotification() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseCloudMessaging.instance.sendTopicNotification(
        title: _titleController.text.trim(),
        body: _bodyController.text.trim(),
      );
      ShowToast.showToastSuccessTop(message: 'Notification sent successfully');
      _titleController.clear();
      _bodyController.clear();
    } catch (e) {
      ShowToast.showToastErrorTop(message: 'Failed to send notification: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.mainColor,
      appBar: const CustomAdminAppbar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Notifications',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextApp(
                text: 'Send a notification to all users',
                theme: context.textStyle.copyWith(
                  color: Colors.white70,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: _titleController,
                hintText: 'Notification Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                controller: _bodyController,
                hintText: 'Notification Body',
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a body';
                  }
                  return null;
                },
              ),
              const Spacer(),
              CustomLinearButton(
                onPressed: _isLoading ? () {} : _sendNotification,
                width: double.infinity,
                height: 50.h,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : TextApp(
                        text: 'Send Notification',
                        theme: context.textStyle.copyWith(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
