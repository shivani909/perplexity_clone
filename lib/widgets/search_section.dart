import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_clone/theme/colors.dart';
import 'package:perplexity_clone/widgets/search_bar_button.dart';
import 'package:perplexity_clone/widgets/side_bar.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Where knowledge begins",
          style: GoogleFonts.ibmPlexMono(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 32),

        Container(
          width: 700,
          decoration: BoxDecoration(color: AppColors.searchBar,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.searchBarBorder,
            width: 1.5
          )
          ),
          child: Column(
            children: [
              Padding(
                
                padding: const EdgeInsets.all(16),
                child: TextField(
                  
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Search anything...",
                    hintStyle: TextStyle(color: AppColors.textGrey, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButtton(
                      icon: Icons.auto_awesome_outlined,
                      text: 'Focus'
                      
                    ),
                    const SizedBox(width: 12),
                    SearchBarButtton(
                       icon: Icons.add_circle_outline,
                      text: 'Attach'
                    ),
                     const Spacer(),
                     Container(
                      padding: EdgeInsets.all(9),
                      decoration:   BoxDecoration(
                      color: AppColors.submitButton,
                      borderRadius: BorderRadius.circular(40),
                
                      ),
                      child: const Icon(Icons.arrow_forward,
                      color: AppColors.background,
                      size: 16,
                      ),
                     )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
