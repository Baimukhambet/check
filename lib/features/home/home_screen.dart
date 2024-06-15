import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tabletap/features/home/widgets/food_type_tile.dart';
import 'package:tabletap/features/home/widgets/restaurant_card_item.dart';
import 'package:tabletap/repositories/models/restaurant.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tabletap",
              style: TextStyle(
                  // fontFamily: "monospace",
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.white.withAlpha(240))),
          backgroundColor: Color.fromARGB(255, 159, 34, 34),
          elevation: 4,
          centerTitle: true,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 700) {
                return _buildDesktop(context);
              }
              return _buildMobile(context);
            },
          ),
        ));
  }

  Widget _buildMobile(BuildContext context) {
    final restaurant_one = Restaurant(
        name: "Testaurant 1",
        imageUrl:
            "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("Какой настрой на сегодня?",
          //     style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
          // SizedBox(height: 14),
          // ConstrainedBox(
          //   constraints: BoxConstraints(minHeight: 100, maxHeight: 100),
          //   child: ListView(
          //     children: [
          //       FoodTypeTile(
          //           imageUrl:
          //               'https://www.foodandwine.com/thmb/Wd4lBRZz3X_8qBr69UOu2m7I2iw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/classic-cheese-pizza-FT-RECIPE0422-31a2c938fc2546c9a07b7011658cfd05.jpg',
          //           title: 'Pizza')
          //     ],
          //   ),
          // ),
          Text(
            "Наши рестораны",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                    onTap: () => context.pushNamed('/home/restaurant',
                        extra: restaurant_one),
                    child: RestaurantCardItem(restaurant: restaurant_one)),
                // RestaurantCardItem(
                //     name: "Testaurant 2",
                //     imageUrl:
                //         "https://assets.gqindia.com/photos/6213cbed18140d747a9b0a6e/16:9/w_1920,h_1080,c_limit/new%20restaurant%20menus%20in%20Mumbai.jpg"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              Text("Наши рестораны",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView(
                  children: [
                    // GestureDetector(
                    //   child: RestaurantCardItem(
                    //       name: "Papa John's",
                    //       imageUrl:
                    //           "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg"),
                    // ),
                    // RestaurantCardItem(
                    //     name: "Papa John's",
                    //     imageUrl:
                    //         "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
