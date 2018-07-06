CREATE TABLE django_content_type (
  id         integer,
  app_label  varchar(100),
  model      varchar(100)
);


INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
  (1, 'admin', 'logentry'),
  (2, 'auth', 'permission'),
  (3, 'auth', 'group'),
  (4, 'contenttypes', 'contenttype'),
  (5, 'sessions', 'session'),
  (6, 'ipn', 'paypalipn'),
  (7, 'website', 'acceuilcard'),
  (8, 'website', 'cardimage'),
  (9, 'website', 'diver'),
  (10, 'website', 'boutiqueimage'),
  (11, 'magasin', 'categorie'),
  (12, 'magasin', 'commande'),
  (13, 'magasin', 'contenucommande'),
  (14, 'magasin', 'marque'),
  (15, 'magasin', 'produit'),
  (16, 'magasin', 'souscategorie'),
  (17, 'magasin', 'typesproduit'),
  (18, 'magasin', 'fraisdeport'),
  (19, 'user', 'user'),
  (20, 'event', 'event'),
  (21, 'event', 'eventimage'),
  (22, 'event', 'eventtype');
