import 'package:flutter/material.dart';
import 'package:smartwristband/utilities/appText.dart';

class Tips extends StatefulWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  State<Tips> createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: smallText(
          "Health Tips",
          color: Colors.white,
        ),
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            SizedBox(height: 10),
            _buildbody(
              " Take Asthma Medications as Prescribed",
              "https://www.verywellhealth.com/thmb/bVyV02sJVI5iI66C1pP9eVnksZU=/2125x1411/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-182864139-588fe7535f9b5874ee7afa89.jpg",
              "Long-term asthma medications are designed to prevent symptoms and attacks. You need to take them every day, even if you don’t have symptoms. They’ll ease inflammation in your airways and keep your asthma under control, so it’s less likely to flare up. If side effects bother you, talk to your doctor about switching to another treatment.",
            ),
            SizedBox(height: 10),
            _buildbody(
              "Identify Asthma Triggers",
              "https://wellahealth.files.wordpress.com/2015/04/asthma-triggers.gif",
              "Certain asthma triggers can set off a cascade of asthma symptoms. These include: Air pollution, Allergies, Cold air, A cold or flu virus, Exercise, Sinusitis, Smoke and Fragrances. It’s vital to learn to identify your asthma triggers and take steps to avoid them.",
            ),
            SizedBox(height: 10),
            _buildbody(
              "Stay Away From Allergens",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU4wJCXKZAuiqRDDMhv81MO457eEJavP1AlCuFN4iVpj--WbpETgIj849fYPTpYRaNZ4o&usqp=CAU",
              "If you have allergies and asthma, it’s important to keep your distance from allergens (things you’re allergic to). Allergen exposure can increase the inflammation in your airways for a while, making an attack more likely.",
            ),
            SizedBox(height: 10),
            _buildbody(
              "Avoid Smoke of Any Type",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvEoXyecoHn7tD78Ni9QUfmQaI0Z4JJXtqqw&usqp=CAU",
              "Smoke and asthma are a bad mix. Limit exposure to all sources of smoke, including tobacco, incense, candles, fires, and fireworks. Don’t allow smoking in your home or car, and avoid public places that permit it. If you smoke cigarettes, get help to quit. Smoking always makes asthma worse.",
            ),
            SizedBox(height: 10),
            _buildbody(
              "Consider Immunotherapy Allergy Shots",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0nUYphrIH00VHsrXQ99uuQC44yzmfJqKFQw&usqp=CAU",
              "If your doctor finds that you have allergies, allergy shots (immunotherapy) may help prevent allergy symptoms and keep your asthma from getting worse. With allergy shots, the doctor injects small doses of allergens under your skin on a regular schedule. Over time, your body may get used to the allergen and respond less when you’re exposed. This can help keep your asthma under control.",
            ),
            SizedBox(height: 10),
            _buildbody(
              "Get Your Vaccinations",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXI7OXkshtydyqUZiqVtrSCgZGNC9kAD97RQ&usqp=CAU&reload=on",
              "Get a flu shot every year to protect against the flu virus, which can worsen your asthma for days or weeks. Asthma makes you more likely to have complications from the flu, like pneumonia, and to be hospitalized because of it. Anyone over 19 should get a pneumonia shot (called Pneumovax) once every 5 to 10 years. You also have a higher chance of getting pneumococcal pneumonia, a common type of bacterial pneumonia. And you need a Tdap vaccine to protect you against tetanus, diphtheria, and whooping cough, along with a zoster vaccine to keep you safe from shingles.",
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildbody(String bodytitle, String img, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      smallText(bodytitle),
      Image.network(
        img,
        height: 230,
      ),
      title(text),
    ],
  );
}
