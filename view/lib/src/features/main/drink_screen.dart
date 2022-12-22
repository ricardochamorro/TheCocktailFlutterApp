import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core/core_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:view/src/common/constants/app_strings.dart';
import 'package:view/src/di/locator.dart';
import 'package:view/src/features/main/drink_view_model.dart';

class DrinkScreen extends CoreScreen<DrinkViewModel> {
  final DrinkModel model;

  DrinkScreen({required this.model});

  @override
  Widget builder(BuildContext context, DrinkViewModel viewModel, Widget? child) {
    return Scaffold(
        body: _buildBody(context, viewModel));
  }

  Widget _buildBody(BuildContext context, DrinkViewModel viewModel) {

      Size size = MediaQuery.of(context).size;

      return
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: size.width,
                child: CachedNetworkImage(
                    placeholder: (context, url) =>
                    const LinearProgressIndicator(),
                    imageUrl: model.DrinkThumbnail),
            ),
            Container(
              width: size.width,
              child:Text(
                model.Name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: size.width,
              child:Text(
                model.Category,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: size.width,
              child:Text(
                model.Ingredient1,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
    }

  @override
  DrinkViewModel viewModelBuilder(BuildContext context) =>
      locator<DrinkViewModel>();
}