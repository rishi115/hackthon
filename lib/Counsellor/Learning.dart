import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Professional Development"),
        ),
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Disability Rights in Indian Laws"),
                Text("Rights of Persons with Disabilities Act, 2016"),
                Text(
                    "Section 4: Right to Equality, Dignity, and Respect for Integrity"),
                Text(
                    "Persons with disabilities have the right to equality, dignity, and respect for integrity."),
                Text("Section 5(2): Right to Live in the Community"),
                Text(
                    "Persons with disabilities have the right to live in the community."),
                Text(
                    "Sections 6, 7, 8: Protection from Torture, Cruel, Inhuman, or Degrading Treatment"),
                Text(
                    "The Act provides protection to persons with disabilities from being subjected to torture, cruel, inhuman, or degrading treatment."),
                Text("Section 9: Children with Disabilities"),
                Text(
                    "Children with disabilities are not to be separated from their parents."),
                Text(" Section 10: Reproductive Rights"),
                Text(
                    "The Act recognizes the reproductive rights of persons with disabilities."),
                Text("Section 11: Voting Rights"),
                Text(
                    'The Election Commissions are mandated to ensure that persons with disabilities can cast their vote.'),
                Text(
                    "Section 20: Protection Against Discrimination in Employment"),
                Text(
                    "Persons with disabilities have protection against discrimination in employment."),
                Text("Additional Point: Section 15 - Accessibility"),
                Text(
                    "The Act ensures accessibility for persons with disabilities in public buildings, transport, and information and communication technologies, promoting inclusivity and equal access to services."),
                Text("Other Important Legislation"),
                Text("The Mental Healthcare Act, 2017"),
                Text(
                    "The Act addresses the rights and protection of individuals with mental health conditions, emphasizing non-discrimination."),
                Text("National Trust Act, 1999"),
                Text(
                    "Legislation for the welfare and empowerment of individuals with autism, cerebral palsy, mental retardation, etc."),
                Text("Rehabilitation Council of India Act, 1992"),
                Text(
                    "Governs professional training and rehabilitation for persons with disabilities, ensuring standards in education and care.")
              ],
            ),
          ),
        ));
  }
}