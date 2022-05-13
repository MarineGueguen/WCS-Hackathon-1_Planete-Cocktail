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
('cresson', 2, '/assets/images/ingredients/icons8-drunk.svg'),
('endive', 2, '/assets/images/ingredients/icons8-drunk.svg'),
('epinard', 2, '/assets/images/ingredients/icons8-spinach.svg'),
('mache', 2, '/assets/images/ingredients/icons8-spinach.svg'),
('salsifis', 2, '/assets/images/ingredients/icons8-drunk.svg'),
('potiron', 2, '/assets/images/ingredients/icons8-pumpkin.svg'),
('topinambour', 2, '/assets/images/ingredients/icons8-drunk.svg'),
('panais', 2, '/assets/images/ingredients/icons8-parsnip.svg'),
('radis', 2, '/assets/images/ingredients/icons8-radish.svg'),
('fenouil', 2, '/assets/images/ingredients/icons8-fennel.svg'),
('artichaut', 2, '/assets/images/ingredients/icons8-artichoke.svg'),
('concombre', 2, '/assets/images/ingredients/icons8-cucumber.svg'),
('courgette', 2, '/assets/images/ingredients/icons8-zucchini.svg'),
('laitue', 2, '/assets/images/ingredients/icons8-lettuce.svg'),
('petit pois', 2, '/assets/images/ingredients/icons8-peas.svg'),
('aubergine', 2, '/assets/images/ingredients/icons8-aubergine.svg'),
('blette', 2, '/assets/images/ingredients/icons8-blette.svg'),
('haricot vert', 2, '/assets/images/ingredients/icons8-green-beans.svg'),
('poivron', 2, '/assets/images/ingredients/icons8-poivron.svg'),
('ail', 2, '/assets/images/ingredients/icons8-garlic.svg'),
('basilic', 2, '/assets/images/ingredients/icons8-basil.svg'),
('maïs', 2, '/assets/images/ingredients/icons8-corn.svg'),
('échalote', 2, '/assets/images/ingredients/icons8-drunk.svg'),
('chou de Bruxelles', 2, '/assets/images/ingredients/icons8-drunk.svg'),
('gingembre', 2, '/assets/images/ingredients/icons8-drunk.svg'), 
('tomate', 1, '/assets/images/ingredients/icons8-tomato.svg'),
('jus de tomate', 3, '/assets/images/ingredients/icons8-tomato-juice.svg'),
('menthe', 1, '/assets/images/ingredients/icons8-mint.svg'),
('abricot', 1, '/assets/images/ingredients/icons8-apricot.svg'),
('cassis', 1, '/assets/images/ingredients/icons8-cassis.svg'),
('cerise', 1, '/assets/images/ingredients/icons8-cherry.svg'),
('figue', 1, '/assets/images/ingredients/icons8-fig.svg'),
('fraise', 1, '/assets/images/ingredients/icons8-strawberry.svg'),
('framboise', 1, '/assets/images/ingredients/icons8-raspberry.svg'), 
('groseille', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('melon', 1, '/assets/images/ingredients/icons8-melon.svg'),
('myrtille', 1, '/assets/images/ingredients/icons8-myrtille.svg'),
('nectarine', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('prune', 1, '/assets/images/ingredients/icons8-prune.svg'),
('mirabelle', 1, '/assets/images/ingredients/icons8-mirabelle.svg'),
('mûre', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('poire', 1, '/assets/images/ingredients/icons8-pear.svg'),
('pomme', 1, '/assets/images/ingredients/icons8-apple.svg'),
('quetsche', 1, '/assets/images/ingredients/icons8-quetsche.svg'),
('noisette', 1, '/assets/images/ingredients/icons8-hazelnut.svg'),
('noix', 1, '/assets/images/ingredients/icons8-nut.svg'),
('châtaigne', 1, '/assets/images/ingredients/icons8-chestnut.svg'),
('coing', 1, '/assets/images/ingredients/icons8-drunk.svg'), 
('raisin', 1, '/assets/images/ingredients/icons8-grapes.svg'),
('citron', 1, '/assets/images/ingredients/icons8-citrus.svg'),
('jus de citron', 1, '/assets/images/ingredients/icons8-citrus.svg'),
('clémentine', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('kiwi', 1, '/assets/images/ingredients/icons8-kiwi.svg'),
('mandarine', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('orange', 1, '/assets/images/ingredients/icons8-orange.svg'),
('pamplemousse', 1, '/assets/images/ingredients/icons8-grapefruit.svg'),
('rhubarbe', 1, '/assets/images/ingredients/icons8-rhubarb.svg'),
('nectarine', 1, '/assets/images/ingredients/icons8-peach.svg'),
('brugnon', 1, '/assets/images/ingredients/icons8-peach.svg'),
('pêche', 1, '/assets/images/ingredients/icons8-peach.svg'),
('pastèque', 1, '/assets/images/ingredients/icons8-watermelon.svg');



-- EXOTIC PART OF THE DATABASE 
INSERT INTO ingredient (name, type_id, image, is_local) VALUES
('banane', 1, '/assets/images/ingredients/icons8-banana.svg', 0),
('ananas', 1, '/assets/images/ingredients/icons8-pineapple.svg', 0),
("jus d'ananas", 3, '/assets/images/ingredients/icons8-pineapple.svg', 0),
('avocat', 1, '/assets/images/ingredients/icons8-avocado.svg', 0),
('baie de goji', 1, '/assets/images/ingredients/icons8-goji.svg', 0),
('bergamote', 1, '/assets/images/ingredients/icons8-bergamot.svg', 0),
('carambole', 1, '/assets/images/ingredients/icons8-drunk.svg', 0),
('kaki', 1, '/assets/images/ingredients/icons8-drunk.svg', 0),
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
("fleur d'oranger", 3, '/assets/images/ingredients/icons8-orange-blossom.svg'),
('eau', 3, '/assets/images/ingredients/icons8-bottle-of-water.svg'),
('lait', 3, '/assets/images/ingredients/icons8-milk-bottle.svg'),
('cola', 1, '/assets/images/ingredients/icons8-cola.svg'),
('cointreau', 3, '/assets/images/ingredients/icons8-drunk.svg'),
('tequila', 3, '/assets/images/ingredients/icons8-drunk.svg'),
('eau gazeuse', 3, '/assets/images/ingredients/icons8-bottle-of-water.svg'),
('citron vert', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('cannelle', 3, '/assets/images/ingredients/icons8-drunk.svg'),
('grenadine', 3, '/assets/images/ingredients/icons8-drunk.svg'),
('apérol', 3, '/assets/images/ingredients/icons8-drunk.svg'),
('orange sanguine', 1, '/assets/images/ingredients/icons8-drunk.svg'),
('miel', 3, '/assets/images/ingredients/icons8-drunk.svg'),
('schweppes', 3, '/assets/images/ingredients/icons8-drunk.svg'),
('thym', 2, '/assets/images/ingredients/icons8-drunk.svg'),
('grenade', 1, '/assets/images/ingredients/icons8-drunk.svg');

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
(1, 10), (2, 10), (3, 10), (10, 10), (11, 10), (12, 10),
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
(1, 88), (2, 88),
(11, 109), (12,109), (1, 109), (2,109), (3, 109),
(12,113), (1, 113), (2,113), (3, 113),
(6, 116), (7, 116), (8, 116), (9, 116),
(11, 117), (12,117), (1, 117), (2,117);

INSERT INTO recipe (name, description, image) VALUES
('Détox', "Commencez par épluchez les carottes puis coupez-les en rondelles.
Epépinez la pomme et coupez-la en rondelles.
Mettez dans un Blender tous les ingrédients.
Mixez jusqu’à l’obtention d’une texture bien lisse et crémeuse.
Servez et régalez-vous.", 'https://images2.imgbox.com/d1/48/VlSdgyu3_o.jpg'),
('Mimosa', "Si vous avez opté pour des oranges fraîches, pressez-les puis transvasez 6 cl dans chaque coupe. 
Ensuite, versez le champagne par-dessus. Voilà, le tour est joué, votre cocktail mimosa est déjà prêt !", 'https://images2.imgbox.com/73/b9/e3jYRND1_o.jpeg'),
('Pamplemoussade', "Versez le jus de pamplemousse et le gingembre dans un long verre puis mélangez doucement à l’aide d’une cuillère.
Ajoutez quelques glaçons puis complétez avec le champagne à hauteur désirée.
Découpez un quart de votre tranche de pamplemousse puis disposez-la sur votre verre en guise de décoration.", 'https://images2.imgbox.com/10/38/A7h42auk_o.jpg'),
("Margarita à l’orange", "Dans un premier temps, rincez et séchez les oranges. Coupez ensuite deux rondelles fines que vous viendrez découper en 2 pour le décor.
Pressez les oranges et les citrons.
Dans une grande carafe, mélangez le jus d’orange et de citron avec le Cointreau, la tequila et le sirop de sucre de canne.
Pour décorer le bord du verre, deux choix s’offrent à vous : avec du sucre ou du sel. 
Pour terminer, remplissez chacun des verres, ajoutez la glace pilée, disposez le quartier d’orange en décoration et le tour est joué !", 'https://images2.imgbox.com/17/a2/zFAJvX94_o.jpg'),
('Paloma', "Réservez les verres à cocktails au congélateur quelques minutes.<br
Une fois bien frais, versez dans chacun d’eux 4 cl de tequila puis ajoutez le jus de pamplemousse et citron vert.
Terminez par un peu d’eau gazeuse et servez aussitôt les Palomas", 'https://images2.imgbox.com/21/6b/Y5e1TSAS_o.jpg'),
('Gin Tonic Epicé', "Récolter le zeste d’un pamplemousse et en récupérer le jus. Faire chauffer le jus et le zeste avec 1 bâton de cannelle pendant 30 minutes à couvert.
Filtrer le jus à l’aide d’un tamis et le verser dans chaque verre. Couper 4 quartiers de pamplemousse et presser le reste. Verser le jus obtenu ainsi que le gin et l’eau pétillante.
Dans chaque verre, déposer 2 glaçons et garnir avec un quartier de pamplemousse et 1 demi-bâton de cannelle.", 'https://images2.imgbox.com/b9/56/ys18NTQo_o.jpg'),
('Sangria blanche', "Presser les deux citrons verts pour en récolter le jus. Mélanger le vin et le jus de citron vert.
Couper les pêches jaunes et blanches en quartiers puis les ajouter au mélange précédent.
Ajouter la limonade et les glaçons puis servir cette pétillante sangria blanche.", 'https://images2.imgbox.com/1a/4a/llfWYIfo_o.jpg'),
('Tequila Sunrise', "Dans un verre à cocktail, mélanger le jus de citron et la tequila puis ajouter les glaçons et le jus d’orange.
Terminer en versant délicatement le sirop de grenadine avant de déguster cette rafraîchissante tequila sunrise.", 'https://images2.imgbox.com/1a/4a/llfWYIfo_o.jpg'),
('Spritz', "Verser l’Apérol dans un verre à cocktail. Ajouter le vin blanc pétillant et les glaçons.
Ajouter l’eau tonique et terminer par quelques rondelles ou quartiers d’orange sanguine non traitée.", 'https://images2.imgbox.com/a4/4d/HfKBDywc_o.jpg'),
('Mojito framboise', "Dans un grand verre, déposer les tranches ou quartiers de citron vert, les framboises, le sucre et quelques feuilles de menthe. Écraser le tout à l’aide d’un pilon ou d’une cuillère afin d’obtenir une purée.
Ajouter les glaçons ou la glace pilée et arrosée de rhum et eau pétillante. Mélanger bien.", 'https://images2.imgbox.com/31/71/VFtKsSI6_o.jpg'),
('Vodka Pastèque', "La veille, couper la pastèque en deux puis vider une des deux moitiés et la déposer dans un mixeur. Réserver l’autre moitié au réfrigérateur.
Verser le jus obtenu dans des bacs à glaçons et réserver au congélateur.
Le lendemain, mixer la seconde moitié de pastèque jusqu’à obtenir un jus homogène. Filtrer la préparation puis ajouter les glaçons à la pastèque.
Incorporer le jus de citron et la vodka. Mélanger puis agrémenter de morceaux de pastèque et rondelles de citrons verts.", 'https://imgbox.com/IvP0p9gW'),
('Granité ananas-pêche au vin blanc', "Dans un mixeur, placer tous les ingrédients et mixer jusqu’à l’obtention d’un mélange homogène.
Verser la préparation dans un verre puis ajouter la glace pilée.", 'https://images2.imgbox.com/0d/2e/y5TtcBTQ_o.jpg'),
('Prosecco fraise-melon', "Coupez une extrémité de votre melon, saisissez une cuillère à soupe et retirez la chair du fruit en épépinant les morceaux.
Déposez dans un mixeur la chair du melon ainsi que les fraises, la vodka et le miel. Mixez.
Versez le cocktail dans un bac à glaçons et agrémentez de feuilles de menthe. Placer 2 h au congélateur.
Sortez du congélateur et mixer avec 200 ml de prosecco. Servez immédiatement !", 'https://images2.imgbox.com/64/03/zJG3vhBR_o.png'),
('Gin Tonic Concombre', "Pelez le concombre et réalisez de très fines lamelles à l’aide d’une mandoline ou d’un économe. Dans un grand verre, déposez les glaçons et quelques tranches de concombres.
Arrosez le tout de menthe puis ajoutez le gin et le schweppes tonic. Accompagnez le cocktail avec un zeste de citron vert.
Servez le gin tonic bien frais avec une rondelle de citron et profitez de sa délicieuse saveur.", 'https://images2.imgbox.com/b4/64/XJpwiVOS_o.jpg'),
('Oranade', "Coupez la grenade en deux, récoltez le jus et prélevez les graines. Répartissez dans 4 verres. Ajoutez le sirop de grenadine.
Versez le champagne en inclinant légèrement le verre pour qu'il ne se mélange pas entièrement avec la grenadine.
Mettez les glaçons et les rondelles d'orange. Décorez avec une pointe de thym avant de servir.", 'https://images2.imgbox.com/f0/8a/QMBocwVU_o.jpg'),
('Cocktail fruité', "Lavez et séchez le basilic et mettez-le dans une carafe. Lavez le concombre et coupez-le en rondelles fines en biais. Ajoutez dans la carafe.
Lavez et séchez les prunes, coupez-les en deux et ôtez le noyau. Coupez en lamelles. Lavez la pomme, coupez-la en deux et ôtez le trognon. Détaillez en tranches fines. Mettez les fruits émincés dans la carafe.
Remplissez avec les 2 jus, ajouter la tequila, puis réservez au réfrigérateur pendant 1 heure.
Mettez quelques glaçons dans 4 verres et versez le cocktail avec les fruits. Décorez avec du basilic avant de servir.", 'https://images2.imgbox.com/6a/b1/4hOsL9kT_o.jpg'),
('Cocktail mûre-airelles', "Mettez les mûres au congélateur pendant au moins 1 heure. Lavez et effeuillez un brin de thym.
Réservez huit mûres au congélateur pour la finition. Mettez le reste dans un mixeur. Ajoutez le jus de cranberry et le thym effeuillé. Mixez jusqu'à l'obtention d'un jus homogène. Ajouter la vodka.
Répartissez le jus dans quatre verres en le passant au travers d'une passoire fine. Ajoutez quelques glaçons, les mûres réservées et un brin de thym.", 'https://images2.imgbox.com/46/37/Rii4P1Dj_o.jpg'),
('Brocolicieux', "Placez tous les ingrédients dans le blender et mixez. Versez dans un verre et décorez d’une tranche de pomme.", 'https://images2.imgbox.com/f8/54/PVwerTVH_o.jpg'),
('La veuve noire', "Mixez finement les mûres avec les feuilles de romarin, le jus de citron et le miel. Versez le Mezcal, mélangez bien et passez au tamis.
Remplissez un verre de glaçons. Versez le cocktail et terminez par un trait d’eau pétillante. Décorez de mûres.", 'https://images2.imgbox.com/66/1e/tzYaxwzP_o.jpg'),
('Le Hulk', "Mixez tous les ingrédients au blender. Versez dans un verre et décorez de baies de goji et de cresson.", 'https://images2.imgbox.com/fe/3b/Ab7MMJVm_o.jpg'),
('Sangria pomme, orange, grenade', " Versez le vin et le jus de grenade dans une grande carafe. Ajoutez 2 bâtons de cannelle. Nettoyez soigneusement l'orange et la pomme (de préférence bio). Découpez-les en tranches, puis en triangles. Ajoutez à la préparation. Découpez la grenade en deux, récupérez les graines et ajoutez à la préparation (si la grenade est grosse, une partie des graines suffit). Versez le miel. Mélangez le tout.
Placez la carafe au frigo minimum 2 h (de préférence une nuit).", 'https://images2.imgbox.com/30/61/zBzuc4qB_o.jpg'),
('Summer vibes', "Ajoutez le jus de betterave, le sucre, la cannelle, le jus de citron et le rhum. Ajoutez les glaçons dans le shaker, puis remuez vigoureusement.
Versez le contenu dans un verre à vin en le filtrant à l’aide d’une passoire.", 'https://images2.imgbox.com/70/30/7nJfEGiR_o.jpeg'),
('Mojito potiron', " Préparez le cocktail au verre. Pour chaque verre, disposez dans un shaker 10 feuilles de menthe, 1 c à s de sucre de canne, 40 cl de rhum, 1 c à s de purée de potiron et le jus d'1/2 citron vert. Complétez le shaker avec des glaçons. Secouez pour mélanger et refroidir la préparation.
Versez dans un verre à mojito au travers d'un tamis. Allongez à l'eau pétillante. Décorez avec quelques glaçons et une branche de menthe.", 'https://images2.imgbox.com/85/93/ntUtFzB7_o.jpg'),
('Punch poire, ananas, gingembre', "Lavez la poire et passez-la à la centrifugeuse. Mélangez la purée obtenue, dans un shaker ou dans un bocal, avec le jus d'ananas, le sirop de gingembre, le rhum, la menthe et des glaçons. Secouez vigoureusement et réservez, 30 mn, au frigo.", 'https://images2.imgbox.com/06/35/7OxTw8TH_o.jpg'),
('Rhubarbe sour', "Préparez le sirop de rhubarbe : coupez la rhubarbe en morceaux, versez-les dans une casserole et portez à ébullition avec le sucre, l'eau et le gingembre. Laisser mijoter, 15 min, à feu doux. Filtrez et laissez refroidir.
Dans un shaker, versez le sirop de rhubarbe, le jus de citron, le gin et des glaçons et secouez. Remplissez les verres de glaçons et versez le cocktail. Terminez avec une tranche de citron et un brin de menthe. ", 'https://images2.imgbox.com/ba/b1/yRHgNUDb_o.jpg'),
('DaÏquiri céleri', "Humecter le rebord de deux verres à margarita avec un quartier de lime et les tremper dans le sucre. Réserver.
Au mélangeur, réduire tous les ingrédients en purée lisse (slush). Verser dans les verres et garnir d’un quartier de lime, si désiré.", 'https://images2.imgbox.com/e5/97/GiYWMaqe_o.jpg'),
('Avocado Daîquiri', "Vous mettez tous les ingrédients dans un blender ou dans un skaker.
Vous mixez quelques secondes ou vous secouez quelques minutes jusqu’à ce que ce soit bien lisse.
Servez avec une rondelle de citron vert.", 'https://images2.imgbox.com/25/01/okSCyZMp_o.jpg'),
('Le Saint Patrick', "Versez le gin, le jus (kiwi/fenouil/vert de blette/citron), dans la partie Inférieure du shaker. Ajoutez les glaçons.
Ajustez la partie supérieure le shaker. Agitez vivement le shaker 8 à 10 seconde.
Servir dans un verre à martini.", 'https://images2.imgbox.com/a7/28/W02M64IP_o.jpg'),
('Cointreau carotte', "Écrasez au pilon le basilic dans un verre. 
Ajoutez les autres ingrédients avec des glaçons et mélangez.
Décorez d'une feuille de basilic.", 'https://images2.imgbox.com/41/b6/a7KiCtqW_o.jpg'),
("Le P'tit chou", "Placer tous les ingrédients dans une machine à jus et mixer. Placer ensuite le mélange dans le shaker et secouer. Verser le tout dans un verre avec des glaçons. Garnir de chou kale sec.", 'https://images2.imgbox.com/bf/31/7CbtmnL0_o.jpg');



INSERT INTO recipe_ingredient (ingredient_id, recipe_id) VALUES
(1,1), (11,1), (55,1),
(67,2), (91,2),
(68,3), (37,3), (92,3),
(62,4), (67,4), (106,4), (107,4), (100,4),
(68,5), (109,5), (107,5), (108,5),
(68,6), (110,6), (98,6), (108,6),
(109, 7), (72, 7), (93, 7), (101, 7),
(111, 8), (107,8), (67, 8), (62, 8),
(112, 9), (91, 9), (113, 9), (108, 9), 
(109,10), (47,10), (89,10), (40,10), (95,10), (108,10),
(73, 11), (109, 11), (94, 11),
(75, 12), (72, 12), (93, 12),
(48,13), (45,13), (114, 13), (94, 13), (91,13), (40,13),
(98,14), (115,14), (109,14), (40,14), (24,14),
(111,15), (116,15), (67, 15), (117, 15), (92,15),
(33,16), (24,16), (51,16), (55,16), (61,16), (107,16),
(85, 17), (53, 17), (116, 17), (94, 17),
(94,18), (1, 18), (10,18), (74,18), (55,18), (114,18), (40,18),
(53,19), (62, 19), (114,19), (94,19), (108,19),
(13,20), (15, 20), (74,20), (54,20), (83,20), (78,20),
(93, 21), (117,21), (110, 21), (114, 21), (55,21), (67,21),
(12, 22), (89, 22), (110, 22), (62,22), (95,22),
(109,23), (95,23), (40, 23), (108, 23), (18, 23), (100, 23), 
(95, 24), (40, 24), (76,24), (89, 24), (37, 24), (54,24),
(62, 25), (69,25), (40, 25), (98,25), (89, 25),
(62, 26), (10, 26), (95, 26), (89, 26),
(95, 27), (100,27), (109, 27), (77,27),
(98,28), (81, 28), (22, 28), (29,28), (62,28),
(106, 29), (109,29), (11,29), (33, 29),
(94, 30), (3,30), (62,30), (37,30), (24, 30), (55, 30), (10, 30);
