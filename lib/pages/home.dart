import 'package:ff/model/Chinese_model.dart';
import 'package:ff/model/burger_model.dart';
import 'package:ff/model/category_model.dart';
import 'package:ff/model/pizza_model.dart';
import 'package:ff/pages/detail_page.dart';
import 'package:ff/services/burger_data.dart';
import 'package:ff/services/category_data.dart';
import 'package:ff/services/chinese_data.dart';
import 'package:ff/services/pizza_data.dart';
import 'package:ff/services/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizzaModel> pizza = [];
  List<BurgerModel> burger = [];
  List<ChineseModel> chinese = [];
  String track = "0";

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    pizza = getPizza();
    burger = getBurger();
    chinese = getChinese();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(left: 20.0, top: 40.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: 50,
                          width: 110,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "Order your favourite food!",
                          style: AppWidget.SimpleTextFieldStyle(),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "images/boy.jpg",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        margin: EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFececf8),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search your fav food item...',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        categories[index].name!,
                        categories[index].image!,
                        index.toString(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                track == "0"
                    ? Expanded(
                        // height: MediaQuery.of(context).size.height / 2,
                        child: GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 0.0),
                            itemCount: pizza.length,
                            itemBuilder: (context, index) {
                              return FoodTile(
                                pizza[index].name!,
                                pizza[index].image!,
                                pizza[index].price!,
                              );
                            }),
                      )
                    : track == "1"
                        ? Expanded(
                            // height: MediaQuery.of(context).size.height / 2,
                            child: GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7,
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 0.0),
                                itemCount: burger.length,
                                itemBuilder: (context, index) {
                                  return FoodTile(
                                    burger[index].name!,
                                    burger[index].image!,
                                    burger[index].price!,
                                  );
                                }),
                          )
                        : track == "2"
                            ? Expanded(
                                // height: MediaQuery.of(context).size.height / 2,
                                child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.7,
                                            mainAxisSpacing: 10.0,
                                            crossAxisSpacing: 0.0),
                                    itemCount: chinese.length,
                                    itemBuilder: (context, index) {
                                      return FoodTile(
                                        chinese[index].name!,
                                        chinese[index].image!,
                                        chinese[index].price!,
                                      );
                                    }),
                              )
                            : Container()
              ],
            )));
  }

  Widget FoodTile(String name, String image, String price) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 120,
            width: 120,
            fit: BoxFit.contain,
          ),
          Text(name, style: AppWidget.boldTextFieldStyle()),
          Text("\$$price", style: AppWidget.priceTextFieldStyle()),
          Spacer(), // Occupe tout l'espace disponible entre "Gauche" et "Droite"
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                image: image,
                                name: name,
                                price: price,
                              )));
                },
                child: Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(19),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget CategoryTile(String name, String image, String categorieIndex) {
    return GestureDetector(
      onTap: () {
        track = categorieIndex;
        setState(() {
          // track = categorieIndex;
        });
      },
      child: track == categorieIndex
          ? Container(
              margin: EdgeInsets.only(right: 18.0, bottom: 10.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        image,
                        height: 35,
                        width: 35,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        name,
                        style: AppWidget.WhiteTextFieldStyle(),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              margin: EdgeInsets.only(right: 18.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    name,
                    style: AppWidget.SimpleTextFieldStyle(),
                  )
                ],
              ),
            ),
    );
  }
}

// class CategoryTile extends StatefulWidget {
//   // const _CategoryTile({super.key});
//   String name, image, categorieIndex;
//   CategoryTile(
//       {required this.name,
//       required this.image,
//       required this.categorieIndex,
//       super.key});
//   @override
//   State<CategoryTile> createState() => _CategoryTileState();
// }

// class _CategoryTileState extends State<CategoryTile> {
// String track = "0";
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         track = widget.categorieIndex;
//         setState(() {
//           // track = widget.categorieIndex.toString();
//         });
//       },
//       child: track == widget.categorieIndex
//           ? Container(
//               padding: EdgeInsets.only(left: 16.0, right: 16.0),
//               margin: EdgeInsets.only(right: 18.0),
//               decoration: BoxDecoration(
//                 color: Color(0xffef2b39),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     widget.image,
//                     height: 35,
//                     width: 35,
//                     fit: BoxFit.cover,
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                     widget.name,
//                     style: AppWidget.WhiteTextFieldStyle(),
//                   )
//                 ],
//               ),
//             )
//           : Container(
//               padding: EdgeInsets.only(left: 16.0, right: 16.0),
//               margin: EdgeInsets.only(right: 18.0),
//               decoration: BoxDecoration(
//                 color: Color(0xFFececf8),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     widget.image,
//                     height: 35,
//                     width: 35,
//                     fit: BoxFit.cover,
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text(
//                     widget.name,
//                     style: AppWidget.SimpleTextFieldStyle(),
//                   )
//                 ],
//               ),
//             ),
//     );
//   }
// }






//1:26:17