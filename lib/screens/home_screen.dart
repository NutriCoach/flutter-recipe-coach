import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_coach/models/recipe.dart';
import 'package:flutter_recipe_coach/screens/detail_screen.dart';
import 'package:flutter_recipe_coach/widgets/background_page.dart';
import 'package:flutter_recipe_coach/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  final List<Recipe> recipes = [
    Recipe(
      imageUrl:
          "https://ichef.bbci.co.uk/food/ic/food_16x9_448/recipes/classic_cornish_pasty_67037_16x9.jpg",
      title: "Classic Cornish pasty",
      ratting: 5,
    ),
    Recipe(
      imageUrl:
          "https://blog-paleohacks.s3.amazonaws.com/wp-content/uploads/2014/09/SCHEMA-PHOTO-paleo-fruit-salad.jpg?x16148",
      title: "Fruit Salad",
      ratting: 3.5,
    ),
    Recipe(
      imageUrl:
          "https://unareceta.com/wp-content/uploads/2017/09/receta-de-chicharro%CC%81n-de-pescado-con-cerveza-640x458.jpg",
      title: "Chicharron de pescado",
      ratting: 4.5,
    ),
    Recipe(
      imageUrl:
          "https://www.lavanguardia.com/r/GODO/LV/p6/WebSite/2019/08/07/Recortada/img_mtdiestra_20190807-134219_imagenes_lv_getty_istock-1161345311-683-kkFH-U463932658017QOB-992x558@LaVanguardia-Web.jpg",
      title: "Ceviche",
      ratting: 4.5,
    ),
    Recipe(
      imageUrl:
          "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/one_pot_chorizo_and_15611_16x9.jpg",
      title: "Pasta",
      ratting: 4.6,
    ),
    Recipe(
      imageUrl:
          "https://images-gmi-pmc.edge-generalmills.com/3007ccc3-f7a9-46ee-99c2-67118ec7b07d.jpg",
      title: "Vegetables Salad",
      ratting: 2.5,
    ),
  ];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Builder(
          builder: (_) => BodyBg(
            child: Stack(
              children: <Widget>[
                SafeArea(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Hot Receipes",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                            CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(
                                  "https://i.pinimg.com/originals/16/ed/00/16ed00c0e313d7acce0ef15654c44cb1.jpg"),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 72),
                          itemCount: widget.recipes.length,
                          itemBuilder: (context, index) => RecipeCard(
                            widget.recipes[index],
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      RecipePage(widget.recipes[index])));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
