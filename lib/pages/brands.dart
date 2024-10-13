import 'package:africanstraw/constanst.dart';
import 'package:flutter/material.dart';


class BrandStory extends StatelessWidget {
  const BrandStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: const Text("ASE BRAND STORY"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 80.0, bottom: 100),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.white54,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  Container(
                                    color: Colors.white54,
                                    height: 500,
                                    width: 700,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "ASE BRAND STORY:",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 60
                                                ),
                                              ),
                                              Text(
                                                  "Empowering Communities Through Tradition and Craftsmanship",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30
                                                ),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      height: 500,
                                      width: 700,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: Colors.white54, width: 10.0), // Top border
                                          left: BorderSide(color: Colors.white54, width: 10.0), // Left border
                                          right: BorderSide(color: Colors.white54, width: 10.0), // Right border
                                          bottom: BorderSide(color: Colors.white54, width: 10.0), // Bottom border
                                        ),
                                      ),
                                      child: Image.asset(
                                        Imagesurls.slide1,
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 80),
                              const SizedBox(
                                width: 1000,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("At African Straw Enterprise Ltd (ASE), we believe that every product tells a story—a story of tradition, craftsmanship, and community impact. Based in Bolgatanga, in Northern Ghana, we specialize in producing handcrafted Bolga baskets each woven with care and dedication by our talented artisans. However, beyond the beauty and functionality of our products, lies a deeper purpose that drives everything we do: empowering women and transforming communities", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Text("OUR MISSION: CRAFTING A BETTER FUTURE", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("ASE’s mission is to alleviate poverty in rural communities by creating sustainable economic opportunities, especially for women who are often excluded from formal employment. We partner with over 5,000 skilled artisans—primarily women—providing them with the platform, training, and resources to develop their traditional weaving skills into a source of steady income. These women, who balance their craft with family duties and farming, are the backbone of our business. Through their hands, each basket becomes a symbol of resilience and creativity.", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Text("COMMUNITY IMPACT: BUILDING FUTURES BEYOND BASKETS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 8),
                                    Text("At ASE, we believe in giving back to the communities that give so much to us. Our commitment extends beyond just providing employment; it is about improving the quality of life. In addition to fair wages, we are dedicated to building infrastructure in these rural areas. By constructing boreholes, we provide access to clean, safe water—a fundamental need for these communities. This initiative has drastically improved health and well-being, freeing up time for women and children that was once spent on fetching water from far distances.", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Text("SUSTAINABILITY MEETS EMPOWERMENT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("Each ASE product is more than just a basket or piece of decor; it is a testament to sustainable and ethical practices. Our products are made from locally sourced elephant grass, grown and harvested in an environmentally responsible manner. From the materials we use to the way we operate, we prioritize sustainability every step of the way. In recognition of this, we are proud to be the only Bolga basket company in West Africa accredited by Fair for Life and For Life, ensuring that every purchase from ASE contributes to fair trade practices and social good.", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Text("TRACEABILITY", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("At African Straw Enterprise (ASE), we take pride in knowing the full journey of each basket we create. Every basket comes with a leather tag that includes the weaver's name, their village, and the date of production. This tag honours the artisan behind the work and allows us to trace each basket back to its origin. Our commitment to transparency ensures that every product carries a story of artisanship and community.", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Text("WHY CHOOSE ASE?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("When you choose ASE products, you are not just choosing high-quality, handcrafted items; you are supporting a movement. You are joining us in our mission to empower women, uplift communities, and preserve cultural heritage. Our baskets do not just decorate homes or serve practical purposes—they create real, measurable change in the lives of our artisans and their families.", style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 4),
                                    Text("For retailers, this means that selling ASE products is more than just stocking beautiful items. It is about giving your customers a chance to make a difference, knowing that with each purchase, they are supporting a business that values people, planet, and purpose. Together, we can weave a brighter future.", style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 30),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Divider(),
                                    ),
                                    Text("Join us in creating a world where tradition meets art, and where every purchase helps communities thrive.", style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
