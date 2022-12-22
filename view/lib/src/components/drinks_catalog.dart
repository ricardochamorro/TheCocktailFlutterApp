import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:view/src/common/constants/constants.dart';
import 'package:view/src/widgets/network_bound_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrinksCatalog<T, Q> extends StatelessWidget {
  final Color color, textColor;
  final IconData icon;
  final String title;
  final readOnly;
  final Stream<Resource<List<T>?>> stream;
  void Function(Q) onClick;
  final Axis scrollDirection;

  DrinksCatalog(
      {Key? key,
      this.color = RCH_PrimaryColor,
      this.textColor = Colors.white,
      required this.icon,
      required this.title,
      this.readOnly,
      required this.stream,
      required this.onClick,
      required this.scrollDirection})
      : super();

  @override
  Widget build(BuildContext context) {
    return NetworkBoundWidget<List<T>>(
        stream: stream,
        child: (context, data) => WDrinksCatalog<T, Q>(
              icon: icon,
              title: title,
              readOnly: readOnly,
              data: data,
              onClick: onClick,
              scrollDirection: scrollDirection,
            ));
  }
}

class WDrinksCatalog<T, Q> extends StatefulWidget {
  final Color color, textColor;
  final IconData icon;
  final String title;
  final readOnly;
  final List<T> data;
  var onClick;
  final Axis scrollDirection;

  WDrinksCatalog(
      {Key? key,
      this.color = RCH_PrimaryColor,
      this.textColor = Colors.white,
      required this.icon,
      required this.title,
      this.readOnly,
      required this.data,
      required this.onClick,
      required this.scrollDirection})
      : super(key: key);

  @override
  State<WDrinksCatalog> createState() => _WDrinksCatalogState<T, Q>();
}

class _WDrinksCatalogState<T, Q> extends State<WDrinksCatalog> {
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
    List<DrinkModel> model = widget.data.map((e) => e as DrinkModel).toList();
    Size size = MediaQuery.of(context).size;
    var onClick = widget.onClick;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: size.width * 0.85,
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
            width: size.width * 0.9,
            height: size.width * 1.24,
            child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount: model.length,
              itemBuilder: (context, index) =>
                  _buildListViewItem(context, model[index], onClick),
                  scrollDirection: widget.scrollDirection,
            )),
      ],
    );
  }

  Widget _buildListViewItem(
      BuildContext context, DrinkModel model, var onClick) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, widget) {
          return Card(
            elevation: 8,
            shadowColor: Colors.black,
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 10, color: Colors.white)),
            child: InkWell(
              onTap: () => onClick(model),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: size.width * 0.9,
                      child: Text(
                        model.Name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: size.width * 0.9,
                      child: Text(
                        model.Category,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: size.width * 0.9,
                      color: Colors.blue,
                      child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              const LinearProgressIndicator(),
                          imageUrl: model.DrinkThumbnail),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
