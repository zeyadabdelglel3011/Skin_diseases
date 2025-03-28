import 'package:flutter/material.dart';
import 'package:graduation_project/Features/Splash_Screens/presentation/views/entry_screen.dart';
import 'package:graduation_project/constants.dart';

import '../../../data/Models/OnBoardingData.dart';
import '../on_board_content.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  void _nextPage() {
    if (currentIndex < 2) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const EntryScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SafeArea(
        child: Column(

          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                data.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: buildDots(index, context),
                ),
              ),
            ),
            const Spacer(flex: 1),
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return OnboardContent(
                    pic: data[index].pic,
                    title: data[index].title,
                    text: data[index].text,
                  );
                },
              ),
            ),
           // const Spacer(),

            const Spacer(flex: 1),
            SizedBox(
              height: 75,
              child: Padding(
                padding: const EdgeInsets.symmetric( //horizontal: 20
                ),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width-100,
                  color: kprimaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                  onPressed: _nextPage,
                  child:  const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,

                    ),
                  ) ,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDots(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: currentIndex == index ? 100 : 40,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? kprimaryColor
            : const Color(0xff868686).withOpacity(.25),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}



