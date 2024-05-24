import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_2/models/recipe.dart';
import 'package:recipe_app_2/pages/recipe_detail_page.dart';
import 'package:recipe_app_2/pages/random_page.dart';

class DiscoverPage extends StatefulWidget {
  final List<Recipe> recipeList;
  const DiscoverPage({super.key, required this.recipeList});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<String> categories = ['Soups', 'Main Courses', 'Snacks', 'Deserts'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  Foodie  ',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.white, size: 25),
        
      ),


      //SCROLLVIEW STARTS HERE IN THIS COLUMNS

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 250),
              items: widget.recipeList.map((recipe) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetailPage(recipe: recipe)),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(0),
                        ),

                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                recipe.image ?? '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recipe.name ?? '',
                                style: GoogleFonts.libreBaskerville(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green.shade300.withOpacity(0.8),
                ),
                child: Center(
                  child: Text(
                    'Categories',
                    style: GoogleFonts.libreBaskerville(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  Color buttonColor;
                  switch (index) {
                    case 0:
                      buttonColor = Colors.orange.shade500;
                      break;
                    case 1:
                      buttonColor = Colors.red.shade700;
                      break;
                    case 2:
                      buttonColor = Colors.blue.shade400;
                      break;
                    default:
                      buttonColor = Colors.purple.shade400;
                      break;
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5 ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 15),
                        backgroundColor: buttonColor,
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RandomPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/take_me_random.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.red.shade400,
        animationDuration: Duration(milliseconds: 250),
        onTap: (index) {},
        items: [
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
