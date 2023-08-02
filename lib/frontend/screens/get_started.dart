import 'package:finance_loan/frontend/screens/privacy_policy.dart';
import 'package:flutter/cupertino.dart';
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

  GetStartedPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: CupertinoColors.white,
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.systemGrey.withOpacity(0.6),
            middle: Text('LifeTrackr'),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6,
                    autoPlay: true,
                    autoPlayInterval: Duration(milliseconds: 2000),
                    autoPlayAnimationDuration: Duration(milliseconds: 200),
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                  ),
                  items: carouselItems.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item['image']!,
                                height: 200,
                              ),
                              SizedBox(height: 20),
                              Text(
                                item['heading']!,
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .navTitleTextStyle
                                    .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  item['description']!,
                                  textAlign: TextAlign.center,
                                  style: CupertinoTheme.of(context)
                                      .textTheme
                                      .textStyle
                                      .copyWith(
                                        fontSize: 16,
                                        color: CupertinoColors.systemGrey,
                                      ),
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
                child: CupertinoButton(
                  onPressed: () {
                    // Handle the privacy policy and terms and conditions button tap
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PrivacyPolicyPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Privacy policy & terms and conditions',
                    style:
                        CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                              fontSize: 16,
                              color: CupertinoColors.activeGreen,
                            ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(38, 10, 38, 10),
                child: CupertinoButton.filled(
                  onPressed: () {
                    // Handle the 'Get started' button tap

                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PrivacyPolicyPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navTitleTextStyle
                        .copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
