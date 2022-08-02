import Cocoa

//Arrays are basically a group of a DataType
// You can have a String Array which is a group of Strings
//Usefull if you wanted to keep a list of names for a class

//This is one way of creating arrays, you can think of it as a box of Strings
var students = [String]()

students.append("Carl")
students.append("Muaz")
students.append("Cherry")

//.append adds an element to the end of an array

//A second way of creating an Array is like so
var teachers = Array<Int>()
teachers.append(12)
teachers.append(132)
teachers.append(21)

//Now just like other data types, Swift is smart enough to guess the data type by context
//For example
var studentAges = [23,12,34,23,21]
//This will create an Int Array

//Just like other data types. Type Safety still exists meaning you can do strange things with numbers and strings just because they're in a group now

print(students[0])
//0 is the first index of an array

print(teachers[1] * teachers[2])
//When you refrence a value inside an Array it will work just like any normal variable would

//Now since they work just like variables it means we can do special things
//Like Sort, Count, or Reverse

students.count
//.count in array gives us the number of items in the array. If you wanted to count chars then look at the next line
students[1].count

//Let's say we want to remove all items and have a clean array
students.removeAll()

//If we want to reomve only one item then:
teachers.remove(at: 1)

//We can also check if certain values are inside an array. It will return a boolean, a true or false
var badManga = ["Rent a gf", "Most isekai", "One Shots"]
print(badManga.contains("Berserk"))

//We can also sort the contents of an array. It is by default in accending order
badManga.sort()

print(badManga)

//We can also reverse an Array.
let reversedBadManga = badManga.reversed()
print(reversedBadManga)
//Now if you printed that you may feel played as it's still the same. This is because Reversed Arrays are actually a data type in Swift. So it's actually reversed but not now

