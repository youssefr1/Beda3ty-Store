import 'package:astro/featured/admin/add_products/presentation/view%20modell/getall%20product/get_all_product_cubit.dart';
import 'package:astro/featured/admin/add_products/presentation/widjets/create/create_products.dart';
import 'package:astro/featured/admin/add_products/presentation/widjets/product_admin_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GetAllProductCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          const CreateProducts(),
          Expanded(
            child: BlocBuilder<GetAllProductCubit, GetAllProductState>(
              builder: (context, state) {
                if (state is GetAllProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is GetAllProductsFailure) {
                  return Center(child: Text(state.message));
                }

                if (state is GetAllProductsSuccess) {
                  final products = state.products;

                  return RefreshIndicator(
                    onRefresh: () async => cubit.getAllProducts(),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(child: SizedBox(height: 20.h)),

                        SliverToBoxAdapter(
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 165 / 250,
                                ),
                            itemBuilder: (context, index) {
                              final product = products[index];

                              return ProductAdminItem(
                                imageUrl: product.images.isNotEmpty
                                    ? product.images.first
                                    : "https://via.placeholder.com/150",
                                title: product.title,
                                categoryName: product.category.name,
                                price: product.price.toString(),
                              );
                            },
                          ),
                        ),

                        SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                      ],
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
