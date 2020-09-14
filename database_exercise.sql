CREATE DATABASE ad_lister_db;
USE ad_lister_db;

# Users sign up for the site with an email and password
CREATE TABLE users (
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(30) NOT NULL UNIQUE,
    pw VARCHAR(30) NOT NULL,
    PRIMARY KEY (user_id)
);

INSERT INTO users(user_id, email, pw)
    VALUES(1, 'chuck@codeup.com', 'chuck123'),
          (2, 'chaz@codeup.com', 'chaz123');

# Each ad is associated with the user that created it.
# An ad can be in one or more categories (for example, "help wanted", "giveaway", or "furniture")
CREATE TABLE categories(
    category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category VARCHAR(30) NOT NULL,
    PRIMARY KEY (category_id)
);

INSERT INTO categories (category_id, category)
VALUES(1, 'MUSICAL INSTRUMENTS'),
      (2, 'COMPUTERS & ACCESSORIES'),
      (3, 'SOUND EQUIPMENT');

# Users create ads with a title and description and category.
CREATE TABLE ads (
    ad_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (ad_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO ads (ad_id, title, description, user_id)
    VALUES(0, 'USED AMERICAN STRATOCASTER - $499', 'Lightly used american strat that is fully functional and in good cosmetic condition. Has a shaky tone knob', 2);

CREATE TABLE ads_categories (
    ads_id INT UNSIGNED NOT NULL,
    categories_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (categories_id) REFERENCES categories(category_id),
    FOREIGN KEY (ads_id) REFERENCES ads(ad_id)
);

CREATE TABLE ads_users (
    ads_id INT UNSIGNED NOT NULL,
    users_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ads_id) REFERENCES ads (ad_id),
    FOREIGN KEY (users_id) REFERENCES users (user_id)
 );

# For a given ad, what is the email address of the user that created it?
SELECT email FROM users WHERE user_id = (
    SELECT user_id FROM ads WHERE ad_id = 0
);

# For a given user, show all the ads they have posted.
SELECT * FROM ads WHERE user_id = 0;

# For a given ad, what category, or categories, does it belong to?
# SELECT category FROM categories WHERE category_id = 0;

# For a given category, show all the ads that are in that category.
# SELECT ads FROM categories;
SELECt * from ads
    JOIN ads_categories ac on ads.ad_id = ac.ads_id
    JOIN categories c on ac.categories_id = c.category_id
WHERE c.category_id = 0;


CREATE DATABASE quiz_db;
USE quiz_db;

# Administrators create questions
CREATE TABLE quiz (
    quiz_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (quiz_id)
);
# Administrators create answers for each question
CREATE TABLE questions (
    question_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    question VARCHAR(300) NOT NULL,
    PRIMARY KEY (question_id)
);
# Each question should have one correct answer
# Administrators create quizzes
# Quizzes have one or more questions associated with them
# Students (users) take quizzes
# The application should record a student's answers for each question on the quiz
# Queries
#
# For a given student, calculate their score on a given quiz.
# For a given quiz, find how many students have taken it.
# Bonus
#
# Allow questions to have multiple correct answers

