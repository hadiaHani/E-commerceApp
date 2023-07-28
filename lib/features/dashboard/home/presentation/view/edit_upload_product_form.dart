import 'package:ecommerce_admin_app_firebase/config/constant.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_color.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_fonts.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_size.dart';
import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/validator/validator.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/show_error_dialog.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/subtitle_text.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/title_text.dart';
import 'package:ecommerce_admin_app_firebase/features/home/domain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class EditOrUploadProductScreen extends StatefulWidget {
  static const routeName = '/EditOrUploadProductScreen';

  const EditOrUploadProductScreen({
    super.key,
    this.productModel,
  });
  final ProductModel? productModel;
  @override
  State<EditOrUploadProductScreen> createState() =>
      _EditOrUploadProductScreenState();
}

class _EditOrUploadProductScreenState extends State<EditOrUploadProductScreen> {
  final formKey = GlobalKey<FormState>();
  XFile? pickedImage;
  bool isEditing = false;
  String? productNetworkImage;

  late TextEditingController titleController,
      priceController,
      descriptionController,
      quantityController;
  String? categoryValue;
  @override
  void initState() {
    if (widget.productModel != null) {
      isEditing = true;
      productNetworkImage = widget.productModel!.productImage;
      categoryValue = widget.productModel!.productCategory;
    }
    titleController =
        TextEditingController(text: widget.productModel?.productTitle);
    priceController =
        TextEditingController(text: widget.productModel?.productPrice);
    descriptionController =
        TextEditingController(text: widget.productModel?.productDescription);
    quantityController =
        TextEditingController(text: widget.productModel?.productQuantity);

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  void clearForm() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
    quantityController.clear();
    removePickedImage();
  }

  void removePickedImage() {
    setState(() {
      pickedImage = null;
      productNetworkImage = null;
    });
  }

  Future<void> uploadProduct() async {
    if (categoryValue == null) {
      showErrorORWarningDialog(
        context: context,
        subtitle: "Category is empty",
        fct: () {},
      );

      return;
    }
    if (pickedImage == null) {
      showErrorORWarningDialog(
        context: context,
        subtitle: "Please pick up an image",
        fct: () {},
      );

      return;
    }
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  Future<void> editProduct() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (pickedImage == null && productNetworkImage == null) {
      showErrorORWarningDialog(
        context: context,
        subtitle: "Please pick up an image",
        fct: () {},
      );
      return;
    }
    if (isValid) {}
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await imagePickerDialog(
      context: context,
      cameraFCT: () async {
        pickedImage = await picker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galleryFCT: () async {
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          pickedImage = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          bottomSheet: SizedBox(
            height:
                kBottomNavigationBarHeight + Constant.cartBottomCheckoutHeight,
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: ManagerWidth.w12,
                          vertical: ManagerHeight.h12),
                      backgroundColor: ManagerColors.redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r10,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.clear),
                    label: Text(
                      ManagerStrings.clear,
                      style: TextStyle(
                        fontSize: ManagerFontSize.s24,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: ManagerWidth.w12,
                          vertical: ManagerHeight.h12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r10,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.upload),
                    label: Text(
                      isEditing
                          ? ManagerStrings.editProduct
                          : ManagerStrings.uploadProduct,
                      style: TextStyle(
                        fontSize: ManagerFontSize.s24,
                      ),
                    ),
                    onPressed: () {
                      if (isEditing) {
                        editProduct();
                      } else {
                        uploadProduct();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: const TitlesTextWidget(
              label: ManagerStrings.uploadNewProduct,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: ManagerHeight.h20,
                  ),
                  if (isEditing && productNetworkImage != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(ManagerRadius.r12),
                      child: Image.network(
                        productNetworkImage!,
                        height: size.width * Constant.d_5,
                        alignment: Alignment.center,
                      ),
                    ),
                  ] else if (pickedImage == null) ...[
                    SizedBox(
                      width: size.width * Constant.d_4 +
                          Constant.cartBottomCheckoutHeight,
                      height: size.width * Constant.d_4,
                      child: DottedBorder(
                        color: ManagerColors.blueColor,
                        radius: Radius.circular(ManagerRadius.r12),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: ManagerSize.s100,
                                color: ManagerColors.blueColor,
                              ),
                              TextButton(
                                onPressed: () {
                                  localImagePicker();
                                },
                                child:
                                    const Text(ManagerStrings.pickProductImage),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(ManagerRadius.r12),
                      child: Image.file(
                        File(
                          pickedImage!.path,
                        ),
                        // width: size.width * 0.7,
                        height: size.width * Constant.d_5,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                  if (pickedImage != null && productNetworkImage != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            localImagePicker();
                          },
                          child: const Text(ManagerStrings.pickAnotherImage),
                        ),
                        TextButton(
                          onPressed: () {
                            removePickedImage();
                          },
                          child: const Text(
                            ManagerStrings.removeImage,
                            style: TextStyle(color: ManagerColors.redColor),
                          ),
                        ),
                      ],
                    )
                  ],
                  SizedBox(
                    height: ManagerHeight.h25,
                  ),
                  DropdownButton<String>(
                    hint: Text(categoryValue ?? ManagerStrings.selectCategory),
                    value: categoryValue,
                    items: Constant.categoriesDropDownList,
                    onChanged: (String? value) {
                      categoryValue = value;
                    },
                  ),
                  SizedBox(
                    height: ManagerHeight.h25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ManagerWidth.w20, vertical: 0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: titleController,
                            key: const ValueKey('Title'),
                            maxLength: 80,
                            minLines: 1,
                            maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'Product Title',
                            ),
                            validator: (value) {
                              return FailedValidator.uploadProdTexts(
                                value: value,
                                toBeReturnedString:
                                    "Please enter a valid title",
                              );
                            },
                          ),
                          SizedBox(
                            height: ManagerHeight.h10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  controller: priceController,
                                  key: const ValueKey('Price \$'),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^(\d+)?\.?\d{0,2}'),
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                      hintText: 'Price',
                                      prefix: SubtitleTextWidget(
                                        label: "\$ ",
                                        color: ManagerColors.blueColor,
                                        fontSize: ManagerFontSize.s18,
                                      )),
                                  validator: (value) {
                                    return FailedValidator.uploadProdTexts(
                                      value: value,
                                      toBeReturnedString: "Price is missing",
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: ManagerWidth.w10,
                              ),
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: quantityController,
                                  keyboardType: TextInputType.number,
                                  key: const ValueKey('Quantity'),
                                  decoration: const InputDecoration(
                                    hintText: 'Qty',
                                  ),
                                  validator: (value) {
                                    return FailedValidator.uploadProdTexts(
                                      value: value,
                                      toBeReturnedString: "Quantity is missed",
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ManagerHeight.h15,
                          ),
                          TextFormField(
                            key: const ValueKey('Description'),
                            controller: descriptionController,
                            minLines: 5,
                            maxLines: 8,
                            maxLength: 1000,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              hintText: 'Product description',
                            ),
                            validator: (value) {
                              return FailedValidator.uploadProdTexts(
                                value: value,
                                toBeReturnedString: "Description is missed",
                              );
                            },
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kBottomNavigationBarHeight +
                        Constant.cartBottomCheckoutHeight,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
