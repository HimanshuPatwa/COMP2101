#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

read -p "Enter the first number: " firstnum
read -p "Enter the second number: " secondnum
read -p "Enter the third number: " thirdnum

sum=$((firstnum + secondnum + thirdnum))
product=$((firstnum * secondnum * thirdnum))

cat <<EOF
SUM OF THE THREE NUMBERS= $sum
PRODUCT OF THE THREE NUMBERS= $product
EOF
