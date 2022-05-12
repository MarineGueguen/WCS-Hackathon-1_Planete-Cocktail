-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Octobre 2017 à 13:53
-- Version du serveur :  5.7.19-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cocktail_de_saison`
--

-- --------------------------------------------------------

--
-- Structure de la table `item`
--
DROP DATABASE IF EXISTS cocktail_de_saison;
CREATE DATABASE cocktail_de_saison;
USE cocktail_de_saison;

CREATE TABLE `month` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `ingredient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_local` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_ingredient_type` FOREIGN KEY (type_id) REFERENCES type(id)
);

CREATE TABLE `month_ingredient` (
  `month_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  KEY `month_ingredient_FK` (`month_id`),
  KEY `month_ingredient_FK_1` (`ingredient_id`),
  CONSTRAINT `fk_month_ingredient_month` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`),
  CONSTRAINT `fk_month_ingredient_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`)
);

CREATE TABLE `recipe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `recipe_ingredient` (
  `ingredient_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  KEY `recipe_ingredient_FK` (`ingredient_id`),
  KEY `recipe_ingredient_FK_1` (`recipe_id`),
  CONSTRAINT `fk_recipe_ingredient_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_recipe_ingredient_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`)
);

INSERT INTO month (name) VALUES ('janvier'), ('février'), ('mars'), ('avril'), ('mai'), ('juin'), ('juillet'), ('août'), ('septembre'), ('octobre'), ('novembre'), ('décembre');

INSERT INTO type (name) VALUES ('fruit'), ('légume'), ('autre');

