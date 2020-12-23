---
title: "Confusing Java Strings"
lead: "I do not think it means what you think it means"
description: "Confusing Java Strings"

date: 2020-12-20T15:19:46-08:00
author: "Jonatan Ivanov"
type: post

categories: ["dev"]
tags: ["Java", "String", "Unicode", "UTF-8", "UTF-16"]
---

In this article, I would like to show you a couple of confusing things in connection with Java `String`s and give you a few suggestions to avoid issues with them. I also prepared a GitHub repo for you where you can find some code that you can use to try the examples out on your own: [github.com/jonatan-ivanov/java-strings-demo](https://github.com/jonatan-ivanov/java-strings-demo).
<!--more-->

# Quiz

I order to demonstrate this, let me invite you for a little quiz:  
What do you think, what is the `length` of the following `String`s in Java?

- Java
- 我喜欢茶
- 𝕒𝕓𝕔
- 👩❤☕
- 👩‍💻❤️🍵

([solution](https://github.com/jonatan-ivanov/java-strings-demo/blob/a1a6c974e31d96b5223897ad5971788e3f4a94a8/quiz.md))

By now, you might get why "Confusing Java Strings" is the title of this article. In the rest of the article, I'm going to explain why you might got unexpected results in the quiz and give you a few suggestions to avoid issues.

# Facts and Terminology

To understand the weirdness in `String`s, you need to be familiar with some Encoding/Unicode terms.  
As you might know, Java uses UTF-16 to encode Unicode text. Unicode is a standard to represent text while UTF-16 is a way to encode Unicode characters. That's why the size of the Java `char` type is 2 bytes (2x8 = 16 bits).

There are two important Unicode terms here, you need to know about: ***Code Point*** and ***Code Unit***.

- *Code Point* is a unique integer value that identifies a character
- *Code Unit* is a bit sequence used to encode a character (*Code Point*)

## UTF-16

As I mentioned above, UTF-16 is a way to encode Unicode characters. Not the only way but that is what Java uses.

Unicode *Code Points* are logically divided into 17 planes (groups). The first plane, the Basic Multilingual Plane (BMP) contains the "classic" characters (from U+0000 to U+FFFF). The other planes contain the "supplementary" characters (from U+10000 to U+10FFFF).

Characters (*Code Points*) from the first plane are encoded in one 16-bit *Code Unit* with the same value. Supplementary characters (*Code Points*) are encoded in two Code Units (see [Wikipedia - UTF-16](http://en.wikipedia.org/wiki/UTF-16) for more information).

The key thing here is that one or more *Code Units* may be required to encode a *Code Point* (character).

## Example

Character: A  
Unicode Code Point: `U+0041` (see: [codepoints.net/U+0041](https://codepoints.net/U+0041))  
UTF-16 Code Unit(s): `\u0041`

Character: 𝔸  
Unicode Code Point: `U+1D538` (see: [codepoints.net/U+1D538](https://codepoints.net/U+1D538))  
UTF-16 Code Unit(s): `\uD835\uDD38`

As you can see here A is encoded by one *Code Unit* while 𝔸 is encoded by two.

# String::length

Let's take a look at the Javadoc of the [`length()`](https://docs.oracle.com/en/java/javase/15/docs/api/java.base/java/lang/String.html#length()) method of the `String` class; it says the followings:

>`public int length()`  
>Returns the length of this string. The length is equal to the number of [Unicode code units](https://docs.oracle.com/en/java/javase/15/docs/api/java.base/java/lang/Character.html#unicode) in the string.

So if you have **one** supplementary character that consists of **two** *Code Units*, the `length` of that single character is **two**.  
Let that sink in: this means that the `char` type (as well as the `Character` class) in Java is not what we usually mean by a *character*.

## Code Points vs. Code Units Example

If we go back to our quiz, we can explain some of the anomalies:
```
Java -> U+004A U+0061 U+0076 U+0061    // 4 Code Points
Java -> \u004A \u0061 \u0076 \u0061    // 4 Code Units, length: 4
```

Likewise:
```
我喜欢茶 -> U+6211 U+559C U+6B22 U+8336    // 4 Code Points
我喜欢茶 -> \u6211 \u559C \u6B22 \u8336    // 4 Code Units, length: 4
```

But 𝕒, 𝕓, and 𝕔 are supplementary characters:
```
𝕒𝕓𝕔 -> U+1D552      U+1D553      U+1D554       // 3 Code Points
𝕒𝕓𝕔 -> \uD835\uDD52 \uD835\uDD53 \uD835\uDD54  // 6 Code Units, length: 6
```

## ~Solution

If you really need to, you can count the *Code Points* to get the number of characters, not the number of *Code Units*:
```
String str = "𝕒𝕓𝕔";
str.codePointCount(0, str.length()) // evaluates to 3
```

# Consequences

The rest of the quiz is a bit more tricky but before I go there, let me mention a couple of things that are implied from the fact that Java is using UTF-16 under the hood; let me use the `"𝔸"` String as an example:

- As you know by now this single character is represented by two `char` (or `Character`) values (*Code Units*) and the `length` of this `String` is two
- The `toCharArray()` method returns a `char` array (`char[]`) that has two elements (`0xD835` and `0xDD38` respectively)
- Both `charAt(0)` and `charAt(1)` return something (no `StringIndexOutOfBoundsException`) but these values alone are not valid characters
- If you do any character manipulation, you need to consider this case and handle these characters that consist of two `char`s (surrogates)
- Therefore, most of the character manipulation code we ever wrote is probably broken :)
- And you probably do not want to do any character manipulation

# String::reverse

In Java, the `String` class does not have a `reverse` method so sometimes you can bump into methods like this:
```
String reverse(String original) {
    String reversed = "";
    for (int i = original.length() - 1;  0 <= i; i--) {
        reversed += original.charAt(i);
    }

    return reversed;
}
```

By now, I think you might have a good idea what's wrong with this method; let's see it in action:
```
String str = "𝔸BC"; // Three characters, but four chars 
System.out.println(reverse(str)); // prints CB??
```

The tricky part of the `"𝔸BC"` String in the example is the `𝔸` character that consists of two Code Units: `\uD835\uDD38`.  
If you execute the `reverse` method above, it will produce a `String` like this: `"CB\uDD38\uD835"`.  
`C` and `B` are ok but `\uDD38\uD835` is not valid, that's why you see `??` instead. The method should not have reversed it, the valid result would be `"CB\uD835\uDD38"` (`CB𝔸`).

## Solution

Usually, not writing code to solve problems is a good idea: `new StringBuilder(original).reverse().toString()`.

# Emojis

The first emoji sequence (👩❤☕) in the quiz does not have anything tricky that you haven't known by now: the first emoji in it consists of two *Code Units* the other two consist of 1-1:

```
👩              ❤        ☕
U+1F469        U+2764   U+2615  // 3 Code Points
\uD83D\uDC69   \u2764   \u2615  // 4 Code Units, length: 4
```

The second sequence (👩‍💻❤️🍵) has two tricks:

👩‍💻 is actually two emojis joined together with a special Zero Width Joiner ([ZWJ](https://emojipedia.org/emoji-zwj-sequence/)) character.

```
👩              ZWJ       💻              // 3 characters
U+1F469        U+200D    U+1F4BB        // 3 Code Points
\D83D\uDC69    \u200D    \uD83D\uDCBB   // 5 Code Units, length: 5
```

❤️ is actually a ❤ plus a [variation selector](https://emojipedia.org/variation-selector-16/) that makes it red.

```
❤         mod      // 2 characters
U+2764    U+FE0F   // 2 Code Points
\u2764    \uFE0F   // 2 Code Units, length: 2
```

🍵 is *"just"* a supplementary character:

```
U+1F375       // 1 Code Point
\uD83C\uDF75  // 2 Code Units, length: 2
```

So the `length` of 👩‍💻❤️🍵 is 👩‍💻(5) + ❤️(2) + 🍵(2) = 9.

# Takeaway

As you have seen above, Strings are trickier than they seem first so try to avoid String manipulation as much as you can. :)
