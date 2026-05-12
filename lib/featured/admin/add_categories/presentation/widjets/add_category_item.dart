import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/common/bottom%20sheet/custom_bottom_sheet.dart';
import 'package:astro/core/common/loading/loading_shimmer.dart';
import 'package:astro/core/common/widjets/custom_container_linear_admin.dart';
import 'package:astro/core/common/widjets/show_toast.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/delete%20category/delete_category_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/update%20categories/update_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/widjets/update/update_category_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryItem extends StatelessWidget {
  const AddCategoryItem({
    required this.title,
    required this.image,
    required this.categoryId,
    super.key,
  });

  final String title;
  final String image;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteCategoriesBloc, DeleteCategoryState>(
      listener: (context, state) {
        if (state is DeleteCategorySuccsse) {
          ShowToast.showToastSuccessTop(
            message: "Category deleted successfully",
          );
          // 🌀 نعمل Refresh للبيانات بعد الحذف
          context.read<GetAllCategoriesBloc>().add(CategoryEvent());
        } else if (state is DeleteCategoryFailure) {
          ShowToast.showToastErrorTop(
            message: state.error,
          );
        }
      },
      child: CustomContainerLinearAdmin(
        height: 130.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamilyHelper.poppinsEnglish,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        // 🗑️ delete
                        IconButton(
                          onPressed: () {
                            context.read<DeleteCategoriesBloc>().add(
                              DeleteCategoriesEvent(id: int.parse(categoryId)),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),

                        // ✏️ update
                        IconButton(
                          onPressed: () async {
                            // 👇 افتح البوتوم شيت وانتظر لما المستخدم يخرج
                            await CustomBottomSheet.showModelBottomSheetContainer(
                              context: context,
                              widjet: MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (_) => sl<UpdateCategoryBloc>(),
                                  ),
                                  BlocProvider(
                                    create: (_) => sl<UploadImageCubit>(),
                                  ),
                                ],
                                child: UpdateCategoryButton(
                                  categoryId: int.parse(categoryId),
                                  oldName: title,
                                  oldImage: image,
                                ),
                              ),
                            );

                            // ✅ بعد الخروج من البوتوم شيت نعمل Refresh تلقائي
                            if (context.mounted) {
                              context.read<GetAllCategoriesBloc>().add(
                                CategoryEvent(),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 90.h,
                  width: 120.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      LoadingShimmer(height: 90.h, width: 120.w),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 70,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
