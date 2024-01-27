create database bd_event;
use bd_event;

create table tb_artist (
	id int primary key auto_increment,
    name_artist varchar(60) not null,
    art_style varchar(50) not null,
    apresentation_venue varchar(60) not null,
    instagram varchar(50) not null
);

create table tb_event_stakeholders (
	id int primary key auto_increment,
    name_stackholders varchar(50) not null,
    financial_contribution decimal(10,2) not null,
    benefits_provided text not null
);

create table tb_address_event (
	id int primary key auto_increment,
    name_local varchar(70) not null,
    city varchar(30) not null,
    cep char(8) not null
);

create table tb_event (
	id int primary key auto_increment,
    address_id int not null,
    date_time_event datetime not null,
    event_theme varchar(40) not null,
    stackholder_id int not null,
    
    foreign key (address_id) references tb_address_event(id) on delete cascade,
	foreign key (stackholder_id) references tb_event_stakeholders(id) on delete cascade
);

create table tb_guest_artist_event (
	id int primary key auto_increment,
    artist_id int,
    event_id int,
    foreign key (artist_id) references tb_artist(id) on delete cascade,
    foreign key (event_id) references tb_event(id) on delete cascade
);

create table tb_assessment_event_guests(
	id int primary key auto_increment,
    event_id int,
    assessment double(4,2),
    artist_favorite_id int,
    comments text,
	foreign key (event_id) references tb_event(id) on delete cascade,
    foreign key (artist_favorite_id) references tb_artist(id) on delete cascade
);

-- preencher dados

INSERT INTO `tb_artist` (`name_artist`, `art_style`, `apresentation_venue`, `instagram`) VALUES
('Ana Silva', 'Pintura a óleo', 'Galeria Arte Moderna', '@ana_silva.art'),
('Bernardo Oliveira', 'Escultura em metal', 'Centro Cultural', '@bernardo_sculpt'),
('Clara Costa', 'Arte digital', 'Exposição Virtual', '@clara_digitalart'),
('Daniel Pereira', 'Gravura em madeira', 'Museu de Gravuras', '@daniel_woodcut'),
('Eva Santos', 'Instalação', 'Espaço Contemporâneo', '@eva_installation'),
('Felipe Rocha', 'Fotografia de paisagem', 'Galeria Fotográfica', '@felipe_photo'),
('Gabriela Lima', 'Arte abstrata', 'Sala de Experiências Abstratas', '@gabriela_abstract'),
('Henrique Fonseca', 'Escultura em pedra', 'Praça das Esculturas', '@henrique_sculpture'),
('Isabel Oliveira', 'Pintura acrílica', 'Atelier de Arte', '@isabel_acrylic'),
('João Santos', 'Arte de rua', 'Rua das Artes', '@joao_streetart'),
('Kátia Silva', 'Arte têxtil', 'Exposição Têxtil', '@katia_textileart'),
('Lucas Rocha', 'Desenho a carvão', 'Salão de Desenhos', '@lucas_charcoaldrawing'),
('Mariana Lima', 'Escultura em cerâmica', 'Espaço Cerâmico', '@mariana_ceramicsculpt'),
('Nuno Costa', 'Fotografia de retrato', 'Estúdio de Retratos', '@nuno_portraitphoto'),
('Olívia Fernandes', 'Arte de rua', 'Paredes Urbanas', '@olivia_streetart'),
('Pedro Fonseca', 'Pintura a pastel', 'Galeria de Pastéis', '@pedro_pastelpaint'),
('Quiteria Almeida', 'Instalação', 'Galeria de Instalações', '@quiteria_installation'),
('Ricardo Pereira', 'Escultura em metal', 'Espaço Metálico', '@ricardo_metalart'),
('Sofia Santos', 'Arte digital', 'Sala de Arte Digital', '@sofia_digitalart'),
('Tiago Lima', 'Gravura em madeira', 'Oficina de Gravuras', '@tiago_woodcut'),
('Úrsula Oliveira', 'Arte abstrata', 'Sala de Abstração', '@ursula_abstractart'),
('Vitor Rocha', 'Fotografia de paisagem', 'Paisagens Naturais', '@vitor_landscapes');


INSERT INTO `tb_event_stakeholders` (`name_stackholders`, `financial_contribution`, `benefits_provided`) VALUES
('Empresa A', 5000.00, 'Divulgação nos materiais promocionais do evento'),
('Associação Cultural B', 12000.50, 'Espaço para apresentações culturais durante o evento'),
('Restaurante C', 800.75, 'Fornecimento de alimentos para os participantes'),
('Empresa de Tecnologia D', 15000.20, 'Patrocínio da transmissão online do evento'),
('Escola E', 3000.90, 'Participação de alunos como voluntários no evento'),
('Banco F', 7000.60, 'Patrocínio para a construção de estruturas do evento'),
('ONG G', 2500.40, 'Participação em painel de discussão sobre responsabilidade social'),
('Empresa de Energia H', 10000.75, 'Fornecimento de energia para o evento'),
('Grupo de Teatro I', 4500.30, 'Apresentações artísticas durante o evento'),
('Supermercado J', 3500.80, 'Fornecimento de produtos para brindes e sorteios'),
('Empresa de Logística K', 6000.50, 'Transporte e logística para o evento'),
('Laboratório de Pesquisa L', 9000.25, 'Patrocínio para a área de ciência e pesquisa no evento'),
('Empresa de Saúde M', 1800.70, 'Participação em feira de saúde durante o evento');

