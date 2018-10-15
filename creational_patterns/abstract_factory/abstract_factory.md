## Abstract Factory Pattern

  __Intent__

  Provide an interface for creating families of related or dependent objects without specifying their concrete classes.

  __Creating your  example__
  * Think of three types factories?
    - Beverage Factory
    - Clothing Factory
    - Furniture Factory
  * What do these factories produce?
    - Drinks
      * Water
      * Juice
      * Tea
    - Clothing
      * Pants
      * Shirts
      * Scarfs
    - Furniture
      * Chair
      * Table
      * Sofa
  * Two popular factories
    - Drinks
      * Nestle
      * Pepsi

  * Applying the factory pattern?
    1. Implement a common interface for each distinct product
       and their variants.
    2. Create the Abstract Factory that declares methods for creating products that make a product family.
    3. Implement Concrete Factories and return products of a particular line.
