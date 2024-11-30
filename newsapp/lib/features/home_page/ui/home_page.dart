//create a flutter layout for the home page of new application
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/home_page/bloc/home_bloc.dart';
import 'package:newsapp/features/home_page/extra_features/language.dart';
import 'package:newsapp/features/home_page/widgets/news_tile.dart';

import '../extra_features/category.dart';
import '../widgets/home_detailed_news.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeFetchNewsEvent(language: language, phrases: phrases, category: category));
    super.initState();
  }


  HomeBloc homeBloc = HomeBloc();
  String language = 'en';
  String phrases ='World';
 String category = 'Technology';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,

        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is HomeLoadedState) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: const Text('News App',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SearchBar(

                            leading: InkWell(
                                onTap: () {
                                  homeBloc.add(HomeFetchNewsEvent(language: language, phrases: phrases, category: category));
                                },splashColor: Colors.green,
                                child: const Icon(Icons.search, color: Colors.black, size: 30.0,),),
                            hintText: 'Search',
                            onChanged: (value) {
                              phrases = value;
                              },

                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10.0),



                        hint: const Text('Select Language'),
                        elevation: 3,
                        value: language,
                        dropdownColor: Colors.teal,
                          style: const TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.teal, // Icon color
                            size: 20, // Slightly larger icon
                          ),
                          items: Language.li.map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      ).toList()
                      , onChanged: (value){
                            language = value.toString();
                            homeBloc.add(HomeFetchNewsEvent(language: language, phrases: phrases, category: category));
                          }


                         ),

                    ),
                    // DropdownButton(
                    //     hint: const Text('Select Category'),
                    //     elevation: 3,
                    //     value: category,
                    //     dropdownColor: Colors.teal,
                    //     style: const TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
                    //     icon: const Icon(
                    //       Icons.arrow_drop_down,
                    //       color: Colors.teal, // Icon color
                    //       size: 20, // Slightly larger icon
                    //     ),
                    //     items: Category.li.map(
                    //           (e) => DropdownMenuItem(
                    //         value: e,
                    //         child: Text(e),
                    //       ),
                    //     ).toList()
                    //     , onChanged: (value){
                    //   category = value.toString();
                    //   homeBloc.add(HomeFetchNewsEvent(language: language, phrases: phrases, category: category));
                    // }
                    //
                    //
                    // ),

                    Expanded(
                      child: ListView.builder(
                          itemCount: state.news.length,
                          itemBuilder: (context, index) {
                            // if(index == state.news.length-5){
                            //   return const CircularProgressIndicator();
                            // }
                            if (state.news[index].title!="Removed") {
                              return InkWell(
                                onLongPress: () =>
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailedNews(state.news[index]))),

                                  child: NewsTile(state.news[index]));
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ));
          }
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        });
  }
}
