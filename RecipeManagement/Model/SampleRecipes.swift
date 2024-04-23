//
//  SampleRecipes.swift
//  RecipeManagement
//
//  Created by Nagarjun Mallesh on 22/04/24.
//

import Foundation

let sampleSouthIndianCategories = [
    Category(categoryName: "South Indian")
]

let sampleSweetsCategories = [
    Category(categoryName: "Sweets")
]

let samplePunjabiCategories = [
    Category(categoryName: "Punjabi")
]

let sampleMarathiCategories = [
    Category(categoryName: "Marathi")
]

let sampleRecipes = [
    // ... (previous recipes)
    
    Recipe(
        title: "Gulab Jamun",
        author: "Sanjeev Kapoor",
        isFavourite: true,
        date: Date(),
        categories: sampleSweetsCategories,
        hours: 1,
        minutes: 30,
        skillLevel: Recipe.SkillLevel.Intermediate,
        servingSize: 20,
        ingredients:
            """
                - 1 cup milk powder
                - 1/4 cup all-purpose flour
                - 1/4 tsp baking soda
                - 2 tbsp ghee
                - 1/4 cup milk
                - 1 cup sugar
                - 1 cup water
                - 1/4 tsp cardamom powder
                - Few drops of rose essence
            """,
        directions:
            """
                1. In a bowl, mix milk powder, flour, and baking soda.
                2. Add ghee and milk, and knead into a smooth dough.
                3. Make small balls from the dough.
                4. In a pan, heat sugar and water until the sugar dissolves.
                5. Add cardamom powder and rose essence to the syrup.
                6. Deep fry the dough balls until golden brown.
                7. Soak the fried balls in the syrup for 30 minutes.
                8. Serve hot or cold.
            """,
        notes:
            """
                - Adjust the consistency of the syrup as per your preference.
            """
    ),
    
    Recipe(
        title: "Masala Dosa",
        author: "Tarla Dalal",
        isFavourite: false,
        date: Date(),
        categories: sampleSouthIndianCategories,
        hours: 2,
        minutes: 30,
        skillLevel: Recipe.SkillLevel.Advanced,
        servingSize: 6,
        ingredients:
            """
                - 2 cups rice
                - 1 cup urad dal
                - 1 tsp fenugreek seeds
                - Salt to taste
                - Water as needed
                - 2 cups boiled and mashed potatoes
                - 1 onion, chopped
                - 1 green chili, chopped
                - 1/2 tsp mustard seeds
                - 1/2 tsp cumin seeds
                - Few curry leaves
                - 1/4 tsp turmeric powder
                - 1/2 tsp red chili powder
                - Salt to taste
                - Oil for cooking
            """,
        directions:
            """
                1. Soak rice, urad dal, and fenugreek seeds separately for 4-6 hours.
                2. Grind the soaked ingredients to a smooth batter.
                3. Ferment the batter overnight or for 8-10 hours.
                4. For the potato filling, heat oil in a pan.
                5. Add mustard seeds, cumin seeds, and curry leaves.
                6. Add chopped onions and green chili, and sauté until translucent.
                7. Add mashed potatoes, turmeric powder, red chili powder, and salt. Mix well.
                8. Heat a dosa pan and spread the batter in a circular motion.
                9. Cook until the dosa turns crispy and golden brown.
                10. Place the potato filling in the center and fold the dosa.
                11. Serve hot with chutney and sambar.
            """,
        notes:
            """
                - Fermenting the batter well is key to making crispy dosas.
            """
    ),
    
    Recipe(
        title: "Aloo Paratha",
        author: "Nisha Madhulika",
        isFavourite: true,
        date: Date(),
        categories: samplePunjabiCategories,
        hours: 0,
        minutes: 30,
        skillLevel: Recipe.SkillLevel.Beginner,
        servingSize: 4,
        ingredients:
            """
                - 2 cups whole wheat flour
                - 1 cup boiled and mashed potatoes
                - 1/2 tsp cumin seeds
                - 1/2 tsp red chili powder
                - 1/4 tsp garam masala powder
                - Salt to taste
                - Water as needed
                - Oil or ghee for cooking
            """,
        directions:
            """
                1. In a bowl, mix whole wheat flour and salt. Add water gradually and knead into a soft dough.
                2. In another bowl, mix mashed potatoes, cumin seeds, red chili powder, garam masala, and salt.
                3. Divide the dough into small balls.
                4. Roll out each ball into a small circle.
                5. Place a portion of the potato filling in the center and seal the edges.
                6. Roll out the stuffed dough into a paratha.
                7. Cook the paratha on a hot tawa with oil or ghee until crispy and golden brown on both sides.
                8. Serve hot with yogurt or pickle.
            """,
        notes:
            """
                - You can add finely chopped onions or green chilies to the potato filling for extra flavor.
            """
    ),
    
    Recipe(
        title: "Dal Makhani",
        author: "Ranveer Brar",
        isFavourite: true,
        date: Date(),
        categories: samplePunjabiCategories,
        hours: 2,
        minutes: 0,
        skillLevel: Recipe.SkillLevel.Intermediate,
        servingSize: 6,
        ingredients:
            """
                - 1 cup whole black lentils (urad dal)
                - 1/4 cup kidney beans (rajma)
                - 1 onion, finely chopped
                - 2 tomatoes, pureed
                - 1 tbsp ginger-garlic paste
                - 1 tsp cumin seeds
                - 1 tsp red chili powder
                - 1/2 tsp garam masala powder
                - 1/2 cup cream
                - 2 tbsp butter
                - Salt to taste
                - Water as needed
            """,
        directions:
            """
                1. Soak black lentils and kidney beans overnight or for 8-10 hours.
                2. Pressure cook the soaked lentils and beans with salt and water until soft and mushy.
                3. In a pan, heat butter and add cumin seeds.
                4. Add chopped onions and sauté until golden brown.
                5. Add ginger-garlic paste and cook for a minute.
                6. Add tomato puree, red chili powder, garam masala, and salt. Cook until the oil separates.
                7. Add the cooked lentils and beans to the pan and mix well.
                8. Simmer for 15-20 minutes, stirring occasionally.
                9. Add cream and mix well. Cook for another 5 minutes.
                10. Serve hot with rice or naan.
            """,
        notes:
            """
                - You can adjust the consistency of the dal by adding more water or cooking it longer.
            """
    ),
    
    Recipe(
        title: "Poha",
        author: "Archana's Kitchen",
        isFavourite: false,
        date: Date(),
        categories: sampleMarathiCategories,
        hours: 0,
        minutes: 20,
        skillLevel: Recipe.SkillLevel.Beginner,
        servingSize: 2,
        ingredients:
            """
                - 2 cups flattened rice (poha)
                - 1 onion, chopped
                - 1 potato, chopped
                - 1/2 tsp mustard seeds
                - 1/2 tsp cumin seeds
                - Few curry leaves
                - 1 green chili, chopped
                - 1/4 tsp turmeric powder
                - Salt to taste
                - 2 tbsp oil
                - Lemon juice to taste
                - Chopped coriander leaves for garnish
            """,
        directions:
            """
                1. Rinse the poha in water and drain the excess water. Set aside.
                2. In a pan, heat oil and add mustard seeds, cumin seeds, and curry leaves.
                3. Add chopped onions, potatoes, and green chili. Sauté until the potatoes are cooked.
                4. Add turmeric powder and salt. Mix well.
                5. Add the soaked poha and mix gently.
                6. Cook for 2-3 minutes until the poha is heated through.
                7. Squeeze some lemon juice and garnish with chopped coriander leaves.
                8. Serve hot.
            """,
        notes:
            """
                - You can add peanuts or other vegetables like peas or carrots to the poha for added crunch and flavor.
            """
    )
]
