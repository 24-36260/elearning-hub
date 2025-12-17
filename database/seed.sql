-- ----------------------
-- Users
-- ----------------------
INSERT INTO users (full_name, email, password_hash, role) VALUES
('Juan Dela Cruz', 'juan.delacruz@gmail.com', 'pbkdf2:sha256:260000$HASHED1', 'student'),
('Maria Santos', 'maria.santos@gmail.com', 'pbkdf2:sha256:260000$HASHED2', 'student'),
('Jose Ramirez', 'jose.ramirez@gmail.com', 'pbkdf2:sha256:260000$HASHED3', 'student'),
('Anna Reyes', 'anna.reyes@gmail.com', 'pbkdf2:sha256:260000$HASHED4', 'student'),
('Mark Villanueva', 'mark.villanueva@gmail.com', 'pbkdf2:sha256:260000$HASHED5', 'student'),
('Christine Lopez', 'christine.lopez@gmail.com', 'pbkdf2:sha256:260000$HASHED6', 'student'),
('Paolo Mendoza', 'paolo.mendoza@gmail.com', 'pbkdf2:sha256:260000$HASHED7', 'student'),
('Angela Cruz', 'angela.cruz@gmail.com', 'pbkdf2:sha256:260000$HASHED8', 'student'),
('Daniel Flores', 'daniel.flores@gmail.com', 'pbkdf2:sha256:260000$HASHED9', 'student'),
('Sofia Navarro', 'sofia.navarro@gmail.com', 'pbkdf2:sha256:260000$HASHED10', 'student'),
('Ryan Castillo', 'ryan.castillo@gmail.com', 'pbkdf2:sha256:260000$HASHED11', 'student'),
('Kimberly Torres', 'kimberly.torres@gmail.com', 'pbkdf2:sha256:260000$HASHED12', 'student'),
('Joshua Lim', 'joshua.lim@gmail.com', 'pbkdf2:sha256:260000$HASHED13', 'student'),
('Nicole Perez', 'nicole.perez@gmail.com', 'pbkdf2:sha256:260000$HASHED14', 'student'),
('Christian Gomez', 'christian.gomez@gmail.com', 'pbkdf2:sha256:260000$HASHED15', 'student'),
('Alyssa Aquino', 'alyssa.aquino@gmail.com', 'pbkdf2:sha256:260000$HASHED16', 'student'),
('John Patrick Tan', 'johnpatrick.tan@gmail.com', 'pbkdf2:sha256:260000$HASHED17', 'student'),
('Bea Fernandez', 'bea.fernandez@gmail.com', 'pbkdf2:sha256:260000$HASHED18', 'student'),
('Kevin Morales', 'kevin.morales@gmail.com', 'pbkdf2:sha256:260000$HASHED19', 'student'),
('Admin User', 'admin@elearninghub.com', 'pbkdf2:sha256:260000$HASHEDADMIN', 'admin');

-- ----------------------
-- Courses
-- ----------------------
INSERT INTO courses (course_title) VALUES
('Introduction to HTML'),
('HTML Page Structure & Elements'),
('Text Formatting and Lists in HTML'),
('HTML Links, Images, and Media'),
('HTML Forms and User Input'),
('Semantic HTML for Modern Websites'),
('Building Your First Website with HTML'),
('Introduction to CSS'),
('CSS Colors, Fonts, and Text Styling'),
('CSS Box Model Explained'),
('Layouts with Flexbox'),
('CSS Grid for Responsive Design'),
('Styling Navigation Bars and Buttons'),
('Responsive Web Design with CSS'),
('Python Programming Basics'),
('Python Variables, Data Types, and Operators'),
('Control Flow in Python (if, loops)'),
('Functions and Modules in Python'),
('Python Data Structures'),
('File Handling and Error Handling in Python');

-- ----------------------
-- Quizzes
-- ----------------------
INSERT INTO quizzes (course_id, quiz_title) VALUES
(1, 'Introduction to HTML - 5 Question Quiz'),
(2, 'HTML Page Structure & Elements - 5 Question Quiz'),
(3, 'Text Formatting and Lists in HTML - 5 Question Quiz'),
(4, 'HTML Links, Images, and Media - 5 Question Quiz'),
(5, 'HTML Forms and User Input - 5 Question Quiz'),
(6, 'Semantic HTML for Modern Websites - 5 Question Quiz'),
(7, 'Building Your First Website with HTML - 5 Question Quiz'),
(8, 'Introduction to CSS - 5 Question Quiz'),
(9, 'CSS Colors, Fonts, and Text Styling - 5 Question Quiz'),
(10, 'CSS Box Model Explained - 5 Question Quiz'),
(11, 'Layouts with Flexbox - 5 Question Quiz'),
(12, 'CSS Grid for Responsive Design - 5 Question Quiz'),
(13, 'Styling Navigation Bars and Buttons - 5 Question Quiz'),
(14, 'Responsive Web Design with CSS - 5 Question Quiz'),
(15, 'Python Programming Basics - 5 Question Quiz'),
(16, 'Python Variables, Data Types, and Operators - 5 Question Quiz'),
(17, 'Control Flow in Python (if, loops) - 5 Question Quiz'),
(18, 'Functions and Modules in Python - 5 Question Quiz'),
(19, 'Python Data Structures - 5 Question Quiz'),
(20, 'File Handling and Error Handling in Python - 5 Question Quiz');

