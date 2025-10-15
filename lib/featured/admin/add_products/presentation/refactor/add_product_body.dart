import 'package:astro/featured/admin/add_products/presentation/widjets/create/create_products.dart';
import 'package:astro/featured/admin/add_products/presentation/widjets/product_admin_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 30.h,
      ),
      child: Column(
        children: [
          // Create Product Button
          const CreateProducts(),
          // Get All Product list view item
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20.h),
                  ),
                  SliverToBoxAdapter(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Numbers of product in one Row
                            crossAxisSpacing: 8 // padding bewteen products horizontal
                            ,mainAxisSpacing:15 , // padding bewteen products vertical
                        childAspectRatio: 165 / 250, //
                          ),
                      itemBuilder: (BuildContext context, int index,) {
                            return const ProductAdminItem(
                              imageUrl:
                                  'https://media.wired.com/photos/5b8999943667562d3024c321/3:2/w_1920,c_limit/trash2-01.jpg',
                              title: ' MacBook h32 ',
                              categoryName: 'Shoes',
                              price: '150',
                            );
                          },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20.h),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
