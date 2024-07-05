import 'package:app_lampara/config/size_config.dart';
import 'package:app_lampara/provider/base_view.dart';
import 'package:app_lampara/view/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
        onModelReady: (model) => {
              model.generateRandomNumber(),
            },
        builder: (context, model, child) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: getProportionateScreenHeight(60),
                elevation: 0,
                iconTheme: const IconThemeData(color: Color.fromARGB(255, 249, 249, 249)),
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(
                      4,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Smart Home',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(30),
                      ),
                      
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelColor: const Color.fromRGBO(28, 27, 25, 100),
                      indicatorColor: Color.fromRGBO(215,198,172, 20),
                      tabs: [
                        Tab(
                          child: Text(
                            'Sala',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Recamara',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Cocina',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ]),
                  preferredSize: Size.fromHeight(
                    getProportionateScreenHeight(
                      35,
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Body(
                    model: model,
                  ),
                  Center(
                    child: Text(
                      'Proximamente',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                   Center(
                    child: Text('Proximamente',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
