import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBordingScreen extends StatefulWidget{
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController _pageController;

  bool isLastPage = false;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index){
                    setState(() => isLastPage = index == 2);
                  },
                  itemBuilder:(context, index) => OnBordContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    ...List.generate(
                        demo_data.length,
                            (index) => Padding(padding: EdgeInsets.only(right: 4),
                            child: DotIndicator(isActive: index == _pageIndex),)),
                    const Spacer(),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          shape: const CircleBorder(),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Arrow-Right.svg",
                              color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Container(
        height: isActive ? 12 : 4,
          width: 4,
        decoration: const BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
      ),
    );
  }
}

class Onboard{
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
});
}

final List<Onboard> demo_data = [
  Onboard(
      image: "assets/images/Stretch-bro.png" ,
      title: "adhf akj akdjfe aksjd ajd ajdsa ajks",
      description: "asdhfgasd dfh jksdf  kjsdhf adf adfj adf fkjdfy asdjh s s ashdf a sashf as a sdf eoe shfsd"),

  Onboard(
      image: "assets/images/Weights-amico.png" ,
      title: "adhf akj akdjfe aksjd ajd ajdsa ajks",
      description: "asdhfgasd dfh jksdf  kjsdhf adf adfj adf fkjdfy asdjh s s ashdf a sashf as a sdf eoe shfsd"),

  Onboard(
      image: "assets/images/Workouts.png" ,
      title: "adhf akj akdjfe aksjd ajd ajdsa ajks",
      description: "asdhfgasd dfh jksdf  kjsdhf adf adfj adf fkjdfy asdjh s s ashdf a sashf as a sdf eoe shfsd")
];

class OnBordContent extends StatelessWidget {
  const OnBordContent({Key? key, required this.image, required this.title, required this.description}) : super(key: key);

  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    )));
  }
}
