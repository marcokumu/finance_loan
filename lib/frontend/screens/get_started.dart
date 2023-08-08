import 'package:finance_loan/frontend/screens/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GetStartedPage extends StatelessWidget {
  final List<Map<String, String>> carouselItems = [
    {
      'image': 'assets/images/finances.png',
      'heading': 'Welcome to our app!',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non erat eu enim ultricies condimentum.',
    },
    {
      'image': 'assets/images/calendar.png',
      'heading': 'Explore the features',
      'description':
          'Vivamus non erat eu enim ultricies condimentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'image': 'assets/images/track.png',
      'heading': 'Get started now!',
      'description':
          'Pellentesque bibendum nibh nec quam venenatis. Vivamus non erat eu enim ultricies condimentum.',
    },
  ];

  GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.grey.withOpacity(0.6),
          title: const Text('LifeTrackr'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.6,
                  autoPlay: true,
                  autoPlayInterval: const Duration(milliseconds: 2000),
                  autoPlayAnimationDuration: const Duration(milliseconds: 200),
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                ),
                items: carouselItems.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              item['image']!,
                              height: 200,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              item['heading']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                item['description']!,
                                textAlign: TextAlign.center,
                                // style: Theme.of(context)
                                //     .textTheme
                                //     .bodyLarge!
                                //     .copyWith(
                                //       fontSize: 16,
                                //       // color: Colors.grey,
                                //     ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: ElevatedButton(
                onPressed: () {
                  // Handle the privacy policy and terms and conditions button tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  );
                },
                child: const Text(
                  'Privacy policy & terms and conditions',
                  style: TextStyle(
                    fontSize: 16,
                    // color: Colors.green,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(38, 10, 38, 10),
              child: ElevatedButton(
                onPressed: () {
                  // Handle the 'Get started' button tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  );
                },
                child: const Text(
                  'Get Started',
                  // style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
