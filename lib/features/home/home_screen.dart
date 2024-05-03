import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tabletap/features/home/widgets/restaurant_card_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TableTap",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withAlpha(240))),
          backgroundColor: Colors.red[700],
          elevation: 4,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 700) {
              return _buildDesktop(context);
            }
            return _buildMobile(context);
          },
        ));
  }

  Widget _buildMobile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                GestureDetector(
                  onTap: () => context.pushNamed('/restaurant'),
                  child: RestaurantCardItem(
                      name: "Papa John's",
                      imageUrl:
                          "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg"),
                ),
                RestaurantCardItem(
                    name: "Papa John's",
                    imageUrl:
                        "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg"),
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
                    GestureDetector(
                      child: RestaurantCardItem(
                          name: "Papa John's",
                          imageUrl:
                              "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg"),
                    ),
                    RestaurantCardItem(
                        name: "Papa John's",
                        imageUrl:
                            "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg"),
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
