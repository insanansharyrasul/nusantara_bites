import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantara_bites/controller/home_controller.dart';
import 'package:nusantara_bites/detail_screen.dart';
import 'package:nusantara_bites/web.dart';
import 'models/makanan.dart';

class MainResponsive extends StatelessWidget {
  const MainResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const MainScreen();
      } else if (constraints.maxWidth <= 1200) {
        return const MainWeb(gridTotal: 4);
      } else {
        return const MainWeb(gridTotal: 5);
      }
    });
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String kategoriPulau = "0";
  void updateSelectedPulau(String newKategori) {
    setState(() {
      kategoriPulau = newKategori;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8.0,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Lestarikan makanan\ntradisional,",
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "di Indonesia tercinta!",
                                style: GoogleFonts.lato(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset(
                          'assets/nusantara_bites.svg',
                          fit: BoxFit.contain,
                          height: 100,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1.5,
                            onPageChanged: (index, _) {
                              controller.updatePageIndicator(index);
                            },
                          ),
                          items: [
                            MiniPoster(
                              imageUrl: 'images/banners/pempek.png',
                              foods: foods
                                  .firstWhere((food) => food.name == "Pempek"),
                            ),
                            MiniPoster(
                              imageUrl: 'images/banners/rendang.png',
                              foods: foods
                                  .firstWhere((food) => food.name == "Rendang"),
                            ),
                            MiniPoster(
                              imageUrl: 'images/banners/bika_ambon.png',
                              foods: foods.firstWhere(
                                  (food) => food.name == "Bika Ambon"),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < 3; i++)
                              Container(
                                width: 10,
                                height: 5,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color:
                                        controller.carouselCurrentIndex.value ==
                                                i
                                            ? Colors.orange.shade700
                                            : Colors.grey),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Island Category",
                      style: GoogleFonts.lato(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: SizedBox(
                      height: 48,
                      child: ListProvinsi(kategori: updateSelectedPulau),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Builder(
                    builder: (context) {
                      if (kategoriPulau == "0") {
                        return ListMakananButton(
                          kategoriPulau: kategoriPulau,
                          totalGridCount: 2,
                        );
                      }
                      return ListMakananButton(
                        kategoriPulau: kategoriPulau,
                        totalGridCount: 2,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListMakananButton extends StatelessWidget {
  final int totalGridCount;
  const ListMakananButton(
      {super.key, required this.kategoriPulau, required this.totalGridCount});

  final String kategoriPulau;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: totalGridCount),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: kategoriPulau == "0"
          ? foods.length
          : foods
              .asMap()
              .entries
              .where(
                  (entry) => entry.value.placeOfOrigin.pulau == kategoriPulau)
              .map((entry) => entry.key)
              .toList()
              .length,
      itemBuilder: (context, index) {
        final TraditionalFood food = foods[kategoriPulau == "0"
            ? index
            : foods
                .asMap()
                .entries
                .where(
                    (entry) => entry.value.placeOfOrigin.pulau == kategoriPulau)
                .map((entry) => entry.key)
                .toList()[index]];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(
                        foods: foods
                            .firstWhere((entry) => entry.name == food.name));
                  }));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(32.0),
                            child: Image.asset(food.imageLocation),
                          ),
                          Text(
                            food.name,
                            style: GoogleFonts.montserrat(fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            food.placeOfOrigin.pulau,
                            style: GoogleFonts.montserrat(fontSize: 10.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MiniPoster extends StatelessWidget {
  final String imageUrl;
  final TraditionalFood foods;
  const MiniPoster({super.key, required this.imageUrl, required this.foods});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(foods: foods);
        }));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.0),
        child: Image.asset(
          imageUrl,
        ),
      ),
    );
  }
}

class ListProvinsi extends StatefulWidget {
  final Function(String) kategori;
  const ListProvinsi({super.key, required this.kategori});

  @override
  State<ListProvinsi> createState() => _ListProvinsiState();
}

class _ListProvinsiState extends State<ListProvinsi> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listPulau.length,
      itemBuilder: (context, index) {
        final Kategori makanan = listPulau[index];
        final isSelected = selected == index;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected = index == selected ? -1 : index;
              });
              widget.kategori(index == selected ? makanan.pulau : "0");
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isSelected
                      ? Colors.orange.shade700
                      : Colors.grey.shade800),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                makanan.pulau,
                style: GoogleFonts.lato(
                  color: isSelected ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
