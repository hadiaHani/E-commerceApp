import 'package:ecommerce_admin_app_firebase/core/resources/manager_strings.dart';
import 'package:ecommerce_admin_app_firebase/core/widgets/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterProvider() {
    initState();
  }
  XFile? pickedImage;
  Future<void> localImagePicker(context) async {
    final ImagePicker picker = ImagePicker();
    await imagePickerDialog(
      context: context,
      cameraFCT: () async {
        pickedImage = await picker.pickImage(source: ImageSource.camera);
        notifyListeners();
      },
      galleryFCT: () async {
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        notifyListeners();
      },
      removeFCT: () {
        pickedImage = null;
        notifyListeners();
      },
    );
  }

  late final TextEditingController nameController,
      emailController,
      passwordController,
      confirmPasswordController;
  late final FocusNode nameFocusNode,
      emailFocusNode,
      passwordFocusNode,
      confirmPasswordFocusNode;
  late final formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool obscureTextConfirmPass = true;

  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    // Focus Nodes
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    // Focus Nodes
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void isobscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void isobscureConfirmPassText() {
    obscureTextConfirmPass = !obscureTextConfirmPass;
    notifyListeners();
  }

  Future<void> registerFct(context) async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (pickedImage == null) {
      showErrorORWarningDialog(
          context: context, subtitle: ManagerStrings.pickImage, fct: () {});
    }
    if (isValid) {}
  }
}
