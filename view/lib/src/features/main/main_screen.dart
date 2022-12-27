/*
import 'package:core/core/core_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:view/src/common/constants/app_strings.dart';
import 'package:view/src/components/drinks_catalog.dart';
import 'package:view/src/components/ingredients_cards_catalog.dart';
import 'package:view/src/di/locator.dart';
import 'package:view/src/features/main/main_view_model.dart';
*/

import 'package:core/core/core_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:view/src/common/constants/app_strings.dart';
import 'package:view/src/common/constants/constants.dart';
import 'package:view/src/components/drinks_catalog.dart';
import 'package:view/src/components/ingredients_cards_catalog.dart';
import '../../di/locator.dart';
import 'main_view_model.dart';

class MainScreen extends CoreScreen<MainViewModel> {
  @override
  Widget builder(BuildContext context, MainViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(title: Text(AppStrings.welcome)),
        body: _buildBody(context, viewModel));
  }

  Widget _buildBody(BuildContext context, MainViewModel viewModel) {
    return Container(
        child: ListView(
      clipBehavior: Clip.none,
      children: [
        Expanded(
            child: Container(
                padding: const EdgeInsets.all(12),
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: alphabet.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DrinksCatalog<DrinkModel, DrinkModel>(
                        icon: Icons.abc,
                        title: '${alphabet[index]}',
                        stream:
                            viewModel.drinkByFirstLetter('${alphabet[index]}'),
                        onClick: viewModel.onClickDrinkCard,
                        scrollDirection: Axis.horizontal,
                      );
                    }))),
      ],
      scrollDirection: Axis.vertical,
    ));
  }

  @override
  MainViewModel viewModelBuilder(BuildContext context) =>
      locator<MainViewModel>();
}
