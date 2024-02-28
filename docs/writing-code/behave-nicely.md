# Behave nicely

Would you feel comfortable running someone else's code if you thought it might affect your other files, applications, settings, or do something else that's unexpected?

!!! tip

    Your code should be **encapsulated:** it should assume as little as possible about the computer on which it is running, and it shouldn't mess with the user's environment.

!!! tip

    Your code should follow the **principal of least surprise:** behave in a way that most users will expect it to behave, and not astonish or surprise them.

## A cake analogy

Suppose you have two colleagues who regularly bake cakes, and you decide you'd like one of them to bake you a lemon cake with chocolate icing.

- **A nice colleague:** you ask your colleague to bake a lemon cake with chocolate icing.

    - That evening, they go home and bake a cake.
    - They bring the cake to work the next day.
    - The cake tastes of lemon and is topped with chocolate icing.

- **A messy colleague:** you ask your colleague to bake a lemon cake with chocolate icing.

    - They reply that they will make a cake
    - The next day, they come into your office with the ingredients and a portable oven.
    - They begin mixing ingredients, making a huge mess on your desk.
    - You have to wait until the batter is mixed before they ask you for your choice of flavour.
    - They don't have lemons, but add some orange zest to the batter.
    - Once the cake is baked, they let it cool.
    - One hour later they ask you what flavour icing you want.
    - They don't have chocolate or cocoa, so they a different icing.
    - They give you the cake.
    - The cake tastes of orange and is topped with strawberry icing.
    - Your office is covered in flour, sugar, and cake batter.

## Some specific tips

- Avoid modifying files outside of the project directory!

- Avoid using hard-coded absolute paths, such as `C:\Users\My Name\Some Project\...` or `/Users/My Name/Some other directory`.
  These make it harder for other people to use the code, or to run the code on high-performance computing platforms.

- Prefer using paths that are relative to the root directory of your project, such as `input-data/case-data/cases-for-2023.csv`.
