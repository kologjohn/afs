import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/global.dart';

class ReshapingBasket extends StatelessWidget {
  const ReshapingBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: const Text("Reshaping Baskets"),
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
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "How to Reshape a Flattened Handwoven Basket",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 60
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
                                        "assets/images/reshape1.png",
                                        fit: BoxFit.cover,
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 80),
                              Container(
                                width: 900,
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Text("A. Reshaping Your ASE Basket", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    const Text("Is your basket compressed upon arrival? Don’t worry—reshaping it is simple and takes just a few minutes:", style: TextStyle(fontSize: 18),),
                                    const SizedBox(height: 30),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 15, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "1. ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Initial Reshape: Hold the handle with one hand and use the other to push out the bottom center of the basket. ",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      width: 600,
                                      height: 500,
                                      child: Image.asset("assets/images/reshape2.png", fit: BoxFit.cover,),
                                    ),
                                    const SizedBox(height: 30),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 15, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "2. ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Prepare Water: Fill a bathtub, deep sink, or large container with cool water.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 15, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "3. ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Submerge Carefully: Submerge the basket up to just above the rim, avoiding any leather parts. Alternatively, you can take it outside and spray it with a garden hose, keeping the leather dry.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 15, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "4. ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Soak: Keep the basket in the water for about 60 seconds or a bit longer. Shake off any excess water when you take it out.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 15, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "5. ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Let It Sit: Allow the basket to sit for a few minutes so the straw can absorb the water.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 15, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "6. ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Final Shape: Press the base of the basket against the floor while holding onto the rim to shape it.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 15, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "7. ",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Drying: Let the basket dry undisturbed in a dry place, out of direct sunlight.",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      //width: 600,
                                      child: Wrap(
                                        runSpacing: 8,
                                        spacing: 8,
                                        children: [
                                          Container(
                                            width: 300,
                                            height: 200,
                                            child: Image.asset("assets/images/reshape3.png", fit: BoxFit.cover,),
                                          ),
                                          Container(
                                            width: 300,
                                            height: 200,
                                            child: Image.asset("assets/images/reshape4.png", fit: BoxFit.cover,),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: 600,
                                      height: 300,
                                      child: Image.asset("assets/images/reshape5.png", fit: BoxFit.cover,),
                                    ),
                                    const SizedBox(height: 30),
                                    const Text("Try to reuse the water for watering plants or trees. Note that the dyes on the baskets can fade if exposed to the sun for too long.", style: TextStyle(fontSize: 18),),
                                    const SizedBox(height: 30),
                                    const Row(
                                      children: [
                                        Text("B. Cleaning Your ASE Basket", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Text("To clean your ASE basket, gently scrub any marks with a fine brush and just normal temperature water. Allow it to dry in a well-ventilated area. Avoid long exposure to direct sunlight.", style: TextStyle(fontSize: 18)),
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
