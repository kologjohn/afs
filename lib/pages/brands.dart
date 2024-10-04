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
                                    Text("At African Straw Enterprise Ltd (ASE), we believe that every product tells a story—a story of tradition, craftsmanship, and community impact. Based in the heart of Northern Ghana, we specialize in producing a variety of handcrafted Bolga baskets, each woven with care and dedication by our talented artisans. Beyond the beauty and functionality of our baskets lies a deeper purpose that drives us: empowering women and transforming communities.", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Text("OUR MISSION: CRAFTING A BETTER FUTURE", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("ASE’s mission is to alleviate poverty in rural communities in West Africa by creating sustainable economic opportunities, particularly for women who are often excluded from formal employment. We collaborate with over 5,000 skilled artisans, most of whom are women, providing them with the platform, training, and resources to transform their traditional weaving skills into a reliable source of income. These women, who skillfully balance their craft with family duties and farming, are the backbone of their local economies. Each basket they create embodies resilience and creativity, reflecting the strength of their communities.", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Text("COMMUNITY IMPACT: BUILDING FUTURES BEYOND BASKETS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 8),
                                    Text("At ASE, we believe in giving back to the communities that support us. Our commitment goes beyond employment—it’s about improving the quality of life. Along with providing fair wages, we implement social interventions in rural areas that lack essential amenities. A key initiative is the construction of boreholes to provide clean, safe water, a necessity in these communities. This effort has significantly improved health and well-being while freeing up time for women and children who once spent hours fetching water from distant sources. By reducing the time spent on these tasks, communities can focus on more productive activities, leading to a positive ripple effect on their development.", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Text("SUSTAINABILITY MEETS EMPOWERMENT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("Each ASE product is more than just a basket or decor item—it’s a testament to sustainable and ethical practices. Our products are crafted from locally sourced elephant grass, harvested responsibly by over 250 members of our cooperatives of grass collectors. We prioritize sustainability at every step, from sourcing materials to production processes. In recognition of our efforts, we are proud to be the only Bolga basket company in West Africa accredited by both Fair for Life and For Life certifications. These certifications ensure that every purchase contributes to fair trade practices and social good, supporting the artisans and their communities.", style: TextStyle(fontSize: 18),),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Text("WHY CHOOSE ASE?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text("When you choose ASE products, you’re not just selecting high-quality, handcrafted items—you’re supporting a mission. You are joining us in our commitment to empower women, uplift communities, and preserve cultural heritage. Our baskets do more than just decorate homes or serve practical purposes—they create measurable change in the lives of our artisans and their families.For retailers, selling ASE baskets means offering more than just beautiful handicrafts. It is about giving your customers the chance to make a meaningful impact. Each purchase enhances the lives of artisans, promotes environmental sustainability, and supports a purpose-driven future. Together, we can weave a brighter and more impactful future for people and the planet.", style: TextStyle(fontSize: 18)),
                                    SizedBox(height: 30),
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Divider(),
                                    ),
                                    Text("Join us in advancing our shared mission to fight global poverty.", style: TextStyle(fontSize: 18),),
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
