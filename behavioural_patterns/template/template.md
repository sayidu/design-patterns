# Template Pattern

  __Intent__
  Define the skeleton of an algorithm in an operation, deferring some steps to
  subclasses. Template Method lets subclasses redefine certain setps of an
  algorithm without changing the algorithm structure.

__Solution__
* Identify what varies and what does not change in the algorithm.
* Implement what does not change in a abstract class
* Implement what carries in a derived class.
