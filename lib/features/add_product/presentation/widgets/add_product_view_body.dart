// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashbord/features/add_product/domain/entities/product_input_entity.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/maneger/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/widgets/image_field.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/widgets/is_featured_chick_box.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/widgets/is_organic_check_box.dart';

import '../../../../core/widgets/custom_text_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expirationMonths, unitAmount, sellingCount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  CustomTextFormField(
                    onSaved: (value) {
                      name = value!;
                    },
                    hintText: 'Product Name',
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      price = num.parse(value!);
                    },
                    hintText: 'Product Price',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      expirationMonths = num.parse(value!);
                    },
                    hintText: 'Expiration Months',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      unitAmount = num.parse(value!);
                    },
                    hintText: 'Unit Amont',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      code = value!.toLowerCase();
                    },
                    hintText: 'Product Code',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      description = value!;
                    },
                    hintText: 'Product Description',
                    textInputType: TextInputType.text,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  IsFeaturedCheckBox(
                    onChanged: (value) {
                      isFeatured = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  IsOrganicCheckBox(
                    onChanged: (value) {
                      isOrganic = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ImageField(
                    onFileChanged: (value) {
                      image = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    text: 'Add Product',
                    onPressed: () {
                      if (image != null) {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          ProductInputEntity input = ProductInputEntity(
                            name: name,
                            code: code,
                            description: description,
                            price: price,
                            isFeatured: isFeatured,
                            image: image!,
                            expirationsMonths: 0,
                            isOrganic: false,
                            numberOfCalories: 0,
                            unitAmount: 0,
                            reviews: [],
                          );
                          context.read<AddProductCubit>().addProduct(input);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      } else {
                        snackBarMessage(context);
                      }
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }

  void snackBarMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image'),
      ),
    );
  }
}