-- FRUIT&LEG FROM FRANCE PART OF THE DATABASE 
INSERT INTO ingredient (name, type_id, image) VALUES
('brocoli', 2, '/assets/images/ingredients/icons8-broccoli.svg'),
('asperge', 2, '/assets/images/ingredients/icons8-asparagus.svg'),
('chou', 2, '/assets/images/ingredients/icons8-cabbage.svg'),
('chou-fleur', 2, '/assets/images/ingredients/icons8-cauliflower.svg'),
('courge', 2, '/assets/images/ingredients/icons8-courge.svg'),
('navet', 2, '/assets/images/ingredients/icons8-turnip.svg'),
('oignon', 2, '/assets/images/ingredients/icons8-onion.svg'),
('poireau', 2, '/assets/images/ingredients/icons8-leek.svg'),
('champignon', 2, '/assets/images/ingredients/icons8-mushroom.svg'),
('céleri', 2, '/assets/images/ingredients/icons8-celery.svg'),
('carotte', 2, '/assets/images/ingredients/icons8-carrot.svg'),
('betterave', 2, '/assets/images/ingredients/icons8-betterave.svg'),
('cresson', 2, '/assets/images/ingredients/icons8-drunk'),
('endive', 2, '/assets/images/ingredients/icons8-drunk'),
('epinard', 2, '/assets/images/ingredients/icons8-spinach.svg'),
('mache', 2, '/assets/images/ingredients/icons8-spinach.svg'),
('salsifis', 2, '/assets/images/ingredients/icons8-drunk'),
('potiron', 2, '/assets/images/ingredients/icons8-pumpkin.svg'),
('topinambour', 2, '/assets/images/ingredients/icons8-drunk'),
('panais', 2, '/assets/images/ingredients/icons8-parsnip.svg'),
('radis', 2, '/assets/images/ingredients/icons8-radish.svg'),
('fenouil', 2, '/assets/images/ingredients/icons8-fennel.svg'),
('artichaut', 2, '/assets/images/ingredients/icons8-artichoke.svg'),
('concombre', 2, '/assets/images/ingredients/icons8-cucumber.svg'),
('courgette', 2, '/assets/images/ingredients/icons8-zucchini.svg'),
('laitue', 2, '/assets/images/ingredients/icons8-lettuce-svg'),
('petit pois', 2, '/assets/images/ingredients/icons8-peas.svg'),
('aubergine', 2, '/assets/images/ingredients/icons8-aubergine.svg'),
('blette', 2, '/assets/images/ingredients/icons8-blette.svg'),
('haricot vert', 2, '/assets/images/ingredients/icons8-green-beans.svg'),
('poivron', 2, '/assets/images/ingredients/icons8-poivron.svg'),
('ail', 2, '/assets/images/ingredients/icons8-garlic.svg'),
('basilic', 2, '/assets/images/ingredients/icons8-basil.svg'),
('maïs', 2, '/assets/images/ingredients/icons8-corn.svg'),
('échalote', 2, '/assets/images/ingredients/icons8-drunk'),
('chou de Bruxelles', 2, '/assets/images/ingredients/icons8-drunk'),
('gingembre', 2, '/assets/images/ingredients/icons8-drunk'), 
('tomate', 1, '/assets/images/ingredients/icons8-tomato.svg'),
('jus de tomate', 1, '/assets/images/ingredients/icons8-tomato-juice.svg'),
('menthe', 1, '/assets/images/ingredients/icons8-mint.svg'),
('abricot', 1, '/assets/images/ingredients/icons8-apricot.svg'),
('cassis', 1, '/assets/images/ingredients/icons8-cassis.svg'),
('cerise', 1, '/assets/images/ingredients/icons8-cherry.svg'),
('figue', 1, '/assets/images/ingredients/icons8-fig.svg'),
('fraise', 1, '/assets/images/ingredients/icons8-strawberry'),
('framboise', 1, '/assets/images/ingredients/icons8-raspberry'), 
('groseille', 1, '/assets/images/ingredients/icons8-drunk'),
('melon', 1, '/assets/images/ingredients/icons8-melon.svg'),
('myrtille', 1, '/assets/images/ingredients/icons8-myrtille.svg'),
('nectarine', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('prune', 1, '/assets/images/ingredients/icons8-prune.svg'),
('mirabelle', 1, '/assets/images/ingredients/icons8-mirabelle.svg'),
('mûre', 1, '/assets/images/ingredients/icons8-blackberry.svg'),
('poire', 1, '/assets/images/ingredients/icons8-pear.svg'),
('pomme', 1, '/assets/images/ingredients/icons8-apple.svg'),
('quetsche', 1, '/assets/images/ingredients/icons8-quetsche.svg'),
('noisette', 1, '/assets/images/ingredients/icons8-hazelnut.svg'),
('noix', 1, '/assets/images/ingredients/icons8-nut.svg'),
('châtaigne', 1, '/assets/images/ingredients/icons8-chestnut.svg'),
('coing', 1, '/assets/images/ingredients/icons8-drunk'), 
('raisin', 1, '/assets/images/ingredients/icons8-grapes.svg'),
('citron', 1, '/assets/images/ingredients/icons8-citrus.svg'),
('jus de citron', 1, '/assets/images/ingredients/icons8-citrus.svg'),
('clémentine', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('kiwi', 1, '/assets/images/ingredients/icons8-kiwi.svg'),
('mandarine', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('orange', 1, '/assets/images/ingredients/icons8-orange.svg'),
('pamplemousse', 1, '/assets/images/ingredients/icons8-grapefruits.svg'),
('rhubarbe', 1, '/assets/images/ingredients/icons8-rhubarb.svg'),
('nectarine', 1, '/assets/images/ingredients/icons8-peach.svg'),
('brugnon', 1, '/assets/images/ingredients/icons8-peach.svg'),
('pêche', 1, '/assets/images/ingredients/icons8-peach.svg'),
('pastèque', 1, '/assets/images/ingredients/icons8-pasteque.svg');



-- EXOTIC PART OF THE DATABASE 
INSERT INTO ingredient (name, type_id, image, is_local) VALUES
('banane', 1, '/assets/images/ingredients/icons8-banana.svg', 0),
('ananas', 1, '/assets/images/ingredients/icons8-pineapple.svg', 0),
('jus d'\'ananas', 1, '/assets/images/ingredients/icons8-pineapple.svg', 0),
('avocat', 1, '/assets/images/ingredients/icons8-avocado.svg', 0),
('baie de goji', 1, '/assets/images/ingredients/icons8-goji.svg', 0),
('bergamote', 1, '/assets/images/ingredients/icons8-bergamot.svg', 0),
('carambole', 1, '/assets/images/ingredients/icons8-drunk', 0),
('kaki', 1, '/assets/images/ingredients/icons8-drunk', 0),
('noix de coco', 1, '/assets/images/ingredients/icons8-coconut.svg', 0),
('lait de coco', 3, '/assets/images/ingredients/icons8-coconut.svg', 0),
('mangue', 1, '/assets/images/ingredients/icons8-mango.svg', 0), 
('airelle', 1, '/assets/images/ingredients/icons8-cranberry.svg', 0),
('litchi', 1, '/assets/images/ingredients/icons8-lychee.svg', 0), 
('aloé véra', 1, '/assets/images/ingredients/icons8-aloe-vera.svg', 0),
('ugli', 1, '/assets/images/ingredients/icons8-tangelo.svg', 0);

-- OTHER MIXTURE FOR COCKTAILS 
INSERT INTO ingredient (name, type_id, image) VALUES
('sucre', 3, '/assets/images/ingredients/icons8-sugar.svg'),
('sirop', 3, '/assets/images/ingredients/icons8-syrup.svg'), 
('prosecco', 3, '/assets/images/ingredients/icons8-champagne-bottle.svg'), 
('champagne', 3, '/assets/images/ingredients/icons8-prosecco-bottle.svg'),
('vin blanc', 3, '/assets/images/ingredients/icons8-white-wine.svg'),
('vodka', 3, '/assets/images/ingredients/icons8-alcohol.svg'), 
('rhum', 3, '/assets/images/ingredients/icons8-rum.svg'),
('alcool de litchi', 3, '/assets/images/ingredients/icons8-lychee.svg'),
('glaçon', 3, '/assets/images/ingredients/icons8-ice-cube.svg'),
('gin', 3, '/assets/images/ingredients/icons8-gin.svg'),
('malibu', 3, '/assets/images/ingredients/icons8-alcohol.svg'),
('sucre de canne', 3, '/assets/images/ingredients/icons8-sugarcane.svg'),
('limonade', 3, '/assets/images/ingredients/icons8-soda-bottle.svg'), 
('fleur d'\'oranger', 3, '/assets/images/ingredients/icons8-orange-blossom.svg'),
('eau', 3, '/assets/images/ingredients/icons8-bottle-of-water.svg'),
('lait', 3, '/assets/images/ingredients/icons8-milk-bottle.svg'),
('cola', 1, '/assets/images/ingredients/icons8-cola.svg'),

INSERT INTO month_ingredient (month_id, ingredient_id) VALUES 
(9, 1), (10, 1), (11, 1),
(4, 2), (5, 2), (6, 2),
(1, 3), (2, 3), (3, 3), (10, 3), (11, 3), (12, 3),
(1, 4), (2, 4), (3, 4), (9, 4), (10, 4), (11, 4), (12, 4),
(1, 5), (9, 5), (10, 5), (11, 5), (12, 5),
(1, 6), (2, 6), (3, 6), (4, 6), (5, 6), (10, 6), (11, 6), (12, 6),
(1, 7), (2, 7), (3, 7), (4, 7), (9, 7), (10, 7), (11, 7), (12, 7),
(1, 8), (2, 8), (3, 8), (4, 8), (9, 8), (10, 8), (11, 8), (12, 8),
(1, 9), (2, 9), (3, 9), (4, 9), (5, 9), (6, 9), (7, 9), (8, 9), (9, 9), (10, 9), (11, 9), (12, 9),
(1, 10), (2, 10), (3, 10), (10, 10), (11, 10)  (12, 10),
(1, 11), (2, 11), (3, 11), (9, 11), (10, 11), (11, 11), (12, 11),
(1, 12), (2, 12), (3, 12), (10, 12), (11, 12), (12, 12),
(1, 13), (2, 13), (3, 13), (4, 13), (5, 13), (6, 13), (7, 13), (8, 13), (9, 13), (10, 13), (11, 13), (12, 13),
(1, 14), (2, 14), (3, 14), (4, 14), (5, 14), (10, 14),
(1, 15), (2, 15), (3, 15), (4, 15), (5, 15), (9, 15), (10, 15), (11, 15), (12, 15),
(1, 16), (2, 16), (10, 16), (11, 16), (12, 16),
(1, 17), (2, 17), (3, 17), (11, 17), (12, 17),
(1, 18), (9, 18), (10, 18), (11, 18), (12, 18),
(1, 19), (2, 19), (11, 19), (12, 19),
(1, 20), (2, 20), (3, 20), (10, 20), (11, 20), (12, 20),
(3, 21), (4, 21), (5, 21), (6, 21), (4, 22), (6, 22), (7, 22), (8, 22), (9, 22), (10, 22), (11, 22),
(5, 23), (6, 23), (7, 23), (8, 23), (9, 23),
(5, 24), (6, 24), (7, 24), (8, 24), (9, 24), (10, 24),
(5, 25), (6, 25), (7, 25), (8, 25), (9, 25), (10, 25),
(5, 26), (6, 26), (7, 26), (8, 26), (9, 26),
(5, 27), (6, 27), (7, 27),
(6, 28), (7, 28), (8, 28), (9, 28),
(6, 29), (7, 29), (8, 29), (9, 29), (10, 29), (11, 29),
(6, 30), (7, 30), (8, 30), (9, 30), (10, 30),
(6, 31), (7, 31), (8, 31), (9, 31),
(6, 32), (7, 32), (8, 32), (9, 32), (10, 32), (11, 32), (12, 32),
(6, 33), (7, 33), (8, 33),
(7, 34), (8, 34), (9, 34),
(10, 35), (11, 35), (12, 35),
(10, 36), (11, 36), (12, 36), (1, 36), (2, 36), (3, 36),
(9, 37), (10, 37), (11, 37), (12, 37), (1, 37), (2, 37),
(6, 38), (7, 38), (8, 38), (9, 38),
(6, 39), (7, 39), (8, 39), (9, 39),
(6, 40), (7, 40), (8, 40),
(6, 41), (7, 41), (8, 41),
(6, 42), (7, 42), (8, 42),
(6, 43), (7, 43),
(7, 44), (8, 44), (9, 44), (10, 44),
(6, 45), (7, 45), (8, 45),
(6, 46), (7, 46), (8, 46),
(6, 47), (7, 47), (8, 47),
(6, 48), (7, 48), (8, 48), (9, 48),
(7, 49), (8, 49), (9, 49),
(7, 50), (8, 50),
(7, 51), (8, 51), (9, 51),
(8, 52), (9, 52),
(8, 53), (9, 53),
(8, 54), (9, 54), (10, 54), (11, 54), (12, 54), (1, 54), (2, 54), (3, 54),
(8, 55), (9, 55), (10, 55), (11, 55), (12, 55), (1, 55), (2, 55), (3, 55), (4, 55),
(8, 56), (9, 56), (10, 56),
(9, 57), (10, 57), (11, 57), 
(9, 58), (10, 58),
(10, 59), (11, 59),
(10, 60),
(9, 61), (10, 61),
(1, 62), (2, 62),
(1, 63), (2, 63),
(11, 64), (12, 64), (1, 64), (2, 64),
(11, 65), (12, 65), (1, 65), (2, 65), (3, 65),
(11, 66), (12, 66), (1, 66), (2, 66),
(1, 67), (2, 67), (3, 67),
(1, 68), (2, 68), (3, 68), (4, 68), (5, 68), 
(4, 69), (5, 69), (6, 69),
(8, 70), (9, 70),
(7, 71), (8, 71), (9, 71),
(6, 72), (7, 72), (8, 72), (9, 72),
(6, 73), (7, 73), (8, 73), (9, 73),
(1, 74), (2, 74), (3, 74), (4, 74), (5, 74), (6, 74), (7, 74), (8, 74), (9, 74), (10, 74), (11, 74), (12, 74),
(1, 75), (2, 75), (3, 75), (4, 75), (5, 75), (6, 75), (7, 75), (8, 75), (9, 75), (10, 75), (11, 75), (12, 75),
(1, 76), (2, 76), (3, 76), (4, 76), (5, 76), (6, 76), (7, 76), (8, 76), (9, 76), (10, 76), (11, 76), (12, 76),
(1, 77), (2, 77), (3, 77), (4, 77), (5, 77), (6, 77), (7, 77), (8, 77), (9, 77), (10, 77), (11, 77), (12, 77),
(8, 78), (9, 78), (10, 78),
(12, 79), (1, 79), (2, 79), (3, 79),
(11, 80), (12, 80), (1, 80),
(10, 81), (11, 81), (12, 81), (1, 81),
(11, 82), (12, 82), (1, 82), (2, 82),
(11, 83), (12, 83), (1, 83), (2, 83),
(1, 84), (2, 84), (3, 84), (4, 84), (5, 84), (6, 84), (7, 84), (8, 84), (9, 84), (10, 84), (11, 84), (12, 84),
(7, 85), (8, 85),
(11, 86), (12, 86), (1, 86), (6, 86), (7, 86), (8, 86),
(1, 87), (2, 87), (3, 87), (4, 87), (5, 87), (6, 87), (7, 87), (8, 87), (9, 87), (10, 87), (11, 87), (12, 87),
(1, 88), (2, 88);
