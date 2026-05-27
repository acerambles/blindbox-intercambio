-- ============================================================
-- BlindBox Intercambio - Datos iniciales
-- Ejecutar en MySQL Workbench sobre la base de datos
-- blindboxintercambio
-- ============================================================

USE blindboxintercambio;

-- ============================================================
-- MARCAS
-- ============================================================

INSERT INTO marcas (nombre, verificada) VALUES ('Pop Mart', 1);
INSERT INTO marcas (nombre, verificada) VALUES ('Tokidoki', 1);
INSERT INTO marcas (nombre, verificada) VALUES ('52Toys', 1);
INSERT INTO marcas (nombre, verificada) VALUES ('Miniso', 1);
INSERT INTO marcas (nombre, verificada) VALUES ('Kidrobot', 1);
INSERT INTO marcas (nombre, verificada) VALUES ('Mighty Jaxx', 1);

-- ============================================================
-- MODELOS / IPs de Pop Mart (id_marca = 1)
-- ============================================================

INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'The Monsters (Labubu)', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Molly', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Skullpanda', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Dimoo', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Crybaby', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Hirono', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Hacipupu', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Pucky', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Twinkle Twinkle', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Zsiga', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Peach Riot', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Kubo', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Sweet Bean', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Pino Jelly', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Polar', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Nyota', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Azura', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, '1001Moons', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Kenneth', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Chaka', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Inosoul', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Tiny Tiny', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Yuki', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Satyr Rory', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Bobo and Coco', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Bunny', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Duckoo', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Duckyo', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Fubobo', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Gummy', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'KIWIWI', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'LiLiOS', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Minico', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Momiji', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Nori', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'OIPIPPI', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Raby', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Tapoo', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'ViViCat', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Vita', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Yoki', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Zoe', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Coolabo', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Flabjacks', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Flying Dong Dong', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'MODOLI', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'SUPERTUTU', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (1, 'Instinctoy', 1);

-- Tokidoki (id_marca = 2)
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (2, 'Unicorno', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (2, 'Moofia', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (2, 'Sandy', 1);

-- 52Toys (id_marca = 3)
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (3, 'Farmer Bob', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (3, 'Carrot Street', 1);

-- Miniso (id_marca = 4)
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (4, 'Disney', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (4, 'Sanrio', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (4, 'One Piece', 1);

-- Kidrobot (id_marca = 5)
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (5, 'Dunny', 1);
INSERT INTO modelos (id_marca, nombre, verificada) VALUES (5, 'Munny', 1);

-- ============================================================
-- SERIES - The Monsters / Labubu (id_modelo = 1)
-- ============================================================

INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Forest Concert Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Exciting Macaron Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Fall in Wild Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Have a Seat Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Big Into Energy Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Lazy Yoga Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Wacky Mart Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Coca-Cola Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Almost Hidden Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, '1:00 A.M. Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, 'Chasing Mermaids Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (1, '10th Anniversary Series', 1);

-- ============================================================
-- SERIES - Molly (id_modelo = 2)
-- ============================================================

INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'One Day of Molly Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'A Boring Day with Molly Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'My Childhood Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'Car Car Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'Cooking Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'Imaginary Wandering Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'Carb-Lover Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'Flower Dreaming Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (2, 'Starlight Glow Series', 1);

-- ============================================================
-- SERIES - Skullpanda (id_modelo = 3)
-- ============================================================

INSERT INTO series (id_modelo, nombre, verificada) VALUES (3, 'Ancient Castle Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (3, 'The Sound Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (3, 'Warmth Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (3, 'The Paradox Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (3, 'Everyday Wonderland Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (3, 'City of Night Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (3, 'Tell Me What You Want Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (3, 'Winter Symphony Series', 1);

-- ============================================================
-- SERIES - Dimoo (id_modelo = 4)
-- ============================================================

INSERT INTO series (id_modelo, nombre, verificada) VALUES (4, 'Space Travel Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (4, 'Zodiac Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (4, 'Forest Night Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (4, 'Aquarium Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (4, 'Cat Paradise Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (4, 'Retro Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (4, 'By Your Side Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (4, 'Animal Kingdom Series', 1);

-- ============================================================
-- SERIES - Crybaby (id_modelo = 5)
-- ============================================================

INSERT INTO series (id_modelo, nombre, verificada) VALUES (5, 'Sad Club Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (5, 'Crying in the Woods Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (5, 'Crying Parade Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (5, 'Shiny Shiny Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (5, 'Wild but Cutie Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (5, 'Crying for Love Series', 1);

-- ============================================================
-- SERIES - Hirono (id_modelo = 6)
-- ============================================================

INSERT INTO series (id_modelo, nombre, verificada) VALUES (6, 'Little Mischief Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (6, 'Shelter Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (6, 'The Other One Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (6, 'Echo Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (6, 'Reshape Series', 1);
INSERT INTO series (id_modelo, nombre, verificada) VALUES (6, 'Tamed Wildgrass Series', 1);

-- ============================================================
-- Verificar resultados
-- ============================================================

SELECT 'Marcas insertadas:' as info, COUNT(*) as total FROM marcas;
SELECT 'Modelos insertados:' as info, COUNT(*) as total FROM modelos;
SELECT 'Series insertadas:' as info, COUNT(*) as total FROM series;
