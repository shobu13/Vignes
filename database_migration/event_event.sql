CREATE TABLE event_event (
  id           integer,
  nom          varchar(200),
  description  text,
  lieu         varchar(100),
  "date"       date,
  heure        time,
  type_id      integer
);


INSERT INTO `event_event` (`id`, `nom`, `description`, `lieu`, `date`, `heure`, `type_id`) VALUES
  (1, 'Soir�e d�gustation rhum avec chants marins', 'Une soir�e pour d�couvrir notre gamme de rhum accompagn� par des chants marins', 'Laill�', '2017-03-02', '20:00:00', 1),
  (2, 'Visite chateauneuf du pape', 'Visite domaine alain jaume', 'CHATEAUNEUF DU PAPE', '2016-08-13', '15:00:00', 1),
  (3, 'Du vin et des gourmandises', 'La passion et le partage', 'Laille', '2016-03-03', '14:00:00', 1),
  (4, 'Soir�e avec guillaume joubin ancien sommelier de l', 'Soir�e � themes rhone', 'Laill�', '2016-05-19', '19:30:00', 1),
  (5, 'Soir�e avec pascal pochon chocolatier st malo', 'D�gustation de chocolats  \r\naccords mets et vin', 'Laill�', '2016-06-04', '17:00:00', 1),
  (6, 'Visite pichon longueville bordeaux', 'Rencontre avec les vignerons � bordeaux \r\n', 'Bordeaux', '2015-09-11', '16:00:00', 1),
  (7, 'Salon de paris', 'D�gustations alcools fort', 'Paris', '2016-10-10', '09:00:00', 1),
  (8, 'Salon vignes et vilaine', 'Salon de la loire', 'Laill�', '2016-11-25', '09:00:00', 1),
  (9, 'Rencontre avec monsieur rety ', 'Rencontre avec monsieur rety( vigneron\r\ndomaine rety)le domaine rety vient de recevoir 3 �toiles dans le nouveau guide\r\nhachette des vins 2018.le vin rouge prim� est le cote du roussillon l''insolente\r\nmill�sim� 2015 qui a re�u une note de 5 sur 5 soit 3 �toiles vin exceptionnel.', 'Melesse', '2017-09-11', '17:30:00', 1),
  (10, 'Soir�e champagnes jean despret', 'D�gustation de la gamme jean despret', 'Laill�', '2017-11-18', '19:30:00', 1),
  (12, 'Soir�e domaine rety', 'Animation du vigneron monsieur rety et d�couverte des vins du domaine.', 'Laill�', '2017-12-08', '19:30:00', 1),
  (13, 'Salon des vignerons ind�pendants rennes', '300exposants', 'Rennes', '2018-01-28', '09:30:00', 1),
  (14, 'Salon des vignerons ind�pendants rennes', '300exposants', 'Rennes', '2018-01-28', '09:30:00', 1),
  (15, 'Salon des vignerons ind�pendants rennes', '300 exposants', 'Rennes', '2018-01-28', '09:30:00', 1),
  (16, 'Salon des vignerons ind�pendants rennes', '300 exposants', 'Rennes', '2018-01-28', '09:30:00', 1),
  (17, 'Salon des vignerons ind�pendants rennes', '300 exposants', 'Rennes', '2018-01-28', '09:30:00', 1),
  (18, 'Salon des vignerons ind�pendants rennes', '300exposants', 'Rennes', '2018-01-28', '09:30:00', 1),
  (19, 'Salon des vignerons ind�pendants rennes', '300exposants', 'Rennes', '2018-01-28', '09:30:00', 1),
  (20, 'Le salon des vins de loire 2018', '300 exposants vins de loire 2018.', 'Angers', '2018-02-05', '09:00:00', 1),
  (21, 'Salon vignocaves rennes 2018', 'Rencontre avec les vignerons (70 vignerons)', 'Rennes', '2018-03-05', '09:00:00', 1),
  (22, 'Salon de la bi�res artisanale saint-Malo', '52 exposants', 'Saint-Malo', '2018-03-25', '13:00:00', 1),
  (23, 'Salon de la bi�res rennes 2018', 'D�gustations de bi�res du monde.(40 exposants).', 'Rennes', '2018-04-09', '10:00:00', 1),
  (24, 'D�gustation de rhums-Et whiskys chateau d\\''apign�', 'D�gustation et cour sur le rhums et whiskys\r\n8 rhums/8 whiskys.', 'le Rheu', '2018-04-16', '09:30:00', 1),
  (25, 'D�gustation de bi�res artisanales brasserie du ton', 'D�couverte de bi�res artisanales et chants marins', 'Laill�', '2018-06-14', '19:30:00', 1);
