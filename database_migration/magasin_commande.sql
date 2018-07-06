CREATE TABLE magasin_commande (
  id             integer,
  montant        real,
  est_panier     bool,
  envoie         bool,
  est_envoyee    bool,
  est_archivee   bool,
  est_payee      bool,
  client_id      integer,
  frais_port_id  integer,
  "date"         datetime
);


INSERT INTO `magasin_commande` (`id`, `montant`, `est_panier`, `envoie`, `est_envoyee`, `est_archivee`, `est_payee`, `client_id`, `frais_port_id`, `date`) VALUES
  (6, 36, '0', '1', '0', '0', '0', 1, 1, '2018-07-05 18:03:08'),
  (7, 36, '0', '1', '0', '0', '0', 1, 1, '2018-07-05 18:03:08');
