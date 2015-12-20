-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2015 at 10:35 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fscmoviedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `commentdate` date NOT NULL,
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(150) NOT NULL,
  `movieid` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`commentid`),
  KEY `userid` (`userid`),
  KEY `movieid` (`movieid`),
  KEY `ratingsid` (`rating`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentdate`, `commentid`, `comment`, `movieid`, `rating`, `userid`) VALUES
('2015-11-30', 11, 'This was a great movie!', 70, 10, 2),
('2015-12-01', 12, 'Best movie of all time', 31, 9, 14),
('2015-12-01', 13, 'Movie has a major cliffhanger ending. Loved it', 52, 8, 14),
('2015-12-01', 14, 'One of the best college movies of all time.', 31, 10, 15),
('2015-12-01', 15, 'Amazing movie', 51, 9, 2),
('2015-12-01', 16, 'love the movie', 66, 8, 2),
('2015-12-03', 17, 'great movie', 45, 10, 2),
('2015-12-05', 18, 'Great Movie', 53, 10, 2),
('2015-12-05', 19, 'Very inspiring movie.', 51, 8, 13),
('2015-12-05', 20, 'loved it.', 33, 10, 13);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedbackdate` date NOT NULL,
  `feedbackdescription` varchar(150) NOT NULL,
  `feedbackid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`feedbackid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackdate`, `feedbackdescription`, `feedbackid`, `userid`) VALUES
('2015-12-01', 'I really like your site.', 12, 14),
('2015-12-01', 'Nice Site. Keep up the good work.', 13, 15),
('2015-12-01', 'Love the site', 14, 2),
('2015-12-01', 'great site', 15, 2),
('2015-12-03', 'Great site', 16, 2),
('2015-12-05', 'Great site, love the movies you selected.', 17, 13);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `moviename` varchar(75) NOT NULL,
  `moviecast` varchar(255) NOT NULL,
  `moviedescription` varchar(255) NOT NULL,
  `posterfilename` varchar(255) NOT NULL,
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`movieid`),
  UNIQUE KEY `moviename` (`moviename`),
  KEY `movieposterid` (`posterfilename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`moviename`, `moviecast`, `moviedescription`, `posterfilename`, `movieid`) VALUES
