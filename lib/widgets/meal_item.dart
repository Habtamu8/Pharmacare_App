import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal});
  
   final Meal meal;
   final void Function(Meal meal) onSelectedMeal;

   String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
   }
   String get  affordableText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
   }
 

  @override
  Widget build(BuildContext context) {
    return Card(
     margin:const  EdgeInsets.all(8),
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
     child: InkWell(
      onTap: () {
        onSelectedMeal(meal);
        },
      child: Stack(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder:MemoryImage(kTransparentImage)  , 
              image:NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              ),
          ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding:const EdgeInsets.symmetric(horizontal: 44 , vertical: 6),
                child: Column(
                  children: [
                    Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis, // this cut the text and put ... if its long
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                    ),
                    ), 

                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        MealItemTrait(
                          icon: Icons.schedule, 
                          label: '${meal.duration} Min'),
                      
                         MealItemTrait(
                          icon: Icons.work, 
                          label: complexityText),
                       
                         MealItemTrait(
                          icon: Icons.monetization_on, 
                          label:affordableText ),
                       
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
     ), 
    ); 
  }

}