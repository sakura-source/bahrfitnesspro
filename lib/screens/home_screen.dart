import 'package:flutter/material.dart';
import 'package:bahrfitnesspro/widgets/progress_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BahrFitnessPRO Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProgressCard(
                  title: 'Calories Burned',
                  value: '500',
                  unit: 'kcal',
                  color: Colors.blue,
                ),
                ProgressCard(
                  title: 'Steps',
                  value: '10,000',
                  unit: 'steps',
                  color: Colors.orange,
                ),
                ProgressCard(
                  title: 'Workouts',
                  value: '5',
                  unit: 'sessions',
                  color: Colors.green,
                ),
              ],
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: [
              'Stay motivated!',
              'Keep pushing!',
              'You can do it!',
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Center(
                      child: Text(
                        i,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
