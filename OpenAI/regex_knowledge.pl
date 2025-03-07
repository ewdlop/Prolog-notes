:- use_module(library(pcre)). % Load regex support
% 🔹 Regex-based knowledge (patterns represent abstract knowledge)
regex_knowledge(email, "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", "A valid email address format").
regex_knowledge(phone, "^\\+?[1-9][0-9]{6,14}$", "An international phone number").
regex_knowledge(binary, "^[01]+$", "A valid binary number").
regex_knowledge(roman, "^(M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3}))$", "A valid Roman numeral").
regex_knowledge(url, "^(https?|ftp)://[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}(/.*)?$", "A valid URL").
regex_knowledge(username, "^[a-zA-Z0-9_]{3,16}$", "A valid username (3-16 chars, alphanumeric or _)").
regex_knowledge(hex_color, "^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$", "A valid hexadecimal color code").
% 🔹 Query knowledge using regex patterns
match_knowledge(Category, Input, Description) :-
regex_knowledge(Category, Regex, Description),
re_match(Regex, Input).
% 🔹 Find all regex patterns related to a keyword (e.g., "number")
find_related_patterns(Keyword, Matches) :-
findall(Category, (regex_knowledge(Category, Regex, _), re_match(Keyword, Regex)), Matches).
