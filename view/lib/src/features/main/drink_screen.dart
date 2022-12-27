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
  Widget builder(
      BuildContext context, DrinkViewModel viewModel, Widget? child) {
    return Scaffold(body: _buildBody(context, viewModel));
  }

  Widget _buildBody(BuildContext context, DrinkViewModel viewModel) {
    Size size = MediaQuery.of(context).size;

    List<String> ingredients = <String>[
      model.Ingredient1,
      model.Ingredient2,
      model.Ingredient3,
      model.Ingredient4,
      model.Ingredient5,
      model.Ingredient6,
      model.Ingredient7,
      model.Ingredient8,
      model.Ingredient9
    ];
    ingredients.removeWhere((value) => value == "");

    return Center(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: size.width,
          child: CachedNetworkImage(
              placeholder: (context, url) => const LinearProgressIndicator(),
              imageUrl: model.DrinkThumbnail),
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: size.width * 0.3,
            child: Text(
              AppStrings.cocktailName,
              style: TextStyle(
                  color: Color.fromARGB(255, 91, 15, 15),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
            width: size.width * 0.7,
            padding: const EdgeInsets.all(12),
            child: Text(
              model.Name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ]),
        Row(children: [
          Container(
            width: size.width * 0.3,
            padding: const EdgeInsets.all(12),
            child: Text(
              AppStrings.cocktailCategory,
              style: TextStyle(
                  color: Color.fromARGB(255, 91, 15, 15),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
            width: size.width * 0.7,
            padding: const EdgeInsets.all(12),
            child: Text(
              model.Category,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ]),
        Row(children: [
          Container(
            width: size.width * 0.3,
            padding: const EdgeInsets.all(12),
            child: Text(
              AppStrings.cocktailIngredients,
              style: TextStyle(
                  color: Color.fromARGB(255, 91, 15, 15),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(12),
                  width: size.width * 0.7,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: ingredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          '${ingredients[index]}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        );
                      }))),
        ]),
        Row(children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              AppStrings.cocktailInstruction,
              style: TextStyle(
                  color: Color.fromARGB(255, 91, 15, 15),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            width: size.width * 0.7,
            child: Text(
              model.Instructions,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ]),
      ],
    )));
  }

  @override
  DrinkViewModel viewModelBuilder(BuildContext context) =>
      locator<DrinkViewModel>();
}
