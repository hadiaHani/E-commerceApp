import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/cache/cache.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/home/presentation/view/widget/ctg_rounded_widget.dart';
import 'package:ecommerce_admin_app_firebase/features/home/presentation/view/widget/latest_arrival.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppNameTextWidget(fontSize: ManagerFontSize.s20),
        leading: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
          child: Image.asset(ManagerAssets.shoppingCart),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w12,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * Constant.d_24,
                child: ClipRRect(
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        Constant.bannersImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    autoplay: true,
                    itemCount: Constant.bannersImages.length,
                    pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: ManagerColors.whiteColor,
                        activeColor: ManagerColors.redColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ManagerHeight.h18,
              ),
              TitlesTextWidget(
                label: "Latest arrival",
                fontSize: ManagerFontSize.s24,
              ),
              SizedBox(
                height: ManagerHeight.h18,
              ),
              SizedBox(
                height: size.height * Constant.d_2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value: productProvider.getProducts[index],
                          child: const LatestArrivalProductsWidget());
                    }),
              ),
              SizedBox(
                height: ManagerHeight.h12,
              ),
              TitlesTextWidget(
                label: "Categories",
                fontSize: ManagerFontSize.s24,
              ),
              SizedBox(
                height: ManagerHeight.h18,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: Constant.categoryCrossAxisCount,
                children: List.generate(
                  Constant.categoriesList.length,
                  (index) {
                    CacheData().setName(Constant.categoriesList[index].name);

                    return CategoryRoundedWidget(
                      image: Constant.categoriesList[index].image,
                      name: Constant.categoriesList[index].name,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