INSERT INTO `tb_address_event` (`name_local`, `city`, `cep`) VALUES
('Teatro Municipal', 'São Paulo', '01005010'),
('Centro de Convenções', 'Rio de Janeiro', '20030010'),
('Museu de Arte Contemporânea', 'Belo Horizonte', '30170005'),
('Centro de Eventos Culturais', 'Salvador', '40070030'),
('Palácio das Artes', 'Belo Horizonte', '30112010'),
('Centro de Exposições', 'Brasília', '70070900'),
('Teatro Amazonas', 'Manaus', '69015000'),
('Casa da Cultura', 'Recife', '50030900'),
('Centro Cultural', 'Porto Alegre', '90030003'),
('Auditório Municipal', 'Curitiba', '80020010'),
('Galeria de Arte', 'Fortaleza', '60150020'),
('Centro de Convenções e Exposições', 'Belém', '66053095'),
('Teatro Castro Alves', 'Salvador', '40080360'),
('Museu de Belas Artes', 'Rio de Janeiro', '20021010'),
('Centro Cultural São Paulo', 'São Paulo', '01123010'),
('Teatro da Paz', 'Belém', '66040170'),
('Museu de Arte Moderna', 'Recife', '50070020'),
('Casa de Cultura Mario Quintana', 'Porto Alegre', '90010150'),
('Espaço Cultural', 'João Pessoa', '58040020'),
('Centro de Eventos', 'Florianópolis', '88015700');


-- Vamos supor que tb_address_event possui campos como id, street, city, state, etc.
-- Certifique-se de ajustar conforme a sua estrutura real.
INSERT INTO `tb_event` (`address_id`, `date_time_event`, `event_theme`, `stackholder_id`) VALUES
(1, '2024-03-15 14:30:00', 'Festival de Música', 1),
(2, '2024-04-20 18:00:00', 'Feira de Tecnologia', 4),
(3, '2024-05-10 10:00:00', 'Exposição de Artes', 2),
(4, '2024-06-05 15:45:00', 'Conferência de Saúde', 12),
(5, '2024-07-12 09:30:00', 'Desfile de Moda', 7),
(6, '2024-08-18 20:00:00', 'Festival Gastronômico', 3),
(7, '2024-09-22 13:15:00', 'Congresso de Ciência e Pesquisa', 11),
(8, '2024-10-30 16:45:00', 'Encontro Cultural', 9),
(9, '2024-11-15 11:30:00', 'Exibição de Cinema ao Ar Livre', 5),
(10, '2024-12-05 19:00:00', 'Feira de Empreendedorismo', 6),
(11, '2025-01-10 14:00:00', 'Evento Beneficente', 8);

