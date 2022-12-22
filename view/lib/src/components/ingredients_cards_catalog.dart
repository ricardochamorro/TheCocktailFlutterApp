import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:view/src/common/constants/constants.dart';
import 'package:view/src/widgets/network_bound_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IngredientsCardCatalog<T> extends StatelessWidget {
  final Color color, textColor;
  final IconData icon;
  final String title;
  final readOnly;
  final Stream<Resource<List<T>?>> stream;

  IngredientsCardCatalog(
      {Key? key,
      this.color = RCH_PrimaryColor,
      this.textColor = Colors.white,
      required this.icon,
      required this.title,
      this.readOnly,
      required this.stream})
      : super();

  @override
  Widget build(BuildContext context) {
    return NetworkBoundWidget<List<T>>(
        stream: stream,
        child: (context, data) => WIngredientsCardCatalog<T>(
              icon: icon,
              title: title,
              readOnly: readOnly,
              data: data,
            ));
  }
}

class WIngredientsCardCatalog<T> extends StatefulWidget {
  final Color color, textColor;
  final IconData icon;
  final String title;
  final readOnly;
  final List<T> data;

  WIngredientsCardCatalog(
      {Key? key,
      this.color = RCH_PrimaryColor,
      this.textColor = Colors.white,
      required this.icon,
      required this.title,
      this.readOnly,
      required this.data})
      : super(key: key);

  @override
  State<WIngredientsCardCatalog> createState() => _WIngredientsCardCatalogState<T>();
}

class _WIngredientsCardCatalogState<T> extends State<WIngredientsCardCatalog> {
  late bool _isSelectedValueSet = false;
  late PageController pageController;

  bool get isSelectedValueSet => _isSelectedValueSet;

  set isSelectedValueSet(bool value) {
    _isSelectedValueSet = value;
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.6);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<IngredientModel> model = widget.data.map((e) => e as IngredientModel).toList();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: size.width * 0.85,
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
            width: size.width * 0.9,
            height: size.width * 1.11,
            child: ListView.builder(
            clipBehavior: Clip.none,
            itemCount: model.length,
            itemBuilder: (context, index) =>
                  _buildListViewItem(context, model[index]),
              scrollDirection: Axis.horizontal,
            )),
      ],
    );
  }

  Widget _buildListViewItem(BuildContext context, IngredientModel model) {
    Size size = MediaQuery.of(context).size;

    return AnimatedBuilder(
        animation: pageController,
        builder: (context, widget) {
          return InkWell(
            onTap: () {
            },
            child: Card(
                elevation: 8,
                shadowColor: Colors.black,
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(side: BorderSide(width: 10, color: Colors.white)),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: size.width * 0.9,
                          child: Text(
                              model.Name,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      Container(
                          width: size.width * 0.9,
                          color: Colors.blue,
                          child: CachedNetworkImage(
                              placeholder: (context, url) =>
                              const LinearProgressIndicator(color: Colors.black),
                              imageUrl:'https://www.thecocktaildb.com/images/ingredients/${model.Name}-Medium.png'),
                        ),
                    ],
                  ),
                ),
                ),
          );
  });
  }}
          /*
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
            Positioned(
              top: size.height * 0.05,
              child: Text(
                model.Category,
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
                width: size.width * 0.8,
                top: size.height * 0.12,
                child:   CachedNetworkImage(
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      imageUrl: model.DrinkThumbnail),
                ),
            Positioned(
                width: size.width * 0.8,
                top: size.height * 0.02,
                child: Text(
                  model.Name,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Positioned(

                child: Container(
                  padding: const EdgeInsets.only(top: 480),
                  width: size.width * 0.9,
                  child: Text(
                    model.Instructions,
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                )),
          ]);
        });
  }
}

  Widget newWHorizontalCatalog(BuildContext context, T data ) {

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
    ));
  }

  Widget HorizontalCatalogWidget() {

    Size size = MediaQuery.of(context).size;

    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          child: Text("Hola"),
          width: 160.0,
          color: Colors.red,
        ),
      ]
    )    ;
  }
  */
