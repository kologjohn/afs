import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReturnPolicy extends StatelessWidget {
  const ReturnPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[50],
        title: const Text("Our Return Policy"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 80),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: 900,
                              child:  const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50),
                                  Text("At African Straw Enterprise Ltd (ASE), we are committed to ensuring your complete satisfaction with our handcrafted woven baskets. If for any reason you are not entirely happy with your purchase, we offer a hassle-free return policy to make your experience as smooth as possible.", style: TextStyle(fontSize: 16),),
                                  SizedBox(height: 8),
                                  Text("Please do not hesitate to contact us if there is an issue with your order.", style: TextStyle(fontSize: 16),),
                                  SizedBox(height: 12),
                                  Text(
                                    "Eligibility for Returns",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("If the customer receives a wrong basket, (different from what you ordered) or a defected one, the customer must ensure the steps below are followed to initiate a refund or reorder.", style: TextStyle(fontSize: 16),),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text(" Return Window: The customer must notify us within 3 days from the date of delivery.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text(" Condition: The customer must provide picture proof of the condition of the basket(s) indicating the defect(s) via high quality photos. Baskets must be returned in the condition they were received with their tag attached.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text(" Proof of Purchase: Please include your receipt or proof of purchase with your return.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "How to Initiate a Return",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  1. ", style: TextStyle(fontSize: 16),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Contact Us: Reach out to our customer service team at africanstrawenterprise@gmail.com or 0546768837/03820-97421/0243972280 to request a return. Provide your order number and reason for the return.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  2. ", style: TextStyle(fontSize: 16),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text("	Return Authorization: Our team will provide you with a Return Authorization Number (RAN) and detailed return instructions.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  3. ", style: TextStyle(fontSize: 16),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text("	Prepare Your Return: Securely pack the basket in their original packaging. Include the receipt and the RAN inside the package.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  4. ", style: TextStyle(fontSize: 16),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text("	Ship Your Return: ASE will cover the cost of return shipping. We will provide you with a prepaid shipping label to send your package back to us.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Refunds",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Check Your Account: If you have not received a refund yet, first check your bank account again.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Contact Your Bank: There is often a processing time before a refund is posted.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Further Assistance: If you have done all of this and still have not received your refund, please contact us at africanstrawenterprise@gmail.com.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Late or Missing Refunds",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Processing Time: Once your return is received and inspected, we will notify you via email regarding the approval of your refund", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Approved Refunds: If approved, your refund will be processed and a credit will be applied to your original method of payment within 10 business days.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Partial Refunds: Partial refunds may be issued for items returned in non-original condition, damaged, or with missing parts not due to our error.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Important Note on Duties and Taxes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("Customers are responsible for covering any duties or taxes imposed by their country on imported goods. Please check your local customs regulations for more information", style: TextStyle(fontSize: 16),),
                                  SizedBox(height: 12),
                                  Text(
                                    "Refunds Are Not Available For",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Notifying us after 3 Days", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(" Damaged Items Due to Misuse: Items that are damaged due to improper use or mishandling by the customer.", style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Customer Support",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text("For any questions or assistance with your return, please contact our customer service team:", style: TextStyle(fontSize: 16),),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text(" Email: africanstrawenterprise@gmail.com", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text(" Phone: +233546768837/03820-97421/+233243972280", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("  • ", style: TextStyle(fontSize: 30),),
                                      Expanded(
                                        child: Text(" Hours: Monday to Friday, 9:00 AM - 5:00 PM (GMT)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                      Expanded(child: Text("Thank you for choosing African Straw Enterprise Ltd. Your satisfaction is our top priority!", style: TextStyle(fontSize: 16),)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
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
