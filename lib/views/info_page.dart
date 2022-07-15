import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:pokedex_api/core/components/size_config.dart';
import 'package:pokedex_api/core/constants/color_const.dart';
import 'package:pokedex_api/models/pokeds_models.dart';

class InfoPage extends StatefulWidget {
  final Pokemon? pokemon;

  InfoPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  void initState() {
    super.initState();
    // _pokemons = widget.args as List<Pokemon>;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            height: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset("assets/images/svg/1.png"),
          ),
          SizedBox(
            height: getHeight(53),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.keyboard_arrow_left_outlined),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      hintText: "Buscar Pokemon",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/svg/2.png"),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AllColor.colorhome1cont,
                    AllColor.colorhome2cont,
                  ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.03,
                // right: MediaQuery.of(context).size.width * 0.02,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "#${widget.pokemon!.num.toString()}  ",
                        style: const TextStyle(
                          color: Color(0xffFC7CFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      Text(
                        widget.pokemon!.name.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.15,
                bottom: 20,
                child: Image.network(
                  widget.pokemon!.img.toString(),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.7,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Fuego",
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AllColor.colorhome_button1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Volador"),
                  style: ElevatedButton.styleFrom(
                    primary: AllColor.colorhome_button2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                 padding: EdgeInsets.only(
                  top: 20, left: 20,
                  bottom: 20, 
                 ),
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Altura",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                widget.pokemon!.height.toString(),
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                            SizedBox(
                                      height: 10,
                                    ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Peso",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                widget.pokemon!.weight.toString(),
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                            SizedBox(
                                      height: 10,
                                    ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Habilidades",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                "Nar Liamas",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                            
                            ),
                            child: Column(
                         
                              children: const [

                                Text(
                                  "Categoria",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  "LIama",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                             margin: EdgeInsets.only(
                              left: 10
                            ),
                            child: Column(
                              
                              children: const [
                                Text(
                                  "Sexo",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  "unisex",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                    
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Debilidad",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Container(
                        
                              height: 100,
                              width: 110,
                              child: Column(
                             
                                    children: [
                                        SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor: Color(0xff1D8FF8),
                                            radius: 10,
                                          ),
                                          Text(
                                            "Agua",
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(0.6),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                         
                                          
                                          
                                        ],
                                      ),
                                       SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                           const CircleAvatar(
                                        backgroundColor: Color(0xffFBD92A),
                                        radius: 10,
                                      ),
                                       Container(
                                       
                                         child: Text(
                                              "Electricidad",
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.6),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                       ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor: Color(0xffCA9E03),
                                            radius: 10,
                                          ),
                                           Text(
                                            "Roca",
                                            style: TextStyle(
                                              color: Colors.white.withOpacity(0.6),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                            ),
                           
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 0,
                  child: SizedBox(
                    height: 100,
                    width: 200,
                    child: Image.asset("assets/images/svg/3.png"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
