CREATE TABLE departments
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    number VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE trees
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    number INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE risks
(
    id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    risk FLOAT NOT NULL,
    departments_id INT(11) NOT NULL,
    trees_id INT(11) NOT NULL,
    CONSTRAINT risks_departments_id_fk FOREIGN KEY (departments_id) REFERENCES departments (id),
    CONSTRAINT risks_trees_id_fk FOREIGN KEY (trees_id) REFERENCES trees (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE INDEX risks_departments_id_fk ON risks (departments_id);
CREATE INDEX risks_trees_id_fk ON risks (trees_id);

INSERT INTO `departments` (`id`, `name`, `number`) VALUES
  (1, 'Ain', '01'),
  (2, 'Aisne', '02'),
  (3, 'Allier', '03'),
  (4, 'Alpes de Haute Provence', '04'),
  (5, 'Hautes-Alpes', '05'),
  (6, 'Alpes-Maritimes', '06'),
  (7, 'Ardèches', '07'),
  (8, 'Ardennes', '08'),
  (9, 'Arièges', '09'),
  (10, 'Aube', '10'),
  (11, 'Aude', '11'),
  (12, 'Aveyron', '12'),
  (13, 'Bouche du Rhône', '13'),
  (14, 'Calvados', '14'),
  (15, 'Cantal', '15'),
  (16, 'Charente', '16'),
  (17, 'Charente Maritime', '17'),
  (18, 'Cher', '18'),
  (19, 'Corrèze', '19'),
  (20, 'Corse', '20'),
  (21, 'Côte d\'Or', '21'),
  (22, 'Côte d\'Armor', '22'),
  (23, 'Creuse', '23'),
  (24, 'Dordogne', '24'),
  (25, 'Doubs', '25'),
  (26, 'Drôme', '26'),
  (27, 'Eure', '27'),
  (28, 'Eure et Loire', '28'),
  (29, 'Finistère', '29'),
  (30, 'Gard', '30'),
  (31, 'Haute Garonne', '31'),
  (32, 'Gers', '32'),
  (33, 'Gironde', '33'),
  (34, 'Hérault', '34'),
  (35, 'Ille et Vilaine', '35'),
  (36, 'Indre', '36'),
  (37, 'Indre et Loire', '37'),
  (38, 'Isère', '38'),
  (39, 'Jura', '39'),
  (40, 'Landes', '40'),
  (41, 'Loir et Cher', '41'),
  (42, 'Loire', '42'),
  (43, 'Haute Loire', '43'),
  (44, 'Loire Atlantique', '44'),
  (45, 'Loiret', '45'),
  (46, 'Lot', '46'),
  (47, 'Lot et Garonne', '47'),
  (48, 'Lozère', '48'),
  (49, 'Maine et Loire', '49'),
  (50, 'Manche', '50'),
  (51, 'Marne', '51'),
  (52, 'Haute Marne', '52'),
  (53, 'Mayenne', '53'),
  (54, 'Meurthe et Moselle', '54'),
  (55, 'Meuse', '55'),
  (56, 'Morbihan', '56'),
  (57, 'Moselle', '57'),
  (58, 'Nièvre', '58'),
  (59, 'Nord', '59'),
  (60, 'Oise', '60'),
  (61, 'Orne', '61'),
  (62, 'Pas de Calais', '62'),
  (63, 'Puy de Dôme', '63'),
  (64, 'Pyrénées Atlantiques', '64'),
  (65, 'Haute Pyrénées', '65'),
  (66, 'Pyrénées Orientales', '66'),
  (67, 'Bas Rhin', '67'),
  (68, 'Haut Rhin', '68'),
  (69, 'Rhône', '69'),
  (70, 'Haute Saône', '70'),
  (71, 'Saône et Loire', '71'),
  (72, 'Sarthe', '72'),
  (73, 'Savoie', '73'),
  (74, 'Haute Savoie', '74'),
  (75, 'Paris', '75'),
  (76, 'Seine Maritime', '76'),
  (77, 'Seine et Marne', '77'),
  (78, 'Yvelines', '78'),
  (79, 'Deux Sèvres', '79'),
  (80, 'Somme', '80'),
  (81, 'Tarn', '81'),
  (82, 'Tarn et Garonne', '82'),
  (83, 'Var', '83'),
  (84, 'Vaucluse', '84'),
  (85, 'Vendée', '85'),
  (86, 'Vienne', '86'),
  (87, 'Haute Vienne', '87'),
  (88, 'Vosges', '88'),
  (89, 'Yonne', '89'),
  (90, 'Territoire de Belfort', '90'),
  (91, 'Essonne', '91'),
  (92, 'Hauts de Seine', '92'),
  (93, 'Seine Saint Denis', '93'),
  (94, 'Val de Marne', '94'),
  (95, 'Val d\'Oise', '95'),
  (96, 'Andore', '99');

INSERT INTO `trees` (`id`, `name`, `number`) VALUES
  (1, 'Cupressacées', '01'),
  (2, 'Noisetier', '02'),
  (3, 'Aulne', '03'),
  (4, 'Peuplier', '04'),
  (5, 'Saule', '05'),
  (6, 'Frêne', '06'),
  (7, 'Charme', '07'),
  (8, 'Bouleau', '08'),
  (9, 'Platane', '09'),
  (10, 'Chêne', '10'),
  (11, 'Olivier', '11'),
  (12, 'Tilleul', '12'),
  (13, 'Châtaignier', '13'),
  (14, 'Rumex', '14'),
  (15, 'Graminées', '15'),
  (16, 'Plantain', '16'),
  (17, 'Urticacées', '17'),
  (18, 'Armoises', '18'),
  (19, 'Ambroises', '19');

INSERT INTO `risks` (`id`, `risk`, `department_id`, `tree_id`) VALUES
  (1, 1, 1, 1),
  (2, 2, 1, 2),
  (3, 3, 1, 3),
  (4, 4, 1, 4),
  (5, 5, 1, 5),
  (6, 1, 1, 6),
  (7, 2, 1, 7),
  (8, 3, 1, 8),
  (9, 4, 1, 9),
  (10, 5, 1, 10),
  (11, 1, 1, 11),
  (12, 2, 1, 12),
  (13, 3, 1, 13),
  (14, 4, 1, 14),
  (15, 5, 1, 15),
  (16, 1, 1, 16),
  (17, 2, 1, 17),
  (18, 3, 1, 18),
  (19, 4, 1, 19),
  (20, 1, 2, 1),
  (21, 2, 2, 2),
  (22, 3, 2, 3),
  (23, 4, 2, 4),
  (24, 5, 2, 5),
  (25, 1, 2, 6),
  (26, 2, 2, 7),
  (27, 3, 2, 8),
  (28, 4, 2, 9),
  (29, 5, 2, 10),
  (30, 1, 2, 11),
  (31, 2, 2, 12),
  (32, 3, 2, 13),
  (33, 4, 2, 14),
  (34, 5, 2, 15),
  (35, 1, 2, 16),
  (36, 2, 2, 17),
  (37, 3, 2, 18),
  (38, 4, 2, 19);