('Animal House', 'John Belushi, Karen Allen, Tom Hulce', 'At a 1962 college, Dean Vernon Wormer is determined to expel the entire Delta Tau Chi Fraternity, but those trouble-makers have other plans for him.', 'images/6dvi48bm12k79u09oubc5hjjj2_17.jpg', 31),
('Good Will Hunting', 'Robin Williams, Matt Damon, Ben Affleck', 'Will Hunting, a janitor at M.I.T., has a gift for mathematics, but needs help from a psychologist to find direction in his life.', 'images/6dvi48bm12k79u09oubc5hjjj2_19.jpg', 33),
('Revenge of the Nerds', 'Robert Carradine, Anthony Edwards, Timothy Busfield', 'At a big campus, a group of bullied outcasts and misfits resolve to fight back for their peace and self respect.', 'images/6dvi48bm12k79u09oubc5hjjj2_20.jpg', 34),
('Old School', 'Luke Wilson, Vince Vaughn, Will Ferrell', 'Three friends attempt to recapture their glory days by opening up a fraternity near their alma mater.', 'images/6dvi48bm12k79u09oubc5hjjj2_21.jpg', 35),
('The Social Network', 'Jesse Eisenberg, Andrew Garfield, Justin Timberlake', 'Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, but is later sued by two brothers who claimed ', 'images/6dvi48bm12k79u09oubc5hjjj2_22.jpg', 36),
('Real Genius', 'Val Kilmer, Gabriel Jarret, Michelle Meyrink', 'Teenage geniuses deal with their abilities while developing a laser.', 'images/6dvi48bm12k79u09oubc5hjjj2_24.jpg', 37),
('Road Trip', 'Breckin Meyer, Seann William Scott, Amy Smart', 'Four friends take off on an 1800 mile road trip to retrieve an illicit tape mistakenly mailed to a girl friend.', 'images/6dvi48bm12k79u09oubc5hjjj2_25.jpg', 38),
('Rules of Attraction', 'James Van Der Beek, Ian Somerhalder, Shannyn Sossamon', 'The incredibly spoiled and overprivileged students of Camden College are a backdrop for an unusual love triangle between a drug dealer, a virgin and a', 'images/6dvi48bm12k79u09oubc5hjjj2_26.jpg', 39),
('The Hangover', 'Zach Galifianakis, Bradley Cooper, Justin Bartha', 'Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing. They make their way around the city in order to find their friend before his wedding.', 'images/6dvi48bm12k79u09oubc5hjjj2_27.jpg', 40),
('PCU', 'Jeremy Piven, Chris Young, Megan Ward', 'A high school senior visits college for the weekend, and stays at the wildest house on campus in this classic tale of anti-political-correctness.', 'images/6dvi48bm12k79u09oubc5hjjj2_28.jpg', 41),
('Superbad', 'Michael Cera, Jonah Hill, Christopher Mintz-Plasse', 'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.', 'images/6dvi48bm12k79u09oubc5hjjj2_29.jpg', 42),
('Back to School', 'Rodney Dangerfield, Sally Kellerman, Burt Young', 'To help his discouraged son get through college, a funloving and obnoxious rich businessman decides to enter the school as a student himself.', 'images/6dvi48bm12k79u09oubc5hjjj2_30.jpg', 43),
('Necessary Roughness', 'Scott Bakula, Hector Elizondo, Robert Loggia', 'Using a 34 year old quarterback, a female placekicker and a gang of misfits, Ed "Straight Arrow" Genero must take his team to play the number one Texas Colts.', 'images/6dvi48bm12k79u09oubc5hjjj2_31.jpg', 44),
('American Pie', 'Jason Biggs, Chris Klein, Thomas Ian Nicholas', 'Four teenage boys enter a pact to lose their virginity by prom night.', 'images/6dvi48bm12k79u09oubc5hjjj2_32.jpg', 45),
('There''s Something About Mary', 'Ben Stiller, Cameron Diaz, Matt Dillon', 'A man gets a chance to meet up with his dream girl from highschool, even though his date with her back then was a complete disaster.', 'images/6dvi48bm12k79u09oubc5hjjj2_33.jpg', 46),
('Scream', 'Neve Campbell, Courteney Cox, David Arquette', 'Attempting to cope with her mother''s murder, Sydney and her horror movie-obsessed friends are stalked by a murderer who seems to have a hard time letting the past go.', 'images/6dvi48bm12k79u09oubc5hjjj2_35.jpg', 48),
('The Shawshank Redemption', 'Tim Robbins, Morgan Freeman, Bob Gunton', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'images/6dvi48bm12k79u09oubc5hjjj2_36.jpg', 49),
('Pulp Fiction', 'John Travolta, Uma Thurman, Samuel L. Jackson', 'The lives of two mob hit men, a boxer, a gangster''s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'images/6dvi48bm12k79u09oubc5hjjj2_37.jpg', 50),
('Fight Club', 'Brad Pitt, Edward Norton, Helena Bonham Carter', 'An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more...', 'images/6dvi48bm12k79u09oubc5hjjj2_38.jpg', 51),
('Inception', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page', 'A thief who steals corporate secrets through use of the dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.', 'images/6dvi48bm12k79u09oubc5hjjj2_39.jpg', 52),
('Forrest Gump', 'Tom Hanks, Robin Wright, Gary Sinise', 'Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him.', 'images/6dvi48bm12k79u09oubc5hjjj2_40.jpg', 53),
('The Matrix', 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', 'images/6dvi48bm12k79u09oubc5hjjj2_41.jpg', 54),
('Goodfellas', 'Robert De Niro, Ray Liotta, Joe Pesci', 'Henry Hill and his friends work their way up through the mob hierarchy.', 'images/6dvi48bm12k79u09oubc5hjjj2_42.jpg', 55),
('The Usual Suspects', 'Kevin Spacey, Gabriel Byrne, Chazz Palminteri', 'A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which begin when five criminals meet at a seemingly random police lineup.', 'images/6dvi48bm12k79u09oubc5hjjj2_43.jpg', 56),
('American History X', 'Edward Norton, Edward Furlong, Beverly D\\''Angelo', 'A former neo-nazi skinhead tries to prevent his younger brother from going down the same wrong path that he did.', 'images/6dvi48bm12k79u09oubc5hjjj2_44.jpg', 57),
('Back to the Future', 'Michael J. Fox, Christopher Lloyd, Lea Thompson', 'A young man is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his friend, Dr. Emmett Brown, and must make sure his high-school-age parents unite in order to save his own existence.', 'images/6dvi48bm12k79u09oubc5hjjj2_45.jpg', 58),
('Memento', 'Guy Pearce, Carrie-Anne Moss, Joe Pantoliano', 'A man creates a strange system to help him remember things; so he can hunt for the murderer of his wife without his short-term memory loss being an obstacle.', 'images/6dvi48bm12k79u09oubc5hjjj2_46.jpg', 59),
('The Departed', 'Leonardo DiCaprio, Matt Damon, Jack Nicholson.', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', 'images/6dvi48bm12k79u09oubc5hjjj2_48.jpg', 61),
('Reservoir Dogs', 'Harvey Keitel, Tim Roth, Michael Madsen', 'After a simple jewelery heist goes terribly wrong, the surviving criminals begin to suspect that one of them is a police informant.', 'images/6dvi48bm12k79u09oubc5hjjj2_49.jpg', 62),
('Die Hard', 'Bruce Willis, Alan Rickman, Bonnie Bedelia', 'John McClane, officer of the NYPD, tries to save wife Holly Gennaro and several others, taken hostage by German terrorist Hans Gruber during a Christmas party at the Nakatomi Plaza in Los Angeles.', 'images/6dvi48bm12k79u09oubc5hjjj2_50.jpg', 63),
('Casino', 'Robert De Niro, Sharon Stone, Joe Pesci', 'Greed, deception, money, power, and murder occur between two mobster best friends and a trophy wife over a gambling empire.', 'images/6dvi48bm12k79u09oubc5hjjj2_51.jpg', 64),
('The Wolf of Wall Street', 'Leonardo DiCaprio, Jonah Hill, Margot Robbie', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.', 'images/6dvi48bm12k79u09oubc5hjjj2_52.jpg', 65),
('Fargo', 'William H. Macy, Frances McDormand, Steve Buscemi', 'Jerry Lundegaard''s inept crime falls apart due to his and his henchmen''s bungling and the persistent police work of the quite pregnant Marge Gunderson.', 'images/6dvi48bm12k79u09oubc5hjjj2_53.jpg', 66),
('The Sixth Sense', 'Bruce Willis, Haley Joel Osment, Toni Collette', 'A boy who communicates with spirits that don''t know they''re dead seeks the help of a disheartened child psychologist.', 'images/6dvi48bm12k79u09oubc5hjjj2_54.jpg', 67),
('Stand by Me', 'Wil Wheaton, River Phoenix, Corey Feldman', 'After the death of a friend, a writer recounts a boyhood journey to find the body of a missing boy.', 'images/6dvi48bm12k79u09oubc5hjjj2_55.jpg', 68),
('The Princess Bride', 'Cary Elwes, Mandy Patinkin, Robin Wright', 'While home sick in bed, a young boy''s grandfather reads him a story called The Princess Bride.', 'images/6dvi48bm12k79u09oubc5hjjj2_56.jpg', 69),
('Groundhog Day', 'Bill Murray, Andie MacDowell, Chris Elliott', 'A weatherman finds himself living the same day over and over again.', 'images/6dvi48bm12k79u09oubc5hjjj2_57.jpg', 70),
('The Truman Show', 'Jim Carrey, Ed Harris, Laura Linney', 'An insurance salesman/adjuster discovers his entire life is actually a T.V. show.', 'images/6dvi48bm12k79u09oubc5hjjj2_58.jpg', 71),
('Boiler Room', 'Giovanni Ribisi, Vin Diesel, Nia Long', 'A college dropout gets a job as a broker for a suburban investment firm, which puts him on the fast track to success, but the job might not be as legitimate as it sounds.', 'images/6dvi48bm12k79u09oubc5hjjj2_59.jpg', 72),
('Harry Potter and the Sorcerer''s Stone', 'Daniel Radcliffe, Rupert Grint, Richard Harris', 'Rescued from the outrageous neglect of his aunt and uncle, a young boy with a great destiny proves his worth while attending Hogwarts School of Witchcraft and Wizardry.', 'images/6dvi48bm12k79u09oubc5hjjj2_60.jpg', 73),
('The Program', 'James Caan, Halle Berry, Omar Epps', 'Several players from different backgrounds try to cope with the pressures of playing football at a major university. Each deals with the pressure differently, some turn to drinking, others to drugs, and some to studying.', 'images/6dvi48bm12k79u09oubc5hjjj2_62.jpg', 75),
('21', 'Jim Sturgess, Kate Bosworth, Kevin Spacey', '"21" is the fact-based story about six MIT students who were trained to become experts in card counting and subsequently took Vegas casinos for millions in winnings.', 'images/6dvi48bm12k79u09oubc5hjjj2_63.jpg', 76),
('The Skulls', 'Joshua Jackson, Paul Walker, Hill Harper', 'Luke McNamara, a college senior from a working class background joins a secret elitist college fraternity organization called "The Skulls", in hope of gaining acceptance into Harvard Law School.', 'images/6dvi48bm12k79u09oubc5hjjj2_64.jpg', 77),
('10 Things I Hate About You', 'Heath Ledger, Julia Stiles, Joseph Gordon-Levitt', 'A new kid must find a guy to date the meanest girl in school, the older sister of the girl he has a crush on, who cannot date until her older sister does.', 'images/6dvi48bm12k79u09oubc5hjjj2_65.jpg', 78),
('Harold & Kumar Go to White Castle', 'John Cho, Kal Penn, Ethan Embry', 'An Asian-American office worker and his Indian stoner friend embark on a quest to satisfy their desire for White Castle burgers.', 'images/6dvi48bm12k79u09oubc5hjjj2_66.jpg', 79),
('Swingers', 'Vince Vaughn, Heather Graham, Jon Favreau', 'Wannabe actors become regulars in the stylish neo-lounge scene; Trent teaches his friend Mike the unwritten rules of the scene.', 'images/6dvi48bm12k79u09oubc5hjjj2_67.jpg', 80),
('Ace Ventura', 'Jim Carrey, Courteney Cox, Sean Young', 'A goofy detective specializing in animals goes in search of a missing dolphin mascot of a football team.', 'images/6dvi48bm12k79u09oubc5hjjj2_68.jpg', 81),
('Varsity Blues', 'James Van Der Beek, Jon Voight, Paul Walker', 'A back-up quarterback is chosen to lead a Texas football team to victory after the star quarterback is injured.', 'images/6dvi48bm12k79u09oubc5hjjj2_69.jpg', 82),
('Accepted', 'Justin Long, Jonah Hill, Blake Lively', 'A high school slacker who''s rejected by every school he applies to opts to create his own institution of higher learning, the South Harmon Institute of Technology, on a rundown piece of property near his hometown.', 'images/6dvi48bm12k79u09oubc5hjjj2_70.jpg', 83),
('The Dark Knight', 'Christian Bale, Heath Ledger, Aaron Eckhart', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice.', 'images/6dvi48bm12k79u09oubc5hjjj2_71.jpg', 84),
('Blue Chips', 'Nick Nolte, Mary McDonnell, J.T. Walsh', 'A college basketball coach is forced to break the rules in order to get the players he needs to stay competitive', 'images/6dvi48bm12k79u09oubc5hjjj2_72.jpg', 85),
('Gladiator', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen', 'When a Roman general is betrayed and his family murdered by an emperor''s corrupt son, he comes to Rome as a gladiator to seek revenge.', 'images/6dvi48bm12k79u09oubc5hjjj2_73.jpg', 86);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(75) NOT NULL,
  `location` varchar(75) NOT NULL,
  `password` varchar(10) NOT NULL,
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `location`, `password`, `userid`, `username`) VALUES
('kapljr@farmingdale.edu', 'farmingdale', 'admin', 1, 'admin'),
('winnersall@gmail.com', 'bellmore', 'user', 2, 'user'),
('jon@smith.com', 'farmingdale', 'softball', 13, 'jonsmith'),
('bill@jones.com', 'farmingdale', 'softball', 14, 'billjones'),
('jamesjones@gmail.com', 'farmingdale', 'softball', 15, 'jamesjones');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
