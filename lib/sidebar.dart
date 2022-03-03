import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountEmail: Text(
              "shrey.navadia@gmail.com",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/widebanner.jpg'),
              ),
            ),
            accountName: null,
          ),
          ListTile(
            leading: const Icon(Icons.mail_rounded),
            title: const Text('Feedback'),
            onTap: () async {
              const toEmail = "19it073@charusat.edu.in";
              const sub =
                  'Hey Developers!!! We find this suggestion would be helpful in the further application';
              const msg =
                  "We found this feature to be extremely helpful/ need to fix this feature.....";
              const url = 'mailto:$toEmail?subject=$sub&body=$msg';
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.share_rounded),
            title: const Text('Invite Friend'),
            onTap: () {
              Share.share(
                  'You can download the application with the below link');
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
