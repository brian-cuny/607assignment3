library(stringr)

#3
raw.data <-"555-1239Moe Szyslak(636) 555-0113Burns, C. Montgomery555-6542Rev. Timothy Lovejoy555 8904Ned Flanders636-555-3226Simpson, Homer5553642Dr. Julius Hibbert"
#from textbook
names <- unlist(str_extract_all(raw.data, '[[:alpha:]., ]{2,}'))

str_match_all(names, '([:graph:]+?), ([:print:]+)')
corrected_names <- str_replace_all(names, '([:graph:]+?), ([:print:]+)', '\\2 \\1')


str_match_all(corrected_names, '[:alpha:]{2,}\\.')
has_title <- str_detect(corrected_names, '[:alpha:]{2,}\\.')

str_match_all(corrected_names, '([:print:]+? ){2}[:print:]+')
has_middle <- str_detect(corrected_names, '([:print:]+? ){2}[:print:]+') & !has_title


#4
test <- c('200$', "Hello do you have 350$?", "1$! That is too much!")
str_match(test, '[0-9]+\\$')
#This matches any string that contains a string of digits of any length ending in a dollar sign. Apparently some parts of Europe and Canada typically place the dollar sign after the digits, so perhaps this is trying to match those situations

test2 <- c('what', "we're wishing you well", "Best wishes with you")
str_match(test2, '\\b[a-z]{1,4}\\b')
#This matches any string that contains a 1 to 4 lowercase characters using only the standard enlighs 26 characters. This may not grab the entire word as in the case of accented characters or possessives and contractions.

test3 <- c('hello.txt', '#(*$&@#($*&#.txt', 'The file you want is called name.txt')
str_match(test3, '.*?\\.txt$')
#This matches the entirety of any string that concludes with the four characters '.txt'. This may be attempting to find text file names but as in the example above, grabs extra likely unneeded information. 

test4 <- c('10/15/2000', '33/99/9999', '100/10/100000')
str_match(test4, '\\d{2}/\\d{2}/\\d{4}')
#This seems to be attempting to match a date found in a string. 2 digits, a slash, 2 more digits, a slash and finally 4 digits. However, this will end up matching non-date like strings and also can match string formated as dates with invalid dates (for example, month 33). It will also miss single month/day combinations

test5 <- c('<hello> alsifejaslfij </hello>', '<p>This is an <b>important</b> example</p>')
str_match(test5, '<(.+?)>.+?</\\1>')
#This string seems like it would be used when processing html. It captures the first tag that it finds (identified by being inside the < and > symbols) and then looks for a matching closing bracket further on in the text. This could be useful if you wanted to extract all the tables on a webpage for example.

#9
code <- 'clcopCow1zmstc0d87wnkig7OvdicpNuggvhryn92Gjuwczi8hqrfpRxs5Aj5dwpn0TanwoUwisdij7Lj8kpf03AT5Idr3coc0bt7yczjatOaootj55t3Nj3ne6c4Sfek.r1w1YwwojigOd6vrfUrbz2.2bkAnbhzgv4R9i05zEcrop.wAgnb.SqoU65fPa1otfb7wEm24k6t3sR9zqe5fy89n6Nd5t9kc4fE905gmc4Rgxo5nhDk!gr'

paste(str_replace(unlist(str_match_all(code, '[A-Z.!]')),'\\.',' '),collapse='')