import 'package:africanstraw/constanst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wholesale extends StatelessWidget {
  const Wholesale({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[50],
        title: const Text("Wholesale"),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  Container(
                                      height: 500,
                                      width: 550,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(color: Colors.grey.shade300, width: 1.0), // Top border
                                          left: BorderSide(color: Colors.grey.shade300, width: 10.0), // Left border
                                          right: BorderSide(color: Colors.grey.shade300, width: 1.0), // Right border
                                          bottom: BorderSide(color: Colors.grey.shade300, width: 10.0), // Bottom border
                                        ),
                                        //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                                      ),
                                      child: Image.asset(
                                        "assets/images/afs7.jpg",
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                  Container(
                                    color: Colors.white54,
                                    //height: 500,
                                    width: 550,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            //mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "ASE WHOLESALE POLICIES",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Text(Companydata.wholesale, style: const TextStyle(fontSize: 16),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(
                                width: 1105,
                                child:  Column(
                                  children: [
                                    Align(alignment: Alignment.topLeft,child: Text("1.  Wholesale Eligibility",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("  • ", style: TextStyle(fontSize: 30),),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(" Wholesale pricing is available to businesses, retail stores, online shops, and organizations that wish to resell our products.", style: TextStyle(fontSize: 16)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("  • ", style: TextStyle(fontSize: 30),),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(" To qualify, customers must provide a valid business license or proof of a registered retail entity", style: TextStyle(fontSize: 16)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("2.  Minimum Order Quantity (MOQ)",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              " The minimum wholesale order quantity is 100 baskets per order. Orders may consist of mixed designs and sizes as long as the MOQ is met",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	For custom orders (specific designs, colours, or sizes), the MOQ may vary. Please inquire for further details.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("3.  Pricing and Discounts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	All wholesale prices are provided upon request and are subject to change. ASE offers competitive pricing based on order volume.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("4.  Customization",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	We offer customization of our Bolga baskets to suit your needs. Custom options include specific colours, patterns or sizes. Customization is available on orders of 150 baskets or more.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	For custom orders, a non-refundable deposit of 30% is required at the time of order placement. ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("5.  Payment Terms",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	We accept payments via bank transfer or credit card. All payments must be made in USD, Euros or British Pound Sterling.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	70% payment is required to confirm all wholesale orders, with the remaining 30% due immediately after the shipment has been received.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	For long-term wholesale partners, credit terms can be negotiated based on order history and volume.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("6.  Shipping",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              " Shipping costs are not included in the wholesale prices and will be calculated based on the size, weight, and delivery destination of the order.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              " We offer global shipping, utilizing FOB (Accra) for large quantities via shipping containers, and DHL, FedEx, or Ghana Post for smaller orders. Delivery times vary depending on the destination but typically range from 7 to 21 business days.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "Please note that ASE is not responsible for any customs duties, taxes, or additional fees incurred during international shipping.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("7.  Return Policy",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              " If any baskets arrive damaged, please notify us within 7 days of delivery with photo evidence, and we will replace the damaged goods free of charge.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("8.  Lead Times",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	For in-stock items, orders are processed and shipped within 7-14 business days.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	Custom orders have a lead-time of 4-8 weeks depending on the order volume and complexity of the design.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("9.  Exclusivity",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	Retailers can request exclusivity agreements based on geographic region, that is, your city. Exclusivity agreements will require a minimum order of baskets per year and are subject to renewal based on sales performance. If interested, the MOQ for exclusivity can be discussed.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("10.  Ethical and Sustainable Sourcing",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	ASE is dedicated to ethical production practices that promote both social and environmental responsibility. We work with over 5000 artisans in rural communities in Northern Ghana, offering them more than just fair wages. Our weavers benefit from a flexible work schedule, which allows them to craft the baskets in the comfort of their own homes. This independence enables them to balance weaving with other essential responsibilities, such as farming and taking care of their households.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	By working at their own pace, artisans can manage community duties and family needs without sacrificing their livelihood. Each basket is crafted using sustainably harvested elephant grass by our coops, ensuring our commitment to preserving the environment while supporting local economies.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	We proudly hold Fair for Life and For Life certifications, ensuring the traceability of each basket from artisan to retailer.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Align(alignment: Alignment.topLeft, child: Text("11.  Marketing Support",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	Retailers have access to a library of high-quality images and product descriptions for online and in-store marketing. Additionally, we provide storytelling resources to educate your customers about the artisans and the positive impact their purchases make.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),

                                    Align(alignment: Alignment.topLeft, child: Text("12.  Returns and Cancellations",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	Cancellations must be made within 48 hours of order placement.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	We do not accept returns on wholesale orders unless the products are defective upon arrival. Claims for defective goods must be made within 7 days of receipt, accompanied by photographic proof.",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),Align(alignment: Alignment.topLeft, child: Text("13.  Ethical and Sustainable Sourcing",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Text("  For all wholesale inquiries, please contact:", style: TextStyle(fontSize: 18),),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	Email: africanstrawenterprise@yahoo.com",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	Phone: +233 243 972280/+233 546 768837",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align at the top
                                      children: [
                                        Baseline(
                                          baseline: 20, // Adjust this value to align the dot with the text
                                          baselineType: TextBaseline.alphabetic,
                                          child: Text(
                                            "  • ",
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Baseline(
                                            baseline: 15, // This value should match the baseline of the dot
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              "	Instagram: @asebaskets",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),

                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Divider(),
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(
                                  width: 1105,
                                  child: Text("We look forward to collaborating with you to bring the beauty of handcrafted ASE baskets to your customers, while making a lasting impact on the lives of our artisans.", style: TextStyle(fontSize: 16),)
                              )
                            ],
                          ),
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
