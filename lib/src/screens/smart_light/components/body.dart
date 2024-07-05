import 'package:app_lampara/config/size_config.dart';
import 'package:app_lampara/src/screens/home_screen/home_screen.dart';
import 'package:app_lampara/view/led_view.dart';
import 'package:app_lampara/view/smart_light_view_model.dart';
//import 'package:app_lampara/color_picker_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final SmartLightViewModel model;
  const Body({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(1),
                top: getProportionateScreenHeight(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(19),
                      top: getProportionateScreenHeight(7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                       InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(HomeScreen.routeName);
                          },
                          child: const Icon(Icons.arrow_back_outlined,
                          color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)), // Agrega espacio aquí
                        Stack(
                          children: [
                            Text(
                              'Sala de\nestar',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          'Power',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(7),
                        ),
                        Switch.adaptive(
                          inactiveThumbColor: const Color.fromARGB(255, 255, 255, 255),
                          inactiveTrackColor: const Color(0xffd6d6d6),
                          activeColor: Colors.white,
                          activeTrackColor: const Color.fromRGBO(215, 198, 172, 20),
                          value: model.isLightOff,
                          onChanged: (value) {
                            model.lightSwitch(value);
                          },
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20),
                        ),
                        Text(
                          'Lampara',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(7),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(MyHomePage.routeName);
                          },
                          child: Image.asset(
                            'assets/images/lamp.png',
                            height: getProportionateScreenHeight(22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/lamp.png',
                      height: getProportionateScreenHeight(150),
                      width: getProportionateScreenWidth(140),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(110),
                    ),
                  ],
                ),
                if (model.isLightOff)
                  Positioned(
                    top: 205,
                    child: Image.asset(
                      model.lightImage,
                      height: getProportionateScreenHeight(160),
                      width: getProportionateScreenWidth(118),
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                    ),
                  ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Temperatura',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: getProportionateScreenHeight(9),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: ToggleButtons(
                  selectedColor: Colors.white,
                  fillColor: const Color.fromRGBO(215, 198, 172, 20),
                  renderBorder: false,
                  borderRadius: BorderRadius.circular(15),
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                  children: <Widget>[
                    SizedBox(
                      width: getProportionateScreenWidth(115),
                      child: const Text(
                        'Calido',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(115),
                      child: const Text(
                        'Frío',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    model.onToggleTapped(index);
                  },
                  isSelected: model.isSelected,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Intensidad',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    '${model.lightIntensity.toInt()}%',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                    trackHeight: getProportionateScreenHeight(5),
                    thumbColor: const Color.fromARGB(255, 255, 255, 255),
                    activeTrackColor: const Color.fromRGBO(215, 198, 172, 20),
                    inactiveTrackColor: Colors.white,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8)),
                child: Slider(
                  min: 0,
                  max: 100,
                  onChanged: (val) {
                    model.changeLightIntensity(val);
                  },
                  value: model.lightIntensity,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Off',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '100%',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