INSERT INTO `tb_guest_artist_event` (`artist_id`, `event_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11);

INSERT INTO `tb_assessment_event_guests` (`event_id`, `assessment`, `artist_favorite_id`, `comments`) VALUES
(1, 4.5, 1, 'Adorei a performance da Ana Silva!'),
(2, 3.8, 5, 'O desfile de moda foi incrível, mas gostei mais das apresentações artísticas.'),
(3, 4.2, 3, 'A exposição de artes superou minhas expectativas.'),
(4, 4.9, 9, 'Muito informativa a conferência de saúde, aprendi bastante.'),
(5, 3.5, 7, 'Achei o desfile de moda um pouco repetitivo.'),
(6, 4.7, 10, 'Os pratos do festival gastronômico estavam deliciosos!'),
(7, 4.0, 8, 'O congresso de ciência e pesquisa trouxe temas muito interessantes.'),
(8, 3.6, 4, 'A exposição de cinema ao ar livre foi uma experiência única.'),
(9, 4.5, 2, 'A feira de empreendedorismo foi inspiradora, ótimas palestras e networking.');

INSERT INTO `tb_assessment_event_guests` (`event_id`, `assessment`, `artist_favorite_id`, `comments`) VALUES
(1, 4.5, 2, 'Gostei muito da apresentação!'),
(2, 3.8, 2, 'Interessante, mas esperava mais.'),
(3, 4.2, 2, 'Excelente exposição de arte digital.'),
(4, 4.9, 2, 'Palestra muito informativa, aprendi bastante.'),
(5, 3.5, 2, 'Desfile de moda um pouco repetitivo.'),
(6, 4.7, 2, 'Festival gastronômico incrível!'),
(7, 4.0, 2, 'Congresso de ciência e pesquisa enriquecedor.'),
(8, 3.6, 2, 'Experiência única na exposição de cinema ao ar livre.'),
(9, 4.5, 2, 'Feira de empreendedorismo inspiradora.'),
(10, 4.2, 6, 'Esculturas em metal muito criativas.'),
(11, 3.9, 6, 'Arte digital com abordagem única.'),
(1, 4.8, 6, 'Galeria fotográfica surpreendente.'),
(2, 4.1, 6, 'Esculturas em pedra são incríveis.'),
(3, 3.7, 6, 'Pinturas acrílicas com cores vibrantes.'),
(4, 4.3, 6, 'Arte de rua expressiva e impactante.'),
(5, 4.6, 6, 'Instalações artísticas muito interessantes.'),
(6, 4.9, 1, 'Adorei a apresentação do artista favorito 1!'),
(7, 4.2, 1, 'Arte abstrata que desperta reflexões.');

INSERT INTO `tb_artist` (`name_artist`, `art_style`, `apresentation_venue`, `instagram`) VALUES
('Camila Oliveira', 'Escultura em metal', 'Galeria de Esculturas', '@camila.esculturas'),
('Diego Santos', 'Escultura em metal', 'Atelier de Metal', '@diego.santos.metal'),
('Eduarda Lima', 'Arte abstrata', 'Sala de Experiências Visuais', '@eduarda.abstrata'),
('Fábio Rocha', 'Gravura em madeira', 'Estúdio de Gravuras', '@fabio.woodcut'),
('Gabriel Almeida', 'Fotografia de paisagem', 'Centro de Fotografia', '@gabriel.paisagens'),
('Heloísa Costa', 'Arte abstrata', 'Galeria de Arte Contemporânea', '@heloisa.abstrata'),
('Igor Fernandes', 'Fotografia de paisagem', 'Paisagens Urbanas', '@igor.paisagens'),
('Juliana Santos', 'Arte abstrata', 'Espaço de Abstração', '@juliana.abstrata'),
('Karina Silva', 'Fotografia de paisagem', 'Paisagens Naturais', '@karina.paisagens'),
('Leonardo Oliveira', 'Escultura em metal', 'Galeria Metálica', '@leonardo.esculturas'),
('Mariana Costa', 'Arte abstrata', 'Exposição Virtual', '@mariana.abstrata'),
('Nathalia Lima', 'Escultura em metal', 'Praça das Esculturas', '@nathalia.esculturas'),
('Otávio Santos', 'Fotografia de paisagem', 'Galeria Fotográfica', '@otavio.paisagens'),
('Patrícia Rocha', 'Arte abstrata', 'Sala de Abstração', '@patricia.abstrata'),
('Quintino Alves', 'Gravura em madeira', 'Oficina de Gravuras', '@quintino.woodcut'),
('Renata Fernandes', 'Arte abstrata', 'Galeria de Instalações', '@renata.abstrata'),
('Samuel Silva', 'Fotografia de paisagem', 'Salão de Fotos', '@samuel.paisagens'),
('Tatiane Costa', 'Escultura em metal', 'Espaço Metálico', '@tatiane.esculturas'),
('Ulisses Oliveira', 'Arte abstrata', 'Atelier de Abstração', '@ulisses.abstrata'),
('Viviane Santos', 'Fotografia de paisagem', 'Cenários Naturais', '@viviane.paisagens'),
('Wagner Lima', 'Gravura em madeira', 'Oficina de Gravuras', '@wagner.woodcut'),
('Ximena Almeida', 'Fotografia de paisagem', 'Exposição Fotográfica', '@ximena.paisagens');

INSERT INTO `tb_artist` (`name_artist`, `art_style`, `apresentation_venue`, `instagram`) VALUES
('Zé Roberto', 'Arte abstrata', 'Espaço Criativo', '@zeroberto.br');
--
select * from tb_artist;
select * from tb_event;
select * from tb_assessment_event_guests;
select * from tb_event_stakeholders;
select * from tb_guest_artist_event;

-- consulta 1
SELECT
    a.id AS artist_id,
    a.name_artist AS artist_name,
    a.art_style AS art_style,
    COUNT(e.id) AS total_votes
FROM
    tb_artist a
JOIN
    tb_assessment_event_guests e ON a.id = e.artist_favorite_id
GROUP BY
    a.id, a.name_artist, a.art_style
ORDER BY
    total_votes DESC
    LIMIT 3;

-- consulta 2
SELECT
    e.id AS event_id,
    e.event_theme AS event_theme,
    AVG(g.assessment) AS average_rating
FROM
    tb_event e
JOIN
    tb_assessment_event_guests g ON e.id = g.event_id
GROUP BY
    e.id, e.event_theme
ORDER BY
    average_rating DESC
    LIMIT 7;
    
-- consulta 3
SELECT
    art_style,
    COUNT(*) AS total_artists
FROM
    tb_artist
GROUP BY
    art_style
ORDER BY
    total_artists DESC
LIMIT 5;









