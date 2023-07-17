import 'package:bootcamp/color/color_theme.dart';
import 'package:bootcamp/screen/homePage.dart';
import 'package:bootcamp/screen/registerPage.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Widget> _pages = [
    OnboardingPage(
      image: 'assets/analyse.png',
      title: 'Analiz',
      description: 'Stupet ile denemelerini analiz edebilir,',
    ),
    OnboardingPage(
      image: 'assets/timer.png',
      title: 'Geri Sayım',
      description: 'Sınav için geri sayımı takip edebilir,',
    ),
    OnboardingPage(
      image: 'assets/todo.png',
      title: 'To-do ve Konu Takibi',
      description: 'Konu takibi yaparken, to-do listeni de oluşturabilirsin',
    ),
    OnboardingPage(
      image: 'assets/maskot.png',
      title: 'Stupet',
      description: "Artık Stupet ile YKS'ye hazırlanmak daha kolay",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme().backgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 50.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 20.0,
            child: FloatingActionButton(
              backgroundColor: ColorTheme().khmerCurry,
              hoverColor: ColorTheme().antiqueWhite,
              onPressed: () {
                if (_currentPage < _pages.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInCirc,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                }
              },
              child: _currentPage < _pages.length - 1
                  ? Icon(Icons.arrow_forward_ios)
                  : Icon(Icons.done),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(
        i == _currentPage
            ? _buildPageIndicatorItem(true)
            : _buildPageIndicatorItem(false),
      );
    }
    return indicators;
  }

  Widget _buildPageIndicatorItem(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? ColorTheme().khmerCurry : ColorTheme().grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 200.0,
          ),
          SizedBox(height: 40.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: ColorTheme().grey,
            ),
          ),
        ],
      ),
    );
  }
}
