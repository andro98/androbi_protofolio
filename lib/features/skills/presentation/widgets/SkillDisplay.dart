import 'package:androbi/core/config/Styles.dart';
import 'package:androbi/core/config/palette.dart';
import 'package:androbi/features/skills/domain/entities/skill.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SkillDisplay extends StatelessWidget {
  Size size;
  final List<Skill> skills;

  SkillDisplay(this.skills);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: skills.length,
      itemBuilder: (context, index) => buildSkill(skills[index]),
    );
  }

  Widget buildSkill(Skill skill) {
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
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              skill.name,
              style: Styles.skillText,
            ),
          ),
          Expanded(
            flex: 4,
            child: LinearPercentIndicator(
              progressColor: Palette.thirdColor,
              percent: (skill.value / 10.0),
              lineHeight: 20.0,
              animation: true,
              animationDuration: 1,
            ),
          ),
        ],
      ),
    );
  }
}