-- ----------------------
-- Quiz Questions
-- ----------------------
INSERT INTO quiz_questions
(quiz_id, question, option_a, option_b, option_c, option_d, correct_answer)
VALUES
-- Lesson 1
(1,'What does HTML stand for?','Hyper Trainer Marking Language','HyperText
Markup Language','High Text Machine Language','Hyper Tool Markup
Language','B'),
(1,'What is HTML mainly used for?','Styling web pages','Programming
logic','Structuring web content','Database management','C'),
(1,'Which tag is used to create a paragraph?','<h1>','<p>','<div>','<span>','B'),
(1,'Which tag contains visible page
content?','<head>','<meta>','<body>','<title>','C'),
(1,'HTML files usually have what extension?','.css','.py','.html','.exe','C'),
-- Lesson 2
(2,'What does <!DOCTYPE html> do?','Adds styles','Declares HTML
version','Adds scripts','Creates a form','B'),
(2,'Which tag is the root of an HTML
document?','<body>','<head>','<html>','<title>','C'),
(2,'Where is the page title
placed?','<body>','<header>','<head>','<footer>','C'),
(2,'Which tag holds metadata?','<meta>','<p>','<img>','<section>','A'),
(2,'Which element displays the main
content?','<head>','<html>','<body>','<meta>','C'),
-- Lesson 3
(3,'Which tag makes text bold?','<i>','<b>','<em>','<u>','B'),
(3,'Which tag creates an unordered list?','<ol>','<li>','<ul>','<list>','C'),
(3,'What tag is used for list items?','<ul>','<li>','<ol>','<item>','B'),
(3,'Which tag emphasizes text?','<strong>','<b>','<em>','<p>','C'),
(3,'Ordered lists use what tag?','<ul>','<li>','<list>','<ol>','D'),
-- Lesson 4
(4,'Which tag creates a hyperlink?','<img>','<a>','<link>','<url>','B'),
(4,'Which attribute specifies the link destination?','src','alt','href','path','C'),
(4,'Which tag displays images?','<picture>','<media>','<img>','<src>','C'),
(4,'What does alt mean in images?','Alignment','Alternate
text','Animation','Altitude','B'),
(4,'Which tag plays videos?','<media>','<movie>','<video>','<mp4>','C'),
-- Lesson 5
(5,'Which tag creates a form?','<input>','<form>','<button>','<fieldset>','B'),
(5,'Which input type hides text?','text','hidden','password','secure','C'),
(5,'Which attribute shows hint text?','value','placeholder','name','type','B'),
(5,'Which input submits the form?','reset','submit','send','enter','B'),
(5,'Forms are mainly used to?','Style pages','Display images','Collect user
data','Play videos','C'),
-- Lesson 6
(6,'Which tag defines navigation?','<menu>','<nav>','<ul>','<header>','B'),
(6,'Which tag defines page
footer?','<bottom>','<end>','<footer>','<section>','C'),
(6,'Semantic HTML improves?','Speed only','Accessibility','Colors','Images','B'),
(6,'Which tag represents main
content?','<main>','<section>','<body>','<article>','A'),
(6,'Which tag groups related
content?','<div>','<span>','<section>','<meta>','C'),
-- Lesson 7
(7,'A website usually contains how many pages?','One
only','Two','Multiple','Zero','C'),
(7,'HTML alone creates a?','Dynamic site','Static site','Database','App','B'),
(7,'Which tag is always required?','<img>','<p>','<html>','<video>','C'),
(7,'What file opens first?','main.html','index.html','home.html','start.html','B'),
(7,'HTML controls?','Logic','Data','Structure','Styling','C');

INSERT INTO quiz_questions
(quiz_id, question, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(8,'CSS stands for?','Creative Style Sheets','Cascading Style Sheets','Computer
Style Sheets','Color Style Sheets','B'),
(8,'CSS is used to?','Structure content','Style content','Store data','Program
logic','B'),
(8,'Best CSS method?','Inline','Internal','External','Embedded','C'),
(8,'Which symbol selects a class?','#','.','*','@','B'),
(8,'CSS files end with?','.html','.js','.css','.py','C'),
(9,'Which property changes text color?','font','color','text-style','background','B'),
(9,'Which sets font size?','font-style','text-size','font-size','size','C'),
(9,'Which aligns text center?','align','text-align','center','float','B'),
(9,'Which property sets font type?','font-family','font-weight','text-font','style','A'),
(9,'RGB colors use?','2 values','3 values','4 values','5 values','B'),
(10,'Which is NOT part of box model?','Margin','Padding','Border','Shadow','D'),
(10,'Padding is?','Outside border','Inside content','Between content & border','Page
space','C'),
(10,'Margin affects?','Inside spacing','Outside spacing','Text size','Color','B'),
(10,'Border surrounds?','Margin','Padding','Content','Padding & content','D'),
(10,'Box model applies to?','Only divs','Only text','All elements','Images only','C');

INSERT INTO quiz_questions
(quiz_id, question, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(15,'Python is?','Low-level','High-level','Machine language','Assembly','B'),
(15,'Print output using?','echo','printf','print','output','C'),
(15,'Python files end with?','.pt','.py','.pyt','.exe','B'),
(15,'Python is?','Compiled only','Interpreted','Assembly','Binary','B'),
(15,'Python is known for?','Complexity','Readability','Speed only','Graphics','B'),
(16,'Variable stores?','Code','Data','Functions','Errors','B'),
(16,'Which is a string?','10','True','"Hello"','3.5','C'),
(16,'Boolean values are?','Yes/No','True/False','1/0','On/Off','B'),
(16,'= is used for?','Comparison','Assignment','Addition','Output','B'),
(16,'int means?','Text','Decimal','Integer','Boolean','C'),
(17,'If statements are used for?','Repeating','Decision
making','Styling','Storage','B'),
(17,'Loop repeats code?','Once','Forever','Multiple times','Never','C'),
(17,'Which is a loop?','if','for','def','print','B'),
(17,'else runs when?','If true','If false','Always','Never','B'),
(17,'range(5) outputs?','1–5','0–4','0–5','1–4','B'),
(18,'Functions are defined using?','func','define','def','function','C'),
(18,'Functions help with?','Organization','Reusability','Readability','All','D'),
(18,'Modules are?','Files','Classes','Variables','Errors','A'),
(18,'Import a module using?','include','using','import','require','C'),
(18,'math is a?','Variable','Module','Loop','Class','B'),
(19,'Lists are?','Immutable','Ordered','Fixed','Single value','B'),
(19,'Dictionaries store data as?','Lists','Sets','Key-value pairs','Strings','C'),
(19,'Sets allow?','Duplicates','Ordering','Unique values','Indexing','C'),
(19,'List index starts at?','0','1','-1','Any','A'),
(19,'{} creates?','List','Tuple','Dictionary','Set','C'),
(20,'File handling is used to?','Style apps','Store data','Print output','Loop
code','B'),
(20,'Which opens a file?','read()','open()','write()','close()','B'),
(20,'try-except handles?','Files','Errors','Variables','Loops','B'),
(20,'Writing mode uses?','"r"','"w"','"a"','"x"','B'),
(20,'Error handling prevents?','Bugs','Crashes','Syntax','Variables','B');

INSERT INTO quiz_questions
(quiz_id, question, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(15,'Python is?','Low-level','High-level','Machine language','Assembly','B'),
(15,'Print output using?','echo','printf','print','output','C'),
(15,'Python files end with?','.pt','.py','.pyt','.exe','B'),
(15,'Python is?','Compiled only','Interpreted','Assembly','Binary','B'),
(15,'Python is known for?','Complexity','Readability','Speed only','Graphics','B'),
(16,'Variable stores?','Code','Data','Functions','Errors','B'),
(16,'Which is a string?','10','True','"Hello"','3.5','C'),
(16,'Boolean values are?','Yes/No','True/False','1/0','On/Off','B'),
(16,'= is used for?','Comparison','Assignment','Addition','Output','B'),
(16,'int means?','Text','Decimal','Integer','Boolean','C'),
(17,'If statements are used for?','Repeating','Decision
making','Styling','Storage','B'),
(17,'Loop repeats code?','Once','Forever','Multiple times','Never','C'),
(17,'Which is a loop?','if','for','def','print','B'),
(17,'else runs when?','If true','If false','Always','Never','B'),
(17,'range(5) outputs?','1–5','0–4','0–5','1–4','B'),
(18,'Functions are defined using?','func','define','def','function','C'),
(18,'Functions help with?','Organization','Reusability','Readability','All','D'),
(18,'Modules are?','Files','Classes','Variables','Errors','A'),
(18,'Import a module using?','include','using','import','require','C'),
(18,'math is a?','Variable','Module','Loop','Class','B'),
(19,'Lists are?','Immutable','Ordered','Fixed','Single value','B'),
(19,'Dictionaries store data as?','Lists','Sets','Key-value pairs','Strings','C'),
(19,'Sets allow?','Duplicates','Ordering','Unique values','Indexing','C'),
(19,'List index starts at?','0','1','-1','Any','A'),
(19,'{} creates?','List','Tuple','Dictionary','Set','C'),
(20,'File handling is used to?','Style apps','Store data','Print output','Loop
code','B'),
(20,'Which opens a file?','read()','open()','write()','close()','B'),
(20,'try-except handles?','Files','Errors','Variables','Loops','B'),
(20,'Writing mode uses?','"r"','"w"','"a"','"x"','B'),
(20,'Error handling prevents?','Bugs','Crashes','Syntax','Variables','B');