import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'model/pokedex.dart';

class PokemonDetail extends StatefulWidget {
  Pokemon pokemon;
  PokemonDetail({this.pokemon});


  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  PaletteGenerator paletteGenerator;
  Color baskinRenk=Colors.transparent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
    PaletteGenerator.fromImageProvider(
        NetworkImage(widget.pokemon.img));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator.dominantColor.color.toString());

      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baskinRenk,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baskinRenk,
        title: Text(
          widget.pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return DikeyBody(context);
        } else
          return YatayBody(context);
      }),
    );
  }

  Widget YatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
              tag: widget.pokemon.img,
              child: Container(
                width: 200,
                child: Image.network(
                  widget.pokemon.img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + widget.pokemon.height,
                  ),
                  Text(
                    "Weight : " + widget.pokemon.weight,
                  ),
                  Text(
                    "Egg : " + widget.pokemon.egg,
                  ),
                  Text(
                    "Spawn Chance : " + widget.pokemon.spawnChance.toString(),
                  ),
                  Text(
                    "Types : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.type
                          .map((tip) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            tip,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()),
                  Text(
                    "Pre Evolution : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.prevEvolution != null
                          ? widget.pokemon.prevEvolution
                          .map((preevolution) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            preevolution.name,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()
                          : [Text("First evolution")]),
                  Text(
                    "Next Evolution : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.nextEvolution != null
                          ? widget.pokemon.nextEvolution
                          .map((evolution) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            evolution.name,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()
                          : [Text("End evolution")]),
                  Text(
                    "Weakness : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.weaknesses != null
                          ? widget.pokemon.weaknesses
                          .map((weakness) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            weakness,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()
                          : [Text("No weakness")]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack DikeyBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 18,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 4,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + widget.pokemon.height,
                  ),
                  Text(
                    "Weight : " + widget.pokemon.weight,
                  ),
                  Text(
                    "Egg : " + widget.pokemon.egg,
                  ),
                  Text(
                    "Spawn Chance : " + widget.pokemon.spawnChance.toString(),
                  ),
                  Text(
                    "Types : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.pokemon.type
                            .map((tip) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  tip,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()),
                  ),
                  Text(
                    "Pre Evolution : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.pokemon.prevEvolution != null
                            ? widget.pokemon.prevEvolution
                                .map((preevolution) => Chip(
                                    backgroundColor: Colors.deepOrange.shade300,
                                    label: Text(
                                      preevolution.name,
                                      style: TextStyle(color: Colors.white),
                                    )))
                                .toList()
                            : [Text("First evolution")]),
                  ),
                  Text(
                    "Next Evolution : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.pokemon.nextEvolution != null
                            ? widget.pokemon.nextEvolution
                                .map((evolution) => Chip(
                                    backgroundColor: Colors.deepOrange.shade300,
                                    label: Text(
                                      evolution.name,
                                      style: TextStyle(color: Colors.white),
                                    )))
                                .toList()
                            : [Text("End evolution")]),
                  ),
                  Text(
                    "Weakness : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.pokemon.weaknesses != null
                            ? widget.pokemon.weaknesses
                                .map((weakness) => Chip(
                                    backgroundColor: Colors.deepOrange.shade300,
                                    label: Text(
                                      weakness,
                                      style: TextStyle(color: Colors.white,fontSize: 12),
                                    )))
                                .toList()
                            : [Text("No weakness")]),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.pokemon.img,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(
                widget.pokemon.img,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }
}
