import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_api/core/components/size_config.dart';
import 'package:pokedex_api/core/constants/color_const.dart';

import 'package:pokedex_api/models/pokeds_models.dart';
import 'package:pokedex_api/services/pokedex_service.dart';
import 'package:pokedex_api/views/info_page.dart';

class PokedexHome extends StatefulWidget {
  const PokedexHome({
    Key? key,
  }) : super(key: key);

  @override
  State<PokedexHome> createState() => _PokedexHomeState();
}

class _PokedexHomeState extends State<PokedexHome> {
  PokemonModel? _pokedexes;
  @override
  void initState() {
    super.initState();
    PokemonService.getAll().then((value) {
      _pokedexes = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset("assets/images/svg/1.png"),
          ),
          SizedBox(
            height: getHeight(30),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 18.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/search",
                    arguments: _pokedexes!,
                  );
                },
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 1.2,
              ),
              // itemCount:

              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(10),
                  ),
                  child: FutureBuilder(
                    future: PokemonService.getAll(),
                    builder: (BuildContext context,
                        AsyncSnapshot<PokemonModel> snap) {
                      if (!snap.hasData) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (snap.hasError) {
                        return const Center(
                          child: Text("Internetda muammo bor."),
                        );
                      } else {
                        var data = snap.data!.pokemon;
                        return InkWell(
                          onTap: () {

                            Navigator.pushNamed(
                              context,
                              "/info",
                              arguments: data![index],
                            );
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 30, bottom: 15),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AllColor.colorhome1cont,
                                        AllColor.colorhome2cont,
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              Positioned(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.03,
                                right: MediaQuery.of(context).size.width * 0.02,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff676767),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      Text(
                                        "#${data![index].num}",
                                        style: const TextStyle(
                                            color: Color(0xffFC7CFF),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.23,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            data[index].name.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width * 0.09,
                                top: -10,
                                child: CachedNetworkImage(
                                  imageUrl: (data[index].img.toString()),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
