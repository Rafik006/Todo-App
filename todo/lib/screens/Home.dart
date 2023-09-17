import 'package:flutter/material.dart';
import 'package:todo/constants/Colors.dart';
import 'package:todo/widgets/todo_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TdWhite,
        appBar: NavBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              SearchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        "All Todos",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TodoItem()
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Container SearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            prefixIcon: Icon(
              Icons.search,
              color: TdBlack,
              size: 25,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 25, maxWidth: 30),
            hintText: "Search",
            hintStyle: TextStyle(color: TdGrey, fontSize: 18),
            border: InputBorder.none),
      ),
    );
  }

  AppBar NavBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: TdWhite,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: TdBlack,
          ),
          Container(
            width: 40,
            height: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/Rafik.jpg",
                )),
          )
        ],
      ),
      centerTitle: true,
    );
  }
}
