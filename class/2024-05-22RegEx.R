library(stringr)

string <- "car"
pattern <- "car"
grep(pattern, string)

string <- c("car", "cars", "in a car", "truck", "car's trunk")
pattern <- "car"
grep(pattern, string)

str_count(string,pattern)

string <- c("car", "cars", "in a car", "truck", "car's trunk")
pattern <- "car"
grepl(pattern, string)

str_detect(string,pattern)

# special characters: . \ | ( ) [ { ^ $ * + ?
#  \ - escape character
#  . - any (just one) character
#  ^ - begining of a string (usage: ^[...])
#  $ - end of string
#  \w - alphanumerical sign
#  \W - non-alphanumerical sign
#  \s - whitespace
#  \S - non-whitespace
#  \d - digit
#  \D - non-digit
#  [...] - posible valuse of a character
#  [^...] - all but chars
#  | - or sign
#  () - group

string <- c("car", "cars", "in a car", "truck", "car's trunk")
grep("^c.r",string)
grep("^c..$",string)
grep("^c.r.$",string)

grep("\\w", c(" ", "a", "1", "A", "%", "\t"))
grepl("\\w", c(" ", "a", "1", "A", "%", "\t"))
grep("\\W", c(" ", "a", "1", "A", "%", "\t"))
grep("\\s", c(" ", "a", "1", "A", "%", "\t"))
grep("\\S", c(" ", "a", "1", "A", "%", "\t"))
grep("\\d", c(" ", "a", "1", "A", "%", "\t"))
grep("\\D", c(" ", "a", "1", "A", "%", "\t"))
grep("^[abc]\\w\\w", c("car", "bus", "no", "cars"))
grep("^[abc]\\w\\w$", c("car", "bus", "no", "cars"))
grep("^[a-z][a-z][a-z]$", c("Car", "Cars", "cars","car", "no", "three:", "tic", "tac"))
grep("((\\d)|([1-9]\\d))", c("1", "20", "0", "zero", "it is 100%", "09"))
grep("(^\\d)", c("1", "20", "0", "zero", "it is 100%", "09"))
grep("(^[1-9])", c("1", "20", "0", "zero", "it is 100%", "09"))

# repeating operators refer to last character or group
#  ? - matches at most 1 times
#  * - matches at least 0 times
#  + - matches at least 1 times
#  {m} – matches exactly m times
#  {m, n} – matches between m and n times
#  {m, } – matches at least m times

string <- c("a", "ab", "acb", "accb", "acccb", "accccb")
grep("ac*b", string)
grep("ac+b", string)
grep("(ac)+b",string)
grep("^([a-z]+ )*[a-z]+$", c("words", "words or sentences", "123 no", "Words"," word","word 123"))
grep("^[a-z]{3,5}$", c("words", "words or sentences", "123 no", "Words"," word","word 123","hey"))

text<-"Yesterday I had 100 Euros, today I only have 45 Euros left."
gregexpr("(\\d+)",text)
regmatches(text, gregexpr("\\d+",text))

str_match_all(text,"\\d+")
str_extract_all(text,"\\d+") # output identičen regmatches()
str_extract_all(text,"\\d+") |>
  list_c()
