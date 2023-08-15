import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeTrackr | Privacy Policy'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Privacy Policy Title
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Effective Date
              Text(
                'Effective Date: Aug 1, 2023',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Introduction
              Text(
                'Welcome to LifeTrackr, a mobile application provided by LifeTrackr. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our App. By accessing or using the App, you agree to the terms of this Privacy Policy.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Information We Collect Section
              Text(
                '1. Information We Collect',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Personal Information
              Text(
                '(a) Personal Information:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- When you create an account, we may collect your name, email address, phone number, and other contact details.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- If you make in-app purchases, we may collect your payment information.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- If you connect your social media accounts, we may collect certain information from those accounts.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

              // Device Information
              Text(
                '(b) Device Information:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- We automatically collect information about your device, including its unique identifier, IP address, operating system, and mobile network information.',
                style: TextStyle(fontSize: 16),
              ),
              // Add more sections of the privacy policy as needed
              SizedBox(height: 20),
              Text(
                ' 2. How We Use Your Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We may use your information to:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Provide you with the App and its features',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Improve the App and develop new features',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Respond to your requests and provide customer support',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Send you technical notices, updates, security alerts, and support and administrative messages',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Communicate with you about products, services, offers, promotions, and events',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Monitor and analyze trends, usage, and activities in connection with the App',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Detect, investigate, and prevent fraudulent transactions and other illegal activities',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Personalize the App and provide advertisements, content, or features that match user profiles or interests',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Link or combine with information we get from others to help understand your needs and provide you with better service',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '3. How We Share Your Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We may share your information with:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Third-party service providers who perform services on our behalf, such as payment processing, data analysis, email delivery, hosting services, customer service, and marketing assistance',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Third parties with whom you allow us to share your information',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Other users of the App',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Third parties in the event of any reorganization, merger, sale, joint venture, assignment, transfer, or other disposition of all or any portion of our business, assets, or stock (including in connection with any bankruptcy or similar proceedings)',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Third parties as required to (i) satisfy any applicable law, regulation, subpoena/court order, legal process, or other government request, (ii) enforce our Terms of Use Agreement, including the investigation of potential violations thereof, (iii) investigate and defend ourselves against any third-party claims or allegations, (iv) protect against harm to the rights, property, or safety of the Company, its users, or the public as required or permitted by law, or (v) detect, prevent, or otherwise address criminal (including fraud or stalking), security, or technical issues',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '4. Third-Party Links',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The App may contain links to third-party websites and applications of interest, including advertisements and external services, that are not affiliated with us. Once you have used these links to leave the App, any information you provide to these third parties is not covered by this Privacy Policy, and we cannot guarantee the safety and privacy of your information. Before visiting and providing any information to any third-party websites, you should inform yourself of the privacy policies and practices (if any) of the third party responsible for that website, and should take those steps necessary to, in your discretion, protect the privacy of your information. We are not responsible for the content or privacy and security practices and policies of any third parties, including other sites, services or applications that may be linked to or from the App.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '5. How Long We Keep Your Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We keep your information only so long as we need it to provide the App to you and fulfill the purposes described in this policy. This is also the case for anyone that we share your information with and who carries out services on our behalf. When we no longer need to use your information and there is no need for us to keep it to comply with our legal or regulatory obligations, we’ll either remove it from our systems or depersonalize it so that we can\'t identify you.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '6. Security',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We take reasonable steps to protect the personal information we receive from you from loss, misuse, and unauthorized access, disclosure, alteration, and destruction. Please understand, however, that no security system is impenetrable. We cannot guarantee the security of our databases, nor can we guarantee that the information you supply will not be intercepted while being transmitted to and from us over the Internet. In particular, email sent to or from the App may not be secure, and you should therefore take special care in deciding what information you send to us via email.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '7. Your Rights',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Opt-out. You may contact us anytime to opt-out of: (i) direct marketing communications; (ii) automated decision-making and/or profiling; (iii) our collection of sensitive personal information; (iv) any new processing of your personal information that we may carry out beyond the original purpose; or (v) the transfer of your personal information outside the EEA. Please note that your use of some of the App may be ineffective upon opt-out.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Access. You may access the information we hold about you at any time via your profile/account or by contacting us directly.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Amend. You can also contact us to update or correct any inaccuracies in your personal information.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Move. Your personal information is portable – i.e. you to have the flexibility to move your data to other service providers as you wish.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Erase and forget. In certain situations, for example when the information we hold about you is no longer relevant or is incorrect, you can request that we erase your data.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'If you wish to exercise any of these rights, please contact us. In your request, please make clear: (i) what personal information is concerned; and (ii) which of the above rights you would like to enforce. For your protection, we may only implement requests with respect to the personal information associated with the particular email address that you use to send us your request, and we may need to verify your identity before implementing your request. We will try to comply with your request as soon as reasonably practicable and in any event, within one month of your request. Please note that we may need to retain certain information for recordkeeping purposes and/or to complete any transactions that you began prior to requesting such change or deletion.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '8. CCPA Privacy',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'In this section, we have summarized certain rights that you have under the California Consumer Privacy Act (CCPA) and how to exercise those rights. Please note that only certain parts of this Privacy Policy apply to California consumers and their rights under the CCPA.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Right to notice. You have the right to be notified which categories of Personal Data are being collected and the purposes for which the Personal Data is being used.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Right to request. You have the right to request the categories of Personal Data collected in the past twelve months, the sources from which the Personal Data was collected, the specific pieces of Personal Data we have collected about you, and the business purposes for which such Personal Data is collected and shared.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Right to say no to the sale of Personal Data. You have the right to direct us to not sell your Personal Data.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Right to delete your Personal Data. You have the right to request the deletion of your Personal Data, subject to certain exceptions.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Right not to be discriminated against. You have the right not to be discriminated against for exercising any of your CCPA rights.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'We do not sell the Personal Data of our users.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'To exercise any of these rights, please contact us. In your request, please make clear: (i) what Personal Data is concerned; and (ii) which right you would like to exercise. For your protection, we may only implement requests with respect to the Personal Data associated with the particular email address that you use to send us your request, and we may need to verify your identity before implementing your request. We will try to comply with your request as soon as reasonably practicable and in any event, within one month of your request. Please note that we may need to retain certain information for recordkeeping purposes and/or to complete any transactions that you began prior to requesting such change or deletion.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '9. Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              Text(
                'If you have any questions or comments about this Privacy Policy, the ways in which we collect and use your information described here and in the Privacy Policy, your choices and rights regarding such use, or wish to exercise your rights under California law, please do not hesitate to contact us at:',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Email: info@lifetrackr.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // Handle the 'Disagree' button tap
                  },
                  child: const Text(
                    'Disagree',
                    style: TextStyle(
                      fontSize: 16,
                      // color: Colors.red,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   padding: const EdgeInsets.symmetric(vertical: 15),
                  //   // backgroundColor: Color.fromARGB(255, 7, 243, 66),
                  //   // foregroundColor: Colors.white,
                  // ),
                  onPressed: () {
                    // Handle the 'Agree' button tap
                  },
                  child: const Text('Agree'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
