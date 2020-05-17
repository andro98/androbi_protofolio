import 'package:androbi/core/config/Styles.dart';
import 'package:androbi/core/config/palette.dart';
import 'package:androbi/features/experience/domain/entities/experience.dart';
import 'package:flutter/material.dart';

class ExperienceDisplay extends StatelessWidget {
  Size size;

  final List<Experience> experiences;

  ExperienceDisplay(this.experiences);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: experiences.length,
      itemBuilder: (context, index) => buildSkill(experiences[index]),
    );
  }

  Widget buildSkill(Experience experiences) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(experiences.logo),
                  backgroundColor: Colors.white,
                  radius: 80.0,
                ),
                SizedBox(height: 5.0,),
                Text(
                  experiences.companyName,
                  style: Styles.desc30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Palette.fourthColor,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      experiences.location,
                      style: Styles.desc20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    experiences.title,
                    style: Styles.title50,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          experiences.from,
                          style: Styles.date,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          experiences.to,
                          style: Styles.date,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      top: 20.0,
                    ),
                    child: Text(
                      experiences.desc,
                      style: Styles.desc20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
