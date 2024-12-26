import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nusantara_bites/models/makanan.dart';

class DetailScreen extends StatelessWidget {
  final TraditionalFood foods;
  const DetailScreen({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return MobileDetail(foods: foods);
        } else {
          return WebView(foods: foods);
        }
      },
    );
  }
}

class MobileDetail extends StatelessWidget {
  const MobileDetail({
    super.key,
    required this.foods,
  });

  final TraditionalFood foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(foods.imageLocation),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(90)),
                        child: const Icon(Icons.arrow_back_ios_rounded),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  foods.name,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.location_city, color: Colors.orange),
                      Text(
                        foods.specificPlace,
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.people,
                        color: Colors.orange,
                      ),
                      Text(
                        foods.madeBy,
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                foods.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WebView extends StatelessWidget {
  const WebView({
    super.key,
    required this.foods,
  });

  final TraditionalFood foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 1200,
              width: 900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              foods.imageLocation,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(90)),
                                child: const Icon(Icons.arrow_back_ios_rounded),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foods.name,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.location_city,
                                        color: Colors.orange),
                                  ),
                                  Expanded(
                                    child: Text(
                                      foods.specificPlace,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.people,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Text(
                                    foods.madeBy,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            foods.description,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.montserrat(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
