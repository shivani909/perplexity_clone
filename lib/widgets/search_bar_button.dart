import 'package:flutter/material.dart';
import 'package:perplexity_clone/theme/colors.dart';

class SearchBarButtton extends StatefulWidget {
  final IconData icon;
  final String text;
  const SearchBarButtton({super.key, required this.icon, required this.text});

  @override
  State<SearchBarButtton> createState() => _SearchBarButttonState();
}

class _SearchBarButttonState extends State<SearchBarButtton> {
 bool isHovered = false;
 
  @override
  Widget build(BuildContext context) {
    return  MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });

      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isHovered ? AppColors.proButton : Colors.transparent,
      
      
      ),
      child: Row(
        children: [
      Icon(widget.icon,
          color: AppColors.iconGrey,
      size: 20,
      ),
      
      Text(widget.text,
      style: TextStyle(
        color: AppColors.textGrey
      ),
      )
        ],
      ),
      ),
    );
  }
}