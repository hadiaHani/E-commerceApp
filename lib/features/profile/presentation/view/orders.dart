import 'package:ecommerce_admin_app_firebase/core/resources/manager_assets.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/empty_bag.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/profile/presentation/view/widgets/orders_widget.dart';
import 'package:flutter/material.dart';

class OrdersScreenFree extends StatelessWidget {
  const OrdersScreenFree({super.key});
  final bool isEmptyOrders = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(
            label: ManagerStrings.placedOrders,
          ),
        ),
        body: isEmptyOrders
            ? EmptyBagWidget(
                imagePath: ManagerAssets.orderBag,
                title: ManagerStrings.noOrders,
                subtitle: "",
                buttonText: ManagerStrings.shopNow)
            : ListView.separated(
                itemCount: 15,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidth.w2,
                        vertical: ManagerHeight.h6),
                    child: const OrdersWidgetFree(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ));
  }
}
