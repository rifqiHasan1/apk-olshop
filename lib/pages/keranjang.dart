import 'package:flutter/material.dart';

class Keranjang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20),
              child: Row(
                children: [
                  Container(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back))),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                      child: Text(
                    "Cart",
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              ),
            ),
          ),
          Container(
            width: 400,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlueAccent,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/free-psd/shopping-bag-mockup_58466-17138.jpg?size=626&ext=jpg&ga=GA1.2.1903224127.1652838851'),
                        fit: BoxFit.cover),
                  ),
                  width: 120,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nike ai..."),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$175",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 420,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("\$350",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            width: 395,
            height: 60,
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    "Make Order",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
