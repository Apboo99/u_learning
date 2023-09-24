import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/color.dart';
import '../../widgets/buildOnBoarding.dart';
import 'bloc/welcome_bloc.dart';
import 'bloc/welcome_state.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Stack(
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (indexOfPageView) {
                    state.page = indexOfPageView;
                    // this line == SetState>> rebuild pageView
                    context.read<WelcomeBloc>().add(MoveOnBoardingEvent());
                    // BlocProvider.of<WelcomeBloc>(context).add(
                    //   MoveOnBoardingEvent(),
                    // );
                  },
                  physics: const BouncingScrollPhysics(),
                  children: [
                    buildOnBoarding(
                      width: width,
                      height: height,
                      context: context,
                      index: 1,
                      image: 'assets/images/boy.png',
                      title: 'First see learning',
                      subTitle1: "Forget about a for of a paper all",
                      titleOfButton: 'Next',
                      pageController: pageController,
                      subTitle2: 'knowledge in on learning',
                    ),
                    buildOnBoarding(
                      width: width,
                      height: height,
                      context: context,
                      index: 2,
                      image: 'assets/images/man.png',
                      title: 'Connect with everyone',
                      subTitle1: "Always keep on touch with your tutor &",
                      titleOfButton: 'Next',
                      pageController: pageController,
                      subTitle2: "Let's get connected",
                    ),
                    buildOnBoarding(
                      width: width,
                      height: height,
                      context: context,
                      index: 3,
                      image: 'assets/images/reading.png',
                      title: 'Always fascinated learning',
                      subTitle1:
                          "Anywhere, anytime. The time is at our discretion",
                      titleOfButton: 'Get Started',
                      pageController: pageController,
                      subTitle2: 'so study whenever you want',
                    ),
                  ],
                ),
                Positioned(
                  left: width * .1,
                  right: width * .1,
                  bottom: width * .135,
                  child: DotsIndicator(
                    position: state.page.toDouble(),
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      color: AppColors.primaryFourElementText,
                      activeColor: AppColors.primaryElement,
                      size: const Size.square(7),
                      activeSize: const Size(25, 9),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
