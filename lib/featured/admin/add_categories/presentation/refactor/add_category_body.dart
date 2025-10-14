import 'package:astro/core/common/loading/loading_shimmer.dart';
import 'package:astro/core/common/screens/noScreen.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/delete%20category/delete_category_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/widjets/add_category_item.dart';
import 'package:astro/featured/admin/add_categories/presentation/widjets/create/create_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astro/core/di/injection_container.dart';

class AddCategoryBody extends StatelessWidget {
  const AddCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DeleteCategoriesBloc>(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            // Create Category Card
            const CreateCategory(),
            SizedBox(height: 15.h),

            Expanded(
              child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
                builder: (context, state) {
                  // 🌀 Loading state
                  if (state is GetAllCategoriesLoading) {
                    return ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (_, __) => SizedBox(height: 15.h),
                      itemBuilder: (context, index) {
                        return LoadingShimmer(
                          height: 130.h,
                          borderRadius: 15,
                        );
                      },
                    );
                  }

                  // ✅ Success state
                  else if (state is GetAllCategoriesSuccsse) {
                    final categories = state.categories;
                    return RefreshIndicator(
                      color: context.color.bluePinkDark,
                      onRefresh: () async {
                        context
                            .read<GetAllCategoriesBloc>()
                            .add(CategoryEvent());
                      },
                      child: ListView.separated(
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => SizedBox(height: 15.h),
                        itemBuilder: (context, index) {
                          final cat = categories[index];
                          return AddCategoryItem(
                            title: cat.name,
                            image: cat.image,
                            categoryId: cat.id,
                          );
                        },
                      ),
                    );
                  }

                  // ❌ Failure state
                  else if (state is GetAllCategoriesFailure) {
                    return const NoScreenScreen();
                  }

                  // 💤 Default
                  else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
