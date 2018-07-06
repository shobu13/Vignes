CREATE TABLE magasin_contenucommande (
  id           integer,
  quantite     integer,
  produit_id   integer,
  commande_id  integer
);


INSERT INTO `magasin_contenucommande` (`id`, `quantite`, `produit_id`, `commande_id`) VALUES
  (8, 1, 7, 6),
  (9, 1, 7, 7);
