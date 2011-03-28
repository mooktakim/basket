Shopping Basket Application
===========================

We would like you to write a small application to the following requirements
written in either Rails or just plain Ruby. We would like it to be tested using
whatever framework you are comfortable with. It must pass the tests and the
tests must include at least the requirements mentioned below. If anything is
ambiguous just make an assumption and add a test for it. This is not meant to
take days to complete. A UI is not required.

We have a number of products:
An orange is 29p
Bread is £1
Milk is 90p
Shower gel is £1.19

We have some deals:
* We'd like to do a 3 for the price of 2 deal on oranges.
* You can buy 2 Shower gels for £2

A customer walks into a shop and picks up an orange, bread and milk, takes it
to the checkout and the assistant scans the items and displays a total.

A customer picks up 3 oranges and a bottle of milk, takes it to the checkout and
the assistant scans the items and displays a total.

Another customer picks up 1 orange and a loaf of bread, takes it to the checkout
and the assistant scans the items and displays a total.

Our final customer picks up 2 shower gels and 3 oranges takes it to the checkout
and the assistant scans the items and displays a total.

Assumptions
===========

Each promotion can only apply to a single product (can't use across
products, eg: when you buy prodx you get prody free).
Each product can have only one promotion.
