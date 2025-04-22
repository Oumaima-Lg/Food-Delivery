import 'package:ff/services/widget_support.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({super.key});

  String image, name, price;
  DetailPage(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1, totalprice = 0;

  @override
  void initState() {
    totalprice = int.parse(widget.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Image.asset(
                widget.image,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.name,
              style: AppWidget.HeadlineTextFieldStyle(),
            ),
            Text(
              "\$${widget.price}",
              style: AppWidget.priceTextFieldStyle(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                  "We've estabilished that most cheeses will melt when beked atop pizza. But which will not only melt but stretch into those gooey, massy strands that can make pizza eating such a dellightuflly challenging endeavor?"),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Quantity",
              style: AppWidget.SimpleTextFieldStyle(),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    quantity++;
                    totalprice += int.parse(widget.price);
                    setState(() {});
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  quantity.toString(),
                  style: AppWidget.boldTextFieldStyle(),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      quantity--;
                      totalprice -= int.parse(widget.price);
                      setState(() {});
                    }
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        "\$$totalprice",
                        style: AppWidget.boldWhiteTextFieldStyle(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Text(
                        "ORDER NOW",
                        style: AppWidget.WhiteTextFieldStyle(),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


// 2:07;34