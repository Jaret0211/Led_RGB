import 'package:app_lampara/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//colores del widget de la lampara
class DarkContainer extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onTap;
  final String device;
  final String deviceCount;
  final bool itsOn;
  final VoidCallback switchButton;
  final bool isFav;
  final VoidCallback switchFav;
  const DarkContainer({
    Key? key,
    required this.iconAsset,
    required this.onTap,
    required this.device,
    required this.deviceCount,
    required this.itsOn,
    required this.switchButton,
    required this.isFav,
    required this.switchFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(140),
        height: getProportionateScreenHeight(140),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: itsOn
              ? Color.fromARGB(240, 21, 18, 10)
              : Color.fromARGB(255, 68, 67, 63),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(
                      iconAsset,
                      // ignore: deprecated_member_use
                      color: itsOn ? Color.fromRGBO(208, 185, 150, 0.965) : Color.fromRGBO(255, 255, 255, 0.2),
                    ),
                  ),
                  GestureDetector(
                    onTap: switchFav,
                    child:  Icon(
                      Icons.star_rounded,
                      color: isFav ? Color.fromRGBO(208, 185, 150, 0.965):Color.fromARGB(28, 255, 255, 255),
                      // color: Color(0xFF808080),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: itsOn ? Color.fromRGBO(208, 185, 150, 0.965): Color.fromRGBO(255, 255, 255, 0.2),
                        ),
                  ),
                  Text(
                    deviceCount,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color.fromRGBO(238, 237, 235, 0.965),
                        fontSize: 13,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.6),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itsOn ? 'On' : 'Off',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: itsOn ? Color.fromRGBO(208, 185, 150, 0.965) : Color.fromARGB(28, 250, 250, 255),
                        ),
                  ),
                  GestureDetector(
                    onTap: switchButton,
                    child: Container(
                      width: 48,
                      height: 25.6,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: itsOn ?Color.fromRGBO(208, 185, 150, 0.965) : const Color(0xffd6d6d6),
                        border: Border.all(
                          color: Color.fromRGBO(208, 185, 150, 0.965),
                          width: itsOn ? 2 : 0,
                        ),
                      ),
                      child: Row(
                        children: [
                          itsOn ? const Spacer() : const SizedBox(),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
