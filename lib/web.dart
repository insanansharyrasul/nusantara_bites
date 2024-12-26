import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantara_bites/controller/home_controller.dart';
import 'package:nusantara_bites/detail_screen.dart';
import 'package:nusantara_bites/models/makanan.dart';

class MainWeb extends StatefulWidget {
  final int gridTotal;
  const MainWeb({super.key, required this.gridTotal});

  @override
  State<MainWeb> createState() => _MainWebState();
}

class _MainWebState extends State<MainWeb> {
  final _scrollController = ScrollController();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                                "Lestarikan makanan tradisional,",
                                style: GoogleFonts.lato(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "di Indonesia tercinta!",
                                style: GoogleFonts.lato(fontSize: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 100,
                          child: SvgPicture.asset(
                            'assets/nusantara_bites.svg',
                            fit: BoxFit.contain,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 650,
                        child: Padding(
                          padding: const EdgeInsets.all(64.0),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 1.5,
                              onPageChanged: (index, _) {
                                controller.updatePageIndicator(index);
                              },
                            ),
                            items: [
                              WebMiniPoster(
                                imageUrl: 'images/banners/pempek.png',
                                foods: foods.firstWhere(
                                    (food) => food.name == "Pempek"),
                              ),
                              WebMiniPoster(
                                imageUrl: 'images/banners/rendang.png',
                                foods: foods.firstWhere(
                                    (food) => food.name == "Rendang"),
                              ),
                              WebMiniPoster(
                                imageUrl: 'images/banners/bika_ambon.png',
                                foods: foods.firstWhere(
                                    (food) => food.name == "Bika Ambon"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < 3; i++)
                              Container(
                                width: 30,
                                height: 10,
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
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 64,
                    child: Scrollbar(
                        interactive: true,
                        controller: _scrollController,
                        child: WebListProvinsi(
                            addController: _scrollController,
                            kategori: updateSelectedPulau)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Builder(
                    builder: (context) {
                      if (kategoriPulau == "0") {
                        return WebListMakanan(
                          kategoriPulau: kategoriPulau,
                          totalGridCount: widget.gridTotal,
                        );
                      }
                      return WebListMakanan(
                        kategoriPulau: kategoriPulau,
                        totalGridCount: widget.gridTotal,
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class WebListMakanan extends StatelessWidget {
  final int totalGridCount;
  const WebListMakanan(
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
                .map(
                  (entry) => entry.key,
                )
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
                            style: GoogleFonts.montserrat(
                              fontSize: MediaQuery.sizeOf(context).width < 800
                                  ? 12
                                  : 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            food.placeOfOrigin.pulau,
                            style: GoogleFonts.montserrat(
                              fontSize: MediaQuery.sizeOf(context).width < 800
                                  ? 10
                                  : 16,
                            ),
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

class WebMiniPoster extends StatelessWidget {
  final String imageUrl;
  final TraditionalFood foods;
  const WebMiniPoster({super.key, required this.imageUrl, required this.foods});

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
          height: 128,
        ),
      ),
    );
  }
}

class WebListProvinsi extends StatefulWidget {
  final Function(String) kategori;
  final ScrollController addController;
  const WebListProvinsi(
      {super.key, required this.kategori, required this.addController});

  @override
  State<WebListProvinsi> createState() => _WebListProvinsiState();
}

class _WebListProvinsiState extends State<WebListProvinsi> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listPulau.length,
      controller: widget.addController,
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.center,
              child: Text(
                makanan.pulau,
                style: GoogleFonts.lato(
                  color: isSelected ? Colors.black : Colors.white,
                  fontSize: 24,
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
