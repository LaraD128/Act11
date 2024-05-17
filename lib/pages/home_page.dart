import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "package:lara/util/recuadros.dart";
import "package:lara/util/botones.dart";
import "package:lara/util/list_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdffee),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff331F1A),
        child: Icon(
          Icons.add_shopping_cart,
          color: Color(0xffffffef),
          size: 32,
        ),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Color(0xffEEDEC9),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home, size: 30, color: Color(0xff55342c)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, size: 30, color: Colors.grey),
                  ),
                ]),
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // AppBar fijo
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Laro",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff331F1A),
                        ),
                      ),
                      Text(
                        " Ropa",
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xfffaffe7),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Color(0xff4D3D37)),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            // Contenido desplazable
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Imagen
                    Container(
                      width: 300,
                      height: 180,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        children: [
                          MyCuadro(img: "assets/images/1.jpg"),
                          MyCuadro(img: "assets/images/2.jpg"),
                          MyCuadro(img: "assets/images/3.jpg"),
                        ],
                      ),
                    ),

                    SizedBox(height: 25),

                    SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Color(0xff4D3D37))),
                    SizedBox(height: 90),

                    // 3 botones
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyBoton(
                              icono: "assets/images/camisa.jpg",
                              botonText: "Camisa"),
                          MyBoton(
                              icono: "assets/images/gorra.jpg",
                              botonText: "Gorra"),
                          MyBoton(
                              icono: "assets/images/short.jpg",
                              botonText: "Short"),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                    // Listas
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          MyListTile(
                            iconoImg: "assets/images/sucursales.jpg",
                            tituloTitulo: "Sucursales",
                            tituloSubtitulo: "Conocelas todas",
                          ),
                          MyListTile(
                            iconoImg: "assets/images/t.jpg",
                            tituloTitulo: "Contactanos",
                            tituloSubtitulo: "Estamos a tu servicio",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
