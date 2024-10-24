
USE disfraces_doña_ruca;



INSERT INTO categorias (nombre) VALUES
('Maquillaje'),
('Decoracion'),
('Accesorio'),
('Disfraz');

INSERT INTO marcas (nombre) VALUES
('Trendy'),
('Atenea'),
('Montoc'),
('Vogue'),
('Ani-k'),
('Avon'),
('Khol'),
('Ruby Rose'),
('Cachivaches'),
('Disguise '),
('Spirit Halloween'),
('Morphsuits '),
('Party City'),
('Leg Avenue');

INSERT INTO tematicas(nombre) VALUES
('Aventuras'),
('Angeles y Demonios'), 
('Astrologia'),
('Circense'),
('Ciencia ficción'), 
('Cultura antigua'),
('Dinosaurios'),
('Dragones'),
('Exploradores'),
('Trabajadores'),
('Futurismo'),
('Futbolistas'),
('Magia y hechicería'),
('Monstruos'),
('Mutantes'),
('Piratas'),
('Realeza'), 
('Super espías'),
('Epocas'),
('Superhéroes'),
('Villanos'); 



INSERT INTO colores(nombre)VALUES
('Aguamarina'),
('Amarillo'),
('Amarillo limón'),
('Azul'),
('Azul cielo'),
('Azul cobalto'),
('Azul marino'),
('Azul zafiro'),
('Beige'),
('Blanco'),
('Bronce'),
('Café'),
('Carbón'),
('Celeste'),
('Champán'),
('Chocolate'),
('Cian'),
('Cobre'),
('Coral'),
('Durazno'),
('Esmeralda'),
('Fucsia'),
('Granate'),
('Gris'),
('Gris perla'),
('Lavanda'),
('Lila'),
('Magenta'),
('Marrón'),
('Marfil'),
('Menta'),
('Morado'),
('Naranja'),
('Negro'),
('Oro'),
('Plata'),
('Rojo'),
('Rojo vino'),
('Rosa'),
('Rosa pastel'),
('Salmón'),
('Tierra'),
('Topacio'),
('Turquesa'),
('Verde'),
('Verde bosque'),
('Verde esmeralda'),
('Verde lima'),
('Verde musgo'),
('Verde oliva'),
('Multicolor');


INSERT INTO tallas(talla)VALUES
('XS'),
('S'),
('M'),
('L'),
('XL'),
('XXL'),
('XXXL'),
('4U'),
('5U'),
('2'),
('4'),
('6'),
('8'),
('10'),
('12'),
('14'),
('16'),
('18');

INSERT INTO materiales(material)VALUES
('acero'),
('acrilico'),
('aluminio'),
('algodon'),
('cobre'),
('cristal'),
('cuero'),
('fibra de vidrio'),
('latex'),
('lana'),
('lino'),
('madera'),
('metal'),
('oro'),
('piedra artificial'),
('piedra natural'),
('plastico'),
('plata'),
('resina'),
('seda'),
('vinilo');


INSERT INTO tipos_accesorios(nombre)VALUES
('Anillos'),
('Aretes'),
('Cadenas'),
('Cintas'),
('Cinturones'),
('Choker'),
('Coronas'),
('Corbatines'),
('Collares'),
('Diademas'),
('Gafas'),
('Gorros'),
('Medias'),
('Pulseras'),
('Sombreros'),
('Tiaras');


INSERT INTO tipos_decoraciones(nombre) VALUES
('almohadas'),
('espejos'),
('armas'),
('banderines'),
('bolsas'),
('cortinas'),
('cubrelechos'),
('colgantes'),
('cuadros'),
('figuras'),
('flores'),
('globos'),
('guirnaldaz'),
('inflables'),
('lamparas'),
('linternas'),
('manteles'),
('mascaras'),
('pegatinas'),
('piñatas'),
('sangre'),
('estacas'),
('telarañas'),
('velas'),
('humo');



INSERT INTO tipos_maquillaje (nombre) VALUES
('Aceite'),
('Base'),
('Brillo labial'),
('Contorno'),
('Corrector'),
('Craquelador'),
('Cera moldeable'),
('Delineador'),
('Espuma expansiva'),
('Fijador'),
('Gel para cejas'),
('Gel para crear ampollas'),
('Gel para efectos de quemaduras'),
('Glitter'),
('Iluminador'),
('Látex líquido'),
('Labial'),
('Lápiz de labios'),
('Lentes de contacto'),
('Pegamento para glitter'),
('Pegamento para pestañas'),
('Pegamento para prótesis'),
('Pestañas postizas'),
('Pigmento'),
('Pintura corporal'),
('Pintura facial'),
('Pintura fluorescente'),
('Pintura metálica'),
('Polvos translúcidos'),
('Polvos compacto'),
('Prótetico dental'),
('Prótetico facial'),
('Rubor'),
('Sangre falsa en gel'),
('Sangre falsa líquida'),
('Sombras'),
('Spray para cabello'),
('Tinte para dientes'),
('Tatuaje temporal'),
('Uñas postizas');


INSERT INTO tonos (nombre) VALUES
('No aplica'),
('Almendra'),
('Amarillo calabaza'),
('Amarillo mostaza'),
('Medianoche'),
('Gitana'),
('Avellana'),
('Beige claro'),
('Espectral'),
('Fantasmal'),
('Hueso'),
('Bronce suave'),
('Caramelo tostado'),
('Café intenso'),
('Ceniza de bruja'),
('Chocolate oscuro'),
('Cobre brillante'),
('Oxido'),
('Durazno rosado'),
('Ceniza'),
('Tormenta'),
('Lavanda fantasma'),
('Arcilla'),
('Marrón suave'),
('Miel dorada'),
('Carbón'),
('Naranja espeluznante'),
('Fuego'),
('Plata metálica'),
('Rojo sangre'),
('Rojo vampiro'),
('Rosa encantada'),
('Malva'),
('Rosal'),
('Sangre coagulada'),
('Transparente'),
('Tierra profunda'),
('Borehal'),
('Verde fantasma'),
('Verde lodo'),
('Moho'),
('Verde pantano'),
('Zombie'),
('Violeta encantada'),
('fluorecente');



INSERT INTO productos(nombre, descripcion, precio_venta, id_categoria,id_marca, costo) VALUES
('Látex Líquido Zombie', 'Un látex líquido especialmente formulado para crear efectos realistas de piel desgarrada y cicatrices. Ideal para caracterizar zombies o criaturas aterradoras. Se aplica fácilmente y se seca rápidamente.', 12.99, 1,1, 5.00),
('Sangre Coagulada Vampírica', 'Sangre falsa con textura espesa, perfecta para dar ese toque final a tu disfraz de vampiro. Esta sangre coagulada se adhiere a la piel y simula heridas reales. Fácil de limpiar.', 10.49, 1,2, 4.00),
('Base Fantasmal', 'Base de maquillaje en tono blanco pálido, ideal para lograr un look fantasmal o de muerto viviente. Proporciona una cobertura completa y un acabado mate, perfecta para eventos de Halloween.', 14.99, 1,3, 6.50),
('Delineador Sanguinario', 'Delineador líquido en color rojo intenso, perfecto para crear detalles aterradores en tu maquillaje. Ideal para simular lágrimas de sangre o efectos de heridas.', 8.99, 1,4, 3.00),
('Glitter Mágico', 'Glitter brillante , ideal para añadir un toque especial a tu maquillaje de Halloween. Perfecto para brillar en la oscuridad y destacar tu look.', 6.99, 1,5, 2.50),
('Pestañas Postizas Gato', 'Juego de pestañas postizas decorativas, ideales para complementar tu look de Halloween. Vienen estilo ojo de gato y  efecto dramático.', 9.49, 1,6, 4.00),
('Pestañas Postizas Muñeca', 'Juego de pestañas postizas decorativas, ideales para complementar tu look de Halloween. Vienen estilo ojo de muñeca y  efecto dramático.', 9.49, 1,7, 4.00),
('Cera Moldeable de Hechicero', 'Cera moldeable ideal para crear efectos especiales como cicatrices o deformidades. Fácil de usar y se puede aplicar sobre la piel para dar un aspecto realista.', 11.99, 1,8, 5.50),
('Sombras Místicas', 'Paleta de sombras con colores vibrantes y oscuros, perfecta para crear looks intensos y dramáticos para Halloween. Incluye tonos como morado, negro y verde.', 15.99, 1,1, 7.00),
('Sombras Muñeca', 'Paleta de sombras con colores vibrantes y claros, perfecta para crear looks intensos y dramáticos para Halloween. Incluye tonos como rosado, morado y dorado.', 15.99, 1,2, 7.00),
('Rubor de Fantasía', 'Rubor en tono rosa pálido, ideal para dar un toque de color a tu rostro. Perfecto para un look de hada o un personaje de cuento.', 7.49, 1,3, 3.00),
('Cera para Cicatrices', 'Cera especial para crear cicatrices y deformidades. Se puede moldear fácilmente y se adhiere bien a la piel, perfecta para efectos especiales.', 10.99, 1,4, 4.50),
('Pintura Facial Mística', 'Pintura facial de alta calidad en varios colores, ideal para crear personajes fantásticos. Se lava fácilmente con agua.', 11.49, 1,5, 4.00),
('Spray de Sangre Brillante', 'Spray de sangre falsa que brilla en la oscuridad, perfecto para dar un efecto espeluznante en tus disfraces nocturnos.', 9.99, 1,6, 3.50),
('Pintura UV Radiante', 'Pintura brillante que brilla bajo luz negra, ideal para fiestas de Halloween y eventos nocturnos. Se aplica fácilmente y es fácil de quitar.', 13.49, 1,7, 5.00),
('Gel para Quemaduras', 'Gel especial que simula quemaduras. Ideal para crear efectos de piel quemada en caracterizaciones. Se aplica suavemente y se seca rápido.', 12.49, 1,8, 5.50),
('Lápiz de Labios Sangre', 'Lápiz de labios de color intenso, ideal para crear un look de vampiro. Proporciona hidratación y un acabado brillante.', 8.49, 1,1, 3.00),
('Spray de Fijación Fantasmal', 'Spray para fijar el maquillaje durante toda la noche. Proporciona un acabado mate y evita que el maquillaje se corra.', 11.99, 1,2, 4.50),
('Craquelador para Efectos Especiales', 'Craquelador versátil que se puede usar para crear diferentes efectos especiales en la piel. Ideal para cicatrices, quemaduras o heridas.', 10.49, 1,3, 4.00),
('Tatuajes Temporales Terroríficos', 'Set de tatuajes temporales de diseños terroríficos. Se aplican fácilmente y se retiran con agua.', 5.49, 1,4, 2.00),
('Tatuajes Temporales Florales', 'Set de tatuajes temporales de diseños terroríficos. Se aplican fácilmente y se retiran con agua.', 5.49, 1,5, 2.00),
('Polvos de Calavera', 'Polvos translúcidos con un acabado ligero, ideales para sellar el maquillaje y evitar el brillo. Perfecto para un look de calavera.', 6.99, 1, 6,2.50),
('Pintura para Cabello Lúgubre', 'Pintura para cabello que se lava fácilmente, ideal para crear looks únicos y creativos. Disponible en varios colores vibrantes.', 10.99, 1,7, 4.00),
('Cinta Adhesiva de Maquillaje', 'Cinta adhesiva especial para crear efectos de arrugas o piel tirante. Se quita fácilmente sin dejar residuos.', 8.99, 1,8,3.50),
('Lentes de Contacto Demoníacos', 'Lentes de contacto de colores intensos, perfectos para darle un toque especial a tu disfraz. Aportan un efecto aterrador y son cómodas de usar.', 15.99, 1,1, 6.00),
('Sombras de Ojos Espectrales', 'Paleta de sombras con colores vibrantes y oscuros, perfecta para crear looks intensos y dramáticos para Halloween.', 15.99, 1,2, 7.00),
('Fijador de Maquillaje Resistente', 'Fijador de maquillaje que asegura que tu look se mantenga intacto durante toda la noche. Resistente al agua y al sudor.', 13.49, 1,3, 5.00),
('Uñas Postizas Espeluznantes', 'Juego de uñas postizas con diseños terroríficos, ideales para complementar tu disfraz de Halloween. Fáciles de aplicar y remover.', 7.99, 1,4, 3.00),
('Uñas Postizas princesa', 'Juego de uñas postizas con diseños terroríficos, ideales para complementar tu disfraz de Halloween. Fáciles de aplicar y remover.', 7.99, 1,5, 3.00),
('Delineador Brillante', 'Delineador líquido en colores vibrantes, perfecto para crear looks únicos y llamativos. Resistente y de larga duración.', 8.99, 1,6, 3.50),
('Látex para Piel Sensible', 'Látex hipoalergénico, ideal para pieles sensibles. Se aplica fácilmente y se retira sin esfuerzo para crear efectos de piel desgarrada o quemada..', 14.99, 1,7, 6.00),
('Murciélagos colgantes', 'Decoración de murciélagos colgantes perfectos para exteriores o interiores en Halloween.', 15.99, 2, 1, 9.50),
('Fantasmas inflables', 'Fantasmas inflables para decorar el jardín o entrada de la casa en Halloween.', 29.99, 2, 10, 12.00),
('Brujas colgantes', 'Brujas colgantes aterradoras para dar un toque siniestro a tu hogar.', 18.50, 2, 11, 8.75),
('Calderos de bruja', 'Calderos perfectos para fiestas temáticas de Halloween o decoración de interiores.', 25.00, 2, 12, 10.50),
('Velas negras', 'Velas negras para crear una atmósfera misteriosa y oscura en Halloween.', 12.99, 2, 13, 6.00),
('Calaveras iluminadas', 'Calaveras con luces para iluminar los rincones oscuros en Halloween.', 19.99, 2, 14, 9.50),
('Lámparas de calabaza', 'Lámparas de calabaza para iluminar y decorar el hogar durante la temporada de Halloween.', 22.00, 2, 9, 10.00),
('Tumbas falsas', 'Decoraciones de tumbas falsas para crear una escena espeluznante en tu jardín.', 35.50, 2, 10, 16.00),
('Manos saliendo de la tierra', 'Manos de plástico simulando que salen de la tierra, perfecto para jardines o interiores.', 14.50, 2, 11, 6.75),
('Fantasmas de papel', 'Fantasmas de papel fáciles de colgar para una decoración rápida y efectiva.', 8.99, 2, 11, 3.99),
('Luces de color', 'Luces decorativas naranjas para iluminar la noche de Halloween.', 20.50, 2, 12, 9.00),
('Letreros de "Cuidado, zona encantada"', 'Letreros decorativos para advertir sobre una zona encantada en Halloween.', 12.50, 2, 13, 5.75),
('Arañas plásticas', 'Arañas plásticas para colocar en diferentes áreas y asustar a tus invitados.', 6.99, 2, 14, 3.00),
('Puertas falsas de ataúdes', 'Puertas decorativas con la forma de un ataúd para añadir terror a cualquier ambiente.', 27.99, 2, 9, 12.50),
('Ojos brillantes', 'Ojos brillantes para crear la ilusión de ser vigilado en la oscuridad.', 16.50, 2, 10, 7.25),
('Ropa de cama temática de Halloween', 'Ropa de cama con estampados aterradores para celebrar Halloween.', 45.00, 2, 11, 20.00),
('Cortinas de ducha sangrientas', 'Cortinas de ducha que simulan estar llenas de sangre, perfectas para sorprender a tus invitados.', 24.99, 2, 12, 11.25),
('Cuerpos falsos envueltos', 'Cuerpos falsos envueltos en plástico para una decoración perturbadora en Halloween.', 40.00, 2, 13, 18.50),
('Linternas de calabaza', 'Linternas con forma de calabaza para iluminar las noches de Halloween.', 22.99, 2, 14, 10.75),
('Adornos de cuervos', 'Adornos de cuervos para añadir un toque siniestro a la decoración.', 15.00, 2, 9, 7.50),
('Ratas falsas', 'Ratas falsas para colocar en rincones y asustar a los visitantes.', 7.50, 2, 10, 3.50),
('Cadáveres colgantes', 'Cadáveres falsos colgantes para dar un ambiente macabro en Halloween.', 39.99, 2, 11, 18.00),
('Gatos negros decorativos', 'Gatos negros decorativos para añadir misterio a la decoración.', 13.99, 2, 12, 6.50),
('Máscaras de monstruos', 'Máscaras de monstruos para completar disfraces o decorar paredes.', 9.99, 2, 13, 4.50),
('Sombras de esqueletos en las ventanas', 'Adhesivos de esqueletos para colocar en las ventanas y crear sombras espeluznantes.', 10.50, 2, 14, 4.75),
('Globos de Halloween', 'Globos temáticos de Halloween para decorar fiestas y celebraciones.', 8.99, 2, 9, 3.99),
('Cadenas oxidadas falsas', 'Cadenas decorativas que parecen oxidadas, ideales para escenas de terror.', 17.50, 2, 10, 7.75),
('Cortinas de humo', 'Cortinas que generan humo para crear una atmósfera de terror.', 25.50, 2, 11, 12.00),
('Espejos encantados', 'Espejos que simulan estar embrujados para añadir un toque aterrador.', 30.99, 2, 12, 15.00),
('Zombis inflables', 'Zombis inflables para decorar el jardín o entrada de la casa.', 35.99, 2, 13, 16.50),
('Anillo de calavera', 'Anillo con diseño de calavera en metal.', 10.99, 3, 9, 5.00),
('Anillo de murciélago', 'Anillo con forma de murciélago en relieve.', 12.50, 3, 10, 6.00),
('Anillo de calabaza', 'Anillo con diseño de calabaza sonriente.', 9.99, 3, 11, 4.50),
('Anillo de telaraña', 'Anillo con diseño de telaraña y araña.', 11.49, 3, 12, 5.50),
('Anillo de monstruo', 'Anillo con diseño de monstruo divertido.', 8.99, 3, 13, 4.00),
('Aretes de murciélago', 'Aretes en forma de murciélago de metal.', 14.99, 3, 14, 7.00),
('Aretes de calabaza', 'Aretes en forma de calabaza brillante.', 13.50, 3, 9, 6.50),
('Aretes de fantasmas', 'Aretes colgantes con forma de fantasmas.', 15.00, 3, 10, 7.50),
('Cadenas de perlas', 'Cadena de perlas para looks.', 20.00, 3, 11, 10.00),
('Cadenas de calaveras', 'Cadena decorada con pequeñas calaveras.', 22.50, 3, 12, 11.00),
('Cintas de colores', 'Cintas de diferentes colores para disfraz.', 5.99, 3, 13, 2.50),
('Cinturón de cuero', 'Cinturón con hebilla de calavera.', 15.99, 3, 14, 8.00),
('Choker de encaje', 'Choker de encaje con detalle en el centro.', 12.99, 3, 9, 6.50),
('Choker de calabaza', 'Choker con diseño de calabaza.', 11.99, 3, 10, 5.50),
('Corona de rey', 'Corona decorativa de rey.', 18.50, 3, 11, 9.00),
('Corbatín de rayas', 'Corbatín y naranja para un look festivo.', 9.99, 3, 12, 4.50),
('Collar de esqueleto', 'Collar con colgante de esqueleto.', 14.00, 3, 13, 7.00),
('Diadema de bruja', 'Diadema con un sombrero de bruja.', 8.50, 3, 14, 4.00),
('Gafas de Halloween', 'Gafas con diseño de.', 10.99, 3, 9, 5.00),
('Gorro de bruja', 'Gorro con forma de bruja.', 15.50, 3, 10, 7.50),
('Medias de rayas', 'Medias con rayas y naranjas.', 6.99, 3, 11, 3.00),
('Pulsera de murciélago', 'Pulsera con pequeños murciélagos de adorno.', 9.99, 3, 12, 4.50),
('Sombrero de copa alta', 'Sombrero de copa alta.', 22.00, 3, 13, 11.00),
('Tiara de princesa', 'Tiara de princesa.', 11.99, 3, 14, 5.50),
('Tiara de reina', 'Tiara de reina.', 11.99, 3, 9, 5.50),
('Anillo de espinas', 'Anillo con diseño de espinas en metal.', 13.00, 3, 10, 6.50),
('Aretes de gemas', 'Aretes brillantes gemas.', 14.99, 3, 11, 7.50),
('Anillo de gemas', 'Anillo con gemas.', 16.00, 3, 12, 8.00),
('Choker de calaveras', 'Choker decorado con pequeñas calaveras.', 12.99, 3, 13, 6.50),
('Pulsera de gemas', 'Pulsera con diseño de gemas.', 10.00, 3, 14, 5.00),
('Diadema de calaveras', 'Diadema con calaveras decorativas.', 9.50, 3, 9, 4.00),
('Disfraz de vampiro', 'Disfraz talla XS temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz de vampiro', 'Disfraz talla S temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz de vampiro', 'Disfraz talla M temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz de vampiro', 'Disfraz talla L temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz de reina', 'Disfraz talla XS temático ideal para eventos de disfraces', 45.00, 4, 10, 28.00),
('Disfraz de reina', 'Disfraz talla S temático ideal para eventos de disfraces', 45.00, 4, 10, 28.00),
('Disfraz de reina', 'Disfraz talla M temático ideal para eventos de disfraces', 45.00, 4, 10, 28.00),
('Disfraz de reina', 'Disfraz talla L temático ideal para eventos de disfraces', 45.00, 4, 10, 28.00),
('Disfraz años 20', 'Disfraz talla XL temático ideal para eventos de disfraces', 40.00, 4, 11, 25.00),
('Disfraz años 20', 'Disfraz talla XXL temático ideal para eventos de disfraces', 40.00, 4, 11, 25.00),
('Disfraz años 20', 'Disfraz talla XXL temático ideal para eventos de disfraces', 40.00, 4, 11, 25.00),
('Disfraz años 20', 'Disfraz talla 4U temático ideal para eventos de disfraces', 40.00, 4, 11, 25.00),
('Disfraz años 20', 'Disfraz talla 5U temático ideal para eventos de disfraces', 40.00, 4, 11, 25.00),
('Disfraz años 50', 'Disfraz talla XL temático ideal para eventos de disfraces', 42.00, 4, 12, 26.00),
('Disfraz años 50', 'Disfraz talla XXL temático ideal para eventos de disfraces', 42.00, 4, 12, 26.00),
('Disfraz años 50', 'Disfraz talla XXXL temático ideal para eventos de disfraces', 42.00, 4, 12, 26.00),
('Disfraz años 50', 'Disfraz talla 4U temático ideal para eventos de disfraces', 42.00, 4, 12, 26.00),
('Disfraz años 50', 'Disfraz talla 5U temático ideal para eventos de disfraces', 42.00, 4, 12, 26.00),
('Disfraz años 70', 'Disfraz talla XS temático ideal para eventos de disfraces', 38.00, 4, 13, 22.00),
('Disfraz años 70', 'Disfraz talla S temático ideal para eventos de disfraces', 38.00, 4, 13, 22.00),
('Disfraz años 70', 'Disfraz talla M temático ideal para eventos de disfraces', 38.00, 4, 13, 22.00),
('Disfraz años 70', 'Disfraz talla L temático ideal para eventos de disfraces', 38.00, 4, 13, 22.00),
('Disfraz años 80', 'Disfraz talla XS temático ideal para eventos de disfraces', 44.00, 4, 14, 28.00),
('Disfraz años 80', 'Disfraz talla S temático ideal para eventos de disfraces', 44.00, 4, 14, 28.00),
('Disfraz años 80', 'Disfraz talla M temático ideal para eventos de disfraces', 44.00, 4, 14, 28.00),
('Disfraz años 80', 'Disfraz talla L temático ideal para eventos de disfraces', 44.00, 4, 14, 28.00),
('Disfraz futurista', 'Disfraz talla XL temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz futurista', 'Disfraz talla XXL temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz futurista', 'Disfraz talla XXXL temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz futurista', 'Disfraz talla 4U temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz futurista', 'Disfraz talla 5U temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz de ninja', 'Disfraz Talla 2 temático ideal para eventos de disfraces', 55.00, 4, 10, 32.00),
('Disfraz de ninja', 'Disfraz Talla 4 temático ideal para eventos de disfraces', 55.00, 4, 10, 32.00),
('Disfraz de ninja', 'Disfraz Talla 6 temático ideal para eventos de disfraces', 55.00, 4, 10, 32.00),
('Disfraz de samurái', 'Disfraz Talla 8 temático ideal para eventos de disfraces', 50.00, 4, 11, 30.00),
('Disfraz de samurái', 'Disfraz Talla 10 temático ideal para eventos de disfraces', 50.00, 4, 11, 30.00),
('Disfraz de samurái', 'Disfraz Talla 12 temático ideal para eventos de disfraces', 50.00, 4, 11, 30.00),
('Disfraz de hada', 'Disfraz Talla 8 temático ideal para eventos de disfraces', 45.00, 4, 12, 28.00),
('Disfraz de hada', 'Disfraz Talla 10 temático ideal para eventos de disfraces', 45.00, 4, 12, 28.00),
('Disfraz de hada', 'Disfraz Talla 12 temático ideal para eventos de disfraces', 45.00, 4, 12, 28.00),
('Disfraz de elfo', 'Disfraz Talla XS temático ideal para eventos de disfraces', 40.00, 4, 13, 25.00),
('Disfraz de elfo', 'Disfraz Talla S temático ideal para eventos de disfraces', 40.00, 4, 13, 25.00),
('Disfraz de dragón', 'Disfraz Talla 14 temático ideal para eventos de disfraces', 60.00, 4, 14, 35.00),
('Disfraz de dragón', 'Disfraz Talla 16 temático ideal para eventos de disfraces', 60.00, 4, 14, 35.00),
('Disfraz de dragón', 'Disfraz Talla 18 temático ideal para eventos de disfraces', 60.00, 4, 14, 35.00),
('Disfraz de monstruo clásico', 'Disfraz Talla 14 temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz de monstruo clásico', 'Disfraz Talla 16 temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00),
('Disfraz de monstruo clásico', 'Disfraz Talla 18 temático ideal para eventos de disfraces', 50.00, 4, 9, 30.00);



INSERT INTO disfraces (genero, tipo_usuario, id_tematica, id_color, id_talla, id_producto, stock_venta, stock_alquiler, precio_alquiler)
VALUES
-- Producto Disfraz de vampiro
('Masculino', 'Adultos', 14, 34, 1, 93, 50, 50, 25.00), -- XS
('Unisex', 'Adultos', 14, 34, 2, 94, 50, 50, 25.00), -- S
('Unisex', 'Adultos', 14, 34, 3, 95, 50, 50, 25.00), -- M
('Unisex', 'Adultos', 14, 34, 4, 96, 50, 50, 25.00), -- L


-- Producto Disfraz de reina
('Femenino', 'Adultos', 17, 39, 1, 97, 50, 50, 20.00), -- XS
('Femenino', 'Adultos', 17, 39, 2, 98, 50, 50, 20.00), -- S
('Femenino', 'Adultos', 17, 39, 3, 99, 50, 50, 20.00), -- M
('Femenino', 'Adultos', 17, 39, 4, 100, 50, 50, 20.00), -- L


-- Producto Disfraz años 20
('Masculino', 'Adultos', 19, 51, 5, 101, 50, 50, 20.00), -- XL
('Unisex', 'Adultos', 19, 51, 6, 102, 50, 50, 20.00), -- XXL
('Unisex', 'Adultos',19, 51, 7, 103, 50, 50, 20.00), -- XXXL
('Unisex', 'Adultos', 19, 51, 8, 104, 50, 50, 20.00), -- 4U
('Unisex', 'Adultos', 19, 51, 9, 105, 50, 50, 20.00), -- 5U

-- Producto Disfraz años 50
('Masculino', 'Adultos', 19, 51, 5, 106, 50, 50, 20.00), -- XL
('Unisex', 'Adultos', 19, 51, 6, 107, 50, 50, 20.00), -- XXL
('Unisex', 'Adultos', 19, 51, 7, 108, 50, 50, 20.00), -- XXXL
('Unisex', 'Adultos', 19, 51, 8, 109, 50, 50, 20.00), -- 4U
('Unisex', 'Adultos', 19, 51, 9, 110, 50, 50, 20.00), -- 5U

-- Producto Disfraz años 70
('Masculino', 'Adultos', 19, 51, 1, 111, 50, 50, 16.00), -- XS
('Unisex', 'Adultos', 19, 51, 2, 112, 50, 50, 16.00), -- S
('Unisex', 'Adultos', 19, 51, 3, 113, 50, 50, 16.00), -- M
('Unisex', 'Adultos', 19, 51, 4, 114, 50, 50, 16.00), -- L


-- Producto Disfraz años 80
('Masculino', 'Adultos', 19, 51, 1, 115, 50, 50, 20.00), -- XS
('Unisex', 'Adultos', 19, 51, 2, 116, 50, 50, 20.00), -- S
('Unisex', 'Adultos', 19, 51, 3, 117, 50, 50, 20.00), -- M
('Unisex', 'Adultos', 19, 51, 4, 118, 50, 50, 20.00), -- L


-- Producto Disfraz futurista
('Masculino', 'Adultos', 11, 36, 5, 119, 50, 50, 24.00), -- XL
('Unisex', 'Adultos', 11, 36, 6, 120, 50, 50, 24.00), -- XXL
('Unisex', 'Adultos', 11, 36, 7, 121, 50, 50, 24.00), -- XXXL
('Unisex', 'Adultos', 11, 36, 8, 122, 50, 50, 24.00), -- 4U
('Unisex', 'Adultos', 11, 36, 9, 123, 50, 50, 24.00), -- 5U

-- Producto Disfraz de ninja
('Masculino', 'Niños', 18, 34, 10, 124, 50, 50, 27.00), -- Talla 2
('Masculino', 'Niños', 18, 34, 11, 125, 50, 50, 27.00), -- Talla 4
('Masculino', 'Niños', 18, 34, 12, 126, 50, 50, 27.00), -- Talla 6


-- Producto Disfraz de samurái
('Masculino', 'Niños', 6, 37, 13, 127, 50, 50, 25.00), -- Talla 8
('Masculino', 'Niños', 6, 37, 14, 128, 50, 50, 25.00), -- Talla 10
('Masculino', 'Niños', 6, 37, 15, 129, 50, 50, 25.00), -- Talla 12


-- Producto Disfraz de hada

('Femenino', 'Niños', 13, 14, 13, 130, 50, 50, 25.00), -- Talla 8
('Femenino', 'Niños', 13, 14, 14, 131, 50, 50, 25.00), -- Talla 10
('Femenino', 'Niños', 13, 14, 15, 132, 50, 50, 25.00), -- Talla 12


-- Producto Disfraz de elfo
('Unisex', 'Adultos', 13, 50, 1, 133, 50, 50, 20.00), -- XS
('Unisex', 'Adultos', 13, 50, 2, 134, 50, 50, 20.00), -- S


-- Disfraz de dragón
('Unisex', 'Niños', 8, 51, 16, 135, 50, 50, 30.00), -- Talla 14
('Unisex', 'Niños', 8, 51,17, 136, 50, 50, 30.00), -- Talla 16
('Unisex', 'Niños', 8, 51, 18, 137, 50, 50, 30.00), -- Talla 18

-- Producto Disfraz de monstruo clásico
('Unisex', 'Niños', 14, 34, 16, 138, 50, 50, 25.00), -- Talla 14
('Unisex', 'Niños', 14, 34, 17, 139, 50, 50, 25.00), -- Talla 16
('Unisex', 'Niños', 14, 34, 18, 140, 50, 50, 25.00); -- Talla 18


INSERT INTO accesorios (tamaño, id_material, id_tipo_accesorio, id_producto, id_color, stock) VALUES
-- Anillo de calavera
('Pequeño', 15, 1, 62, 1, 30),        
-- Anillo de murciélago   
('Mediano', 2, 1, 63, 4, 20),      
-- Anillo de calabaza   
('Grande', 3, 1, 64, 12, 10),    
-- Anillo de telaraña
('Pequeño', 4, 1, 65, 8, 30),           
-- Anillo de monstruo
('Mediano', 5, 1, 66, 3, 20),      
   -- Aretes de murciélago
('Grande', 6, 2, 67, 11, 10),      
-- Aretes de calabaza
('Pequeño', 7, 2, 68, 9, 30),    
-- Aretes de fantasmas
('Mediano', 8, 2, 69, 5, 20),       
-- Cadenas de perlas
('Grande', 17, 3, 70, 6, 10),     
-- Cadenas de calaveras
('Pequeño', 1, 3, 71, 7, 30),    
-- Cintas de colores
('Mediano', 11, 4, 72, 10, 20),   
-- Cinturón de cuero
('Grande', 7, 5, 73, 5, 10),     
-- Choker de encaje
('Pequeño', 10, 6, 74, 8, 30),     
-- Choker de calabaza
('Mediano', 14, 6, 75, 6, 20),     
-- Corona de rey
('Grande', 13, 7, 76, 13, 10),     
-- Corbatín de rayas
('Mediano', 20, 8, 77, 15, 20),   
-- Collar de esqueleto     
('Grande', 21, 9, 78, 7, 10),       
-- Diadema de bruja
('Pequeño', 19, 10, 79, 9, 30),    
-- Gafas de Halloween
('Mediano', 17, 11, 80, 7, 20),      
-- Gorro de bruja
('Grande', 4, 12, 81, 2, 10),     
-- Medias de rayas
('Pequeño', 11, 13, 82, 6, 30),     
-- Pulsera de murciélago
('Mediano', 13, 14, 83, 16, 20),     
-- Sombrero de copa alta     
('Grande', 4, 15, 84, 15, 10),       
-- Tiara de princesa
('Pequeño', 1, 16, 85, 9, 30),            
-- Tiara de reina
('Mediano', 1, 16, 86, 20, 20),      
-- Anillo de espinas
('Grande', 18, 1, 87, 27, 10),       
-- Aretes de gemas
('Pequeño', 6, 2, 88, 12, 30),           
-- Anillo de gemas    
('Mediano', 6, 1, 89, 24, 20),       
-- Choker de calaveras     
('Grande', 6, 6, 90, 42, 10),       
-- Pulsera de gemas
('Pequeño', 16, 14, 91, 15, 30),      
-- Diadema de calaveras      
('Mediano', 18, 10, 92, 13, 20);  

INSERT INTO decoraciones (tamaño, id_tipo_decoracion, id_color, id_producto,stock) VALUES
('30 cm x 20 cm',8,34,32,40),
('150 cm x 80 cm',14,34,33,40),
('120 cm x 50 cm',8,10,34,20),
('150 cm x 80 cm',10,35,35,20),
('15 cm x 5 cm',24,35,36,40),
('20 cm x 15 cm',15,14,37,40),
('25 cm x 25 cm',15,34,38,40),
('100 cm x 60 cm',10,34,39,20),
('50 cm x 15 cm',10,9,40,40),
('45 cm x 30 cm',13,10,41,40),
('10 cm de diámetro por luz',15,14,42,10),
('60 cm x 40 cm',9,51,43,40),
('10 cm x 8 cm',10,22,44,10),
('200 cm x 90 cm',14,24,45,10),
('5 cm de diámetro por ojo',10,14,46,10),
('200 cm x 150 cm (tamaño estándar para cama)',7,51,47,40),
('180 cm x 200 cm',6,10,48,10),
('170 cm x 50 cm',14,51,49,30),
('30 cm x 25 cm',16,33,50,30),
('25 cm x 15 cm',10,34,51,30),
('20 cm x 10 cm',10,24,52,30),
('150 cm x 50 cm',10,9,53,10),
('30 cm x 15 cm',10,34,54,15),
('25 cm x 20 cm',18,32,55,30),
('150 cm x 60 cm',19,34,56,10),
('30 cm de diámetro',12,51,57,40),
('100 cm de largo',3,18,58,40),
('No aplica (es un efecto, no un objeto físico)',25,10,59,10),
('60 cm x 40 cm',2,35,60,15),
('150 cm x 80 cm',14,49,61,40);


INSERT INTO maquillaje(fecha_expiracion, id_tipo_maquillaje, id_tono, id_producto,stock) VALUES
('2025-01-15',16,1,1,60),
('2025-01-20',35,35,2,59),
('2025-01-25',2,10,3,58),
('2025-02-18',8,14,4,57),
('2025-03-22',14,43,5,50),
('2025-03-30',23,1,6,52),
('2025-04-14',23,1,7,50),
('2025-04-25',7,1,8,50),
('2025-04-28',36,1,9,50),
('2025-05-07',36,1,10,50),
('2025-05-18',33,19,11,50),
('2026-01-15',7,1,12,50),
('2026-01-22',26,3,13,5),
('2026-02-10',34,30,14,50),
('2026-02-20',25,45,15,50),
('2026-03-05',12,34,16,50),
('2026-03-15',18,30,17,20),
('2026-04-10',36,1,18,30),
('2026-04-18',6,1,19,40),
('2026-05-01',37,1,20,25),
('2026-05-01',37,1,21,25),
('2026-06-10',28,8,22,20),
('2026-06-20',36,16,23,25),
('2026-07-15',22,1,24,30),
('2026-08-25',19,31,25,30),
('2026-09-05',35,1,26,30),
('2026-09-30',10,1,27,45),
('2025-01-15',38,1,28,50),
('2025-01-20',38,1,29,50),
('2025-01-25',8,12,30,10),
('2025-02-10',16,1,31,50);

-- paises
INSERT INTO paises (nombre) 
VALUES 
('Argentina'), 
('Brasil'), 
('Chile'), 
('Colombia'), 
('Ecuador'), 
('Perú'), 
('Uruguay'), 
('Paraguay'), 
('Venezuela'), 
('Bolivia');


-- departamentos
INSERT INTO departamentos_estados (nombre, id_pais) 
VALUES 
('Antioquia', 4), 
('Cundinamarca', 4), 
('Valle del Cauca', 4), 
('Bolívar', 4), 
('Santander', 4), 
('Atlántico', 4), 
('Magdalena', 4), 
('Caldas', 4), 
('Cauca', 4), 
('Nariño', 4), 
('Huila', 4), 
('Quindío', 4), 
('Risaralda', 4), 
('Boyacá', 4), 
('Sucre', 4), 
('Casanare', 4), 
('Cesar', 4), 
('La Guajira', 4), 
('Arauca', 4), 
('Putumayo', 4);



-- ciudades 
INSERT INTO Ciudades_pueblos (nombre, id_departamento_estado) 
VALUES 
('Medellín', 1), 
('Bogotá', 2), 
('Cali', 3), 
('Cartagena', 4), 
('Bucaramanga', 5), 
('Barranquilla', 6), 
('Santa Marta', 7), 
('Manizales', 8), 
('Popayán', 9), 
('Pasto', 10), 
('Neiva', 11), 
('Armenia', 12), 
('Pereira', 13), 
('Tunja', 14), 
('Sincelejo', 15), 
('Yopal', 16), 
('Valledupar', 17), 
('Riohacha', 18), 
('Arauca', 19), 
('Mocoa', 20);

-- areas
INSERT INTO areas_trabajos (nombre) VALUES 
('Marketing'), 
('Atención al Cliente'), 
('Ventas'), 
('Operaciones'), 
('Logística'), 
('Recursos Humanos'), 
('Contabilidad'), 
('Tecnología'), 
('Seguridad'), 
('Calidad'), 
('Servicio Técnico'), 
('Auditoría'), 
('Comunicación');

-- puestos 
INSERT INTO puestos_trabajos (nombre, descripcion, id_area, sueldo) 
VALUES 
('Gerente de Marketing', 'Responsable de las estrategias de marketing y publicidad.', 1, 350.00), 
('Asesor de Atención al Cliente', 'Proporciona soporte y soluciones a los clientes.', 2, 150.00), 
('Ejecutivo de Ventas', 'Encargado de la venta directa de productos o servicios.', 3, 220.00), 
('Supervisor de Operaciones', 'Coordina y supervisa las operaciones diarias de la empresa.', 4, 280.00), 
('Coordinador de Logística', 'Gestiona el flujo de productos y la cadena de suministro.', 5, 260.00), 
('Especialista en Recursos Humanos', 'Encargado de la gestión del talento humano.', 6, 240.00), 
('Contador', 'Responsable de la contabilidad y gestión financiera.', 7, 250.00), 
('Desarrollador de Software', 'Desarrollo y mantenimiento de aplicaciones tecnológicas.', 8, 350.00), 
('Jefe de Seguridad', 'Supervisa la seguridad de las instalaciones.', 9, 300.00), 
('Analista de Calidad', 'Asegura que los productos cumplan con los estándares de calidad.', 10, 270.00), 
('Técnico de Servicio', 'Realiza el mantenimiento y reparación de equipos.', 11, 230.00), 
('Auditor Interno', 'Revisa y evalúa los procesos y registros contables.', 12, 320.00), 
('Especialista en Comunicación', 'Gestiona la comunicación interna y externa de la empresa.', 13, 260.00);

-- empleados
INSERT INTO empleados(nombre, telefono, correo, direccion, id_ciudad_pueblo, zipcode, fecha_contratacion, id_puesto_trabajo, estado)VALUES
('Jose Perez', '58964', 'joseperez@gmail.com', 'calle 11 # 34-70', 1, 680004, '2022-01-01', 1, 'Activo'),
('Ana Rodriguez', '58965', 'anarodriguez@gmail.com', 'calle 21 # 45-80', 2, 110111, '2022-02-15', 2, 'Activo'),
('Carlos Perez', '58966', 'carlosperez@gmail.com', 'avenida 10 # 20-30', 2, 110112, '2022-03-20', 2, 'Activo'),
('Laura Martinez', '58967', 'lauramartinez@gmail.com', 'calle 12 # 25-60', 2, 110113, '2022-04-10', 3, 'Activo'),
('Pedro Sanchez', '58968', 'pedrosanchez@gmail.com', 'calle 5 # 33-75', 2, 110114, '2022-05-05', 4, 'Activo'),
('Sandra Torres', '58969', 'sandratorres@gmail.com', 'avenida 15 # 12-80', 2, 110115, '2022-06-15', 5, 'Activo'),
('Jorge Diaz', '58970', 'jorgediaz@gmail.com', 'calle 8 # 9-40', 2, 110116, '2022-07-01', 6, 'Activo'),
('Maria Gutierrez', '58971', 'mariagutierrez@gmail.com', 'avenida 25 # 18-90', 2, 110117, '2022-08-01', 7, 'Activo'),
('Luis Vargas', '58972', 'luisvargas@gmail.com', 'calle 19 # 22-50', 2, 110118, '2022-09-10', 8, 'Activo'),
('Patricia Morales', '58973', 'patriciamorales@gmail.com', 'avenida 7 # 16-85', 2, 110119, '2022-10-20', 9, 'Activo'),
('Victor Garcia', '58974', 'victorgarcia@gmail.com', 'calle 17 # 30-60', 2, 110120, '2022-11-25', 10, 'Inactivo'),
('Carolina Mendez', '58975', 'carolinamendez@gmail.com', 'avenida 18 # 21-35', 2, 110121, '2023-01-10', 11, 'Activo'),
('Fernando Vargas', '58976', 'fernandovargas@gmail.com', 'calle 22 # 10-70', 2, 110122, '2023-02-15', 2, 'Activo'),
('Monica Rivera', '58977', 'monicarivera@gmail.com', 'calle 6 # 15-40', 2, 110123, '2023-03-20', 13, 'Inactivo'),
('Pablo Castillo', '58978', 'pablocastillo@gmail.com', 'avenida 14 # 28-50', 2, 110124, '2023-04-15', 11, 'Inactivo'),
('Valentina Suarez', '58979', 'valentinasuarez@gmail.com', 'calle 9 # 12-45', 2, 110125, '2023-05-01', 2, 'Activo'),
('Esteban Ramos', '58980', 'estebanramos@gmail.com', 'avenida 16 # 18-55', 2, 110126, '2023-06-10', 3, 'Activo'),
('Liliana Lopez', '58981', 'lilianalopez@gmail.com', 'calle 11 # 9-80', 2, 110127, '2023-07-15', 4, 'Activo'),
('Ricardo Fernandez', '58982', 'ricardofernandez@gmail.com', 'calle 20 # 13-60', 2, 110128, '2023-08-20', 5, 'Activo'),
('Camila Herrera', '58983', 'camilaherrera@gmail.com', 'avenida 19 # 24-70', 2, 110129, '2023-09-25', 6, 'Inactivo'),
('Julian Ortiz', '58984', 'julianortiz@gmail.com', 'calle 4 # 7-50', 2, 110130, '2023-10-30', 7, 'Inactivo'),
('Nathalia Reyes', '58985', 'nathaliareyes@gmail.com', 'avenida 13 # 5-60', 2, 110131, '2023-11-05', 8, 'Inactivo'),
('Felipe Gomez', '58986', 'felipegomez@gmail.com', 'calle 2 # 6-45', 2, 110132, '2023-12-10', 9, 'Inactivo'),
('Daniela Pineda', '58987', 'danielapineda@gmail.com', 'avenida 5 # 8-90', 2, 110133, '2023-12-20', 10, 'Activo'),
('Sergio Ramirez', '58988', 'sergioramirez@gmail.com', 'calle 3 # 9-30', 2, 110134, '2024-01-10', 11, 'Inactivo'),
('Gloria Cardenas', '58989', 'gloriacardenas@gmail.com', 'avenida 4 # 2-70', 1, 110135, '2024-02-15', 12, 'Activo'),
('Diego Franco', '58990', 'diegofranco@gmail.com', 'calle 23 # 3-50', 2, 110136, '2024-03-20', 13, 'Activo'),
('Angela Vargas', '58991', 'angelavargas@gmail.com', 'avenida 2 # 11-90', 2, 110137, '2024-04-15', 2, 'Activo'),
('Roberto Peña', '58992', 'robertopena@gmail.com', 'calle 16 # 14-30', 2, 110138, '2024-05-01', 2, 'Inactivo'),
('Diana Lopez', '58993', 'dianalopez@gmail.com', 'avenida 27 # 22-60', 2, 110139, '2024-06-10', 3, 'Inactivo'),
('Alejandro Rojas', '58994', 'alejandrorojo@gmail.com', 'calle 29 # 20-70', 2, 110140, '2024-07-15', 4, 'Inactivo');

-- clientes
INSERT INTO clientes(nombre, telefono, correo, direccion, id_ciudad_pueblo, zipcode, estado,vip)VALUES
('Pepito Perez', '2589631', 'pepitoperez@gmail.com','carrera 1 #4-20', 1, 110128, 'Activo', 1),
('Carolina Gomez', '2589632', 'carolinagomez@gmail.com', 'calle 22 #5-50', 1, 110129, 'Activo', 1),
('Javier Hernandez', '2589633', 'javierhernandez@gmail.com', 'avenida 12 #10-20', 2, 110130, 'Inactivo', 0),
('Paola Diaz', '2589634', 'paoladiaz@gmail.com', 'calle 8 #3-45', 3, 110131, 'Activo', 1),
('Andres Martinez', '2589635', 'andresmartinez@gmail.com', 'carrera 5 #7-60', 4, 110132, 'Activo', 0),
('Laura Rodriguez', '2589636', 'laurarodriguez@gmail.com', 'calle 18 #12-34', 5, 110133, 'Inactivo', 1),
('Daniel Vargas', '2589637', 'danielvargas@gmail.com', 'carrera 2 #16-20', 6, 110134, 'Activo', 0),
('Sofia Sanchez', '2589638', 'sofiasanchez@gmail.com', 'avenida 8 #15-45', 7, 110135, 'Activo', 1),
('Julian Perez', '2589639', 'julianperez@gmail.com', 'calle 9 #3-12', 8, 110136, 'Inactivo', 0),
('Fernanda Morales', '2589640', 'fernandamorales@gmail.com', 'carrera 11 #4-60', 9, 110137, 'Activo', 1),
('Mario Fernandez', '2589641', 'mariofernandez@gmail.com', 'avenida 14 #9-25', 10, 110138, 'Activo', 0),
('Ana Rojas', '2589642', 'anarojas@gmail.com', 'calle 20 #6-50', 11, 110139, 'Inactivo', 1),
('Carlos Gonzalez', '2589643', 'carlosgonzalez@gmail.com', 'avenida 5 #18-60', 12, 110140, 'Activo', 1),
('Claudia Suarez', '2589644', 'claudiasuarez@gmail.com', 'calle 2 #13-80', 13, 110141, 'Activo', 0),
('Diego Castillo', '2589645', 'diegocastillo@gmail.com', 'avenida 16 #8-35', 14, 110142, 'Inactivo', 1),
('Isabella Ruiz', '2589646', 'isabellaruiz@gmail.com', 'carrera 19 #10-60', 15, 110143, 'Activo', 0),
('Luis Torres', '2589647', 'luistorres@gmail.com', 'calle 12 #14-45', 16, 110144, 'Activo', 1),
('Natalia Garcia', '2589648', 'nataliagarcia@gmail.com', 'avenida 3 #17-20', 17, 110145, 'Activo', 1),
('Cristian Vargas', '2589649', 'cristianvargas@gmail.com', 'calle 7 #4-10', 18, 110146, 'Inactivo', 0),
('Valentina Lopez', '2589650', 'valentinalopez@gmail.com', 'avenida 21 #15-40', 19, 110147, 'Activo', 1),
('Ricardo Pineda', '2589651', 'ricardopineda@gmail.com', 'calle 9 #6-30', 20, 110148, 'Activo', 0),
('Luisa Marin', '2589652', 'luisamarin@gmail.com', 'carrera 15 #5-50', 1, 110149, 'Inactivo', 1),
('Samuel Jimenez', '2589653', 'samueljimenez@gmail.com', 'avenida 7 #12-20', 2, 110150, 'Activo', 1),
('Tatiana Ortiz', '2589654', 'tatianaortiz@gmail.com', 'calle 14 #9-25', 3, 110151, 'Inactivo', 0),
('Esteban Carrillo', '2589655', 'estebancarrillo@gmail.com', 'carrera 18 #5-30', 4, 110152, 'Activo', 1),
('Gabriela Reyes', '2589656', 'gabrielareyes@gmail.com', 'avenida 2 #10-15', 5, 110153, 'Activo', 1),
('Sebastian Gil', '2589657', 'sebastiangil@gmail.com', 'calle 5 #16-35', 6, 110154, 'Inactivo', 0),
('Camila Rivera', '2589658', 'camilarivera@gmail.com', 'carrera 4 #18-50', 7, 110155, 'Activo', 1),
('Miguel Castro', '2589659', 'miguelcastro@gmail.com', 'avenida 11 #2-10', 8, 110156, 'Activo', 0),
('Sara Montoya', '2589660', 'saramontoya@gmail.com', 'calle 6 #7-20', 9, 110157, 'Inactivo', 1),
('Juan Salazar', '2589661', 'juansalazar@gmail.com', 'carrera 20 #14-45', 10, 110158, 'Activo', 1),
('Andrea Cardenas', '2589662', 'andreacardenas@gmail.com', 'avenida 9 #5-80', 11, 110159, 'Inactivo', 0),
('Nicolas Luna', '2589663', 'nicolasluna@gmail.com', 'calle 1 #15-35', 12, 110160, 'Activo', 1),
('Lorena Mejia', '2589664', 'lorenamejia@gmail.com', 'avenida 22 #9-50', 13, 110161, 'Activo', 1),
('David Herrera', '2589665', 'davidherrera@gmail.com', 'carrera 6 #3-70', 14, 110162, 'Inactivo', 0),
('Karla Porras', '2589666', 'karlaporras@gmail.com', 'avenida 12 #7-25', 15, 110163, 'Activo', 1),
('Juan Alvarez', '2589667', 'juanalvarez@gmail.com', 'calle 4 #10-60', 16, 110164, 'Activo', 0),
('Diana Soto', '2589668', 'dianasoto@gmail.com', 'carrera 8 #18-90', 17, 110165, 'Inactivo', 1),
('Jose Torres', '2589669', 'josetorres@gmail.com', 'avenida 15 #7-50', 18, 110166, 'Activo', 1),
('Carla Valencia', '2589670', 'carlavalencia@gmail.com', 'calle 16 #11-10', 19, 110167, 'Activo', 0),
('Carlos Sierra', '2589671', 'carlossierra@gmail.com', 'avenida 10 #14-20', 20, 110168, 'Inactivo', 1),
('Alejandra Fuentes', '2589672', 'alejandrafuentes@gmail.com', 'calle 13 #5-35', 1, 110169, 'Activo', 1),
('Marcos Gutierrez', '2589673', 'marcosgutierrez@gmail.com', 'carrera 7 #9-25', 2, 110170, 'Inactivo', 0),
('Santiago Mejia', '2589674', 'santiagomejia@gmail.com', 'avenida 25 #3-40', 3, 110171, 'Activo', 1),
('Lucia Restrepo', '2589675', 'luciarestrepo@gmail.com', 'calle 19 #6-60', 4, 110172, 'Activo', 0),
('Carlos Rueda', '2589676', 'carlosrueda@gmail.com', 'carrera 12 #7-30', 5, 110173, 'Inactivo', 1),
('Eliana Vargas', '2589677', 'elianavargas@gmail.com', 'avenida 17 #10-50', 6, 110174, 'Activo', 1),
('Juan Robledo', '2589678', 'juanrobledo@gmail.com', 'calle 27 #11-40', 7, 110175, 'Activo', 0),
('Daniela Montalvo', '2589679', 'danielamontalvo@gmail.com', 'avenida 13 #9-10', 8, 110176, 'Inactivo', 1),
('Pedro Barrios', '2589680', 'pedrobarrios@gmail.com', 'carrera 9 #12-60', 9, 110177, 'Activo', 1);

-- metodos de pago 
INSERT INTO Metodos_pago (nombre) VALUES 
('Tarjeta de crédito'), 
('Tarjeta de débito'), 
('Transferencia bancaria'), 
('Efectivo'), 
('PayPal'), 
('Skrill'), 
('Criptomonedas'), 
('Pago en línea'), 
('Billeteras móviles'), 
('Cheque');

-- transacciones 
INSERT INTO transacciones (valor_total, fecha_hora, id_metodo_pago) VALUES
(259.80, '2022-01-05 14:30:00', 1),
(314.70, '2022-01-12 09:45:00', 2),
(320.00, '2022-02-15 11:00:00', 3),
(75.75, '2022-02-20 15:20:00', 4),
(560.25, '2022-03-03 18:00:00', 5),
(90.00, '2022-03-10 10:15:00', 6),
(45.00, '2022-04-01 09:00:00', 7),
(300.00, '2022-04-14 12:00:00', 8),
(150.50, '2022-05-07 14:30:00', 9),
(250.00, '2022-05-20 16:00:00', 10),
(100.00, '2022-06-02 11:30:00', 1),
(350.75, '2022-06-15 09:00:00', 2),
(200.00, '2022-07-10 12:45:00', 3),
(80.50, '2022-07-18 10:30:00', 4),
(130.00, '2022-08-03 16:15:00', 5),
(175.25, '2022-08-25 14:00:00', 6),
(90.00, '2022-09-12 11:45:00', 7),
(55.75, '2022-09-20 15:30:00', 8),
(120.00, '2022-10-05 09:15:00', 9),
(160.50, '2022-10-22 17:00:00', 10),
(220.00, '2022-11-01 12:00:00', 1),
(300.50, '2022-11-15 14:30:00', 2),
(500.00, '2022-12-10 10:00:00', 3),
(75.00, '2022-12-20 13:30:00', 4),
(45.00, '2023-01-05 09:45:00', 5),
(320.25, '2023-01-15 11:00:00', 6),
(250.00, '2023-02-10 14:15:00', 7),
(150.00, '2023-02-25 16:45:00', 8),
(300.00, '2023-03-03 12:30:00', 9),
(450.50, '2023-03-18 10:00:00', 10),
(100.00, '2023-04-12 14:00:00', 1),
(75.50, '2023-04-20 09:30:00', 2),
(200.25, '2023-05-01 11:15:00', 3),
(500.00, '2023-05-15 10:30:00', 4),
(90.00, '2023-06-05 16:00:00', 5),
(351.75, '2023-06-18 12:45:00', 6),
(210.00, '2024-04-16 09:00:00', 7),
(60.00, '2024-04-17 15:15:00', 8),
(472.00, '2024-04-18 14:00:00', 9),
(89.85, '2024-04-19 11:30:00', 10),
(1700.50, '2024-04-20 10:15:00', 1),
(1200.00, '2024-04-21 09:00:00', 2),
(1650.00, '2024-04-20 14:30:00', 3),
(1555.00, '2024-04-21 12:00:00', 4),
(1260.75, '2024-10-17 09:45:00', 5),
(1440.00, '2024-10-18 11:00:00', 6),
(1575.00, '2024-10-19 14:00:00', 7),
(1530.50, '2024-10-20 13:30:00', 8),
(1080.00, '2024-10-21 12:15:00', 9),
(1040.00, '2024-10-22 15:00:00', 10);

-- facturas 
INSERT INTO facturas (fecha, total, id_cliente, id_transacion, id_empleado) VALUES
('2022-01-05', 259.80, 1, 1, 2),
('2022-01-12', 314.70, 1, 2, 3),
('2022-02-15', 320.00, 1, 3, 4),
('2022-02-20', 75.75, 1, 4, 13),
('2022-03-03', 560.25, 2, 5, 16),
('2022-03-10', 90.00, 2, 6, 17),
('2022-04-01', 45.00, 2, 7, 28),
('2022-04-14', 300.00, 3, 8, 2),
('2022-05-07', 150.50, 3, 9, 3),
('2022-05-20', 250.00, 3, 10, 4),
('2022-06-02', 100.00, 3, 11, 13),
('2022-06-15', 350.75, 12, 12, 16),
('2022-07-10', 200.00, 13, 13, 17),
('2022-07-18', 80.50, 14, 14, 28),
('2022-08-03', 130.00, 15, 15, 2),
('2022-08-25', 175.25, 16, 16, 2),
('2022-09-12', 90.00, 17, 17, 3),
('2022-09-20', 55.75, 18, 18, 2),
('2022-10-05', 120.00, 19, 19, 4),
('2022-10-22', 160.50, 20, 20, 2),
('2022-11-01', 220.00, 21, 21, 13),
('2022-11-15', 300.50, 22, 22, 17),
('2022-12-10', 500.00, 23, 23, 16),
('2022-12-20', 75.00, 24, 24, 17),
('2023-01-05', 45.00, 25, 25, 28),
('2023-01-15', 320.25, 26, 26, 28),
('2023-02-10', 250.00, 27, 27, 13),
('2023-02-25', 150.00, 28, 28, 28),
('2023-03-03', 300.00, 29, 29, 16),
('2023-03-18', 450.50, 30, 30, 2),
('2023-04-12', 100.00, 31, 31, 17),
('2023-04-20', 75.50, 32, 32, 28),
('2023-05-01', 200.25, 33, 33, 16),
('2023-05-15', 500.00, 34, 34, 13),
('2023-06-05', 104.93, 35, 35, 17),
('2023-06-18', 351.00, 36, 36, 28),
('2024-04-16', 210.00, 37, 37, 13),
('2024-04-17', 60.00, 38, 38, 2),
('2024-04-18', 472.00, 39, 39, 4),
('2024-04-19', 89.85, 40, 40, 28),
('2024-04-20', 1700.00, 41, 41, 16),
('2024-04-21', 1200.00, 42, 42, 4),
('2024-04-20', 1650.00, 43, 43, 3),
('2024-04-21', 1555.00, 44, 44, 3),
('2024-10-17', 1260.00, 45, 45, 3),
('2024-10-18', 1440.00, 46, 46, 3),
('2024-10-19', 1575.00, 47, 47, 4),
('2024-10-20', 1530.00, 48, 48, 4),
('2024-10-21', 1080.00, 49, 49, 2),
('2024-10-22', 1040.00, 50, 50, 2);

-- alquiler
INSERT INTO alquiler_disfraz (id_factura, id_producto, fecha_alquiler, fecha_devolucion, valor_deposito, cantidad, estado_deposito) VALUES
(1, 93, '2022-01-05', '2022-01-10', 100.00, 5, 'Cobrado'),
(2, 94, '2022-02-15', '2022-02-20', 150.00, 8, 'Entregado'),
(3, 95, '2022-03-10', '2022-03-15', 120.00, 10, 'Cobrado'),
(4, 96, '2022-04-12', '2022-04-18', 180.00, 15, 'Cobrado'),
(5, 97, '2022-05-18', '2022-05-22', 140.00, 20, 'Entregado'),
(6, 98, '2022-06-01', '2022-06-07', 160.00, 25, 'Cobrado'),
(7, 99, '2022-07-05', '2022-07-10', 110.00, 7, 'Cobrado'),
(8, 100, '2022-08-09', '2022-08-15', 200.00, 9, 'Entregado'),
(9, 101, '2022-09-20', '2022-09-25', 100.00, 12, 'Cobrado'),
(10, 102, '2022-10-10', '2022-10-17', 175.00, 30, 'Cobrado'),
(11, 103, '2022-11-01', '2022-11-07', 130.00, 14, 'Entregado'),
(12, 104, '2022-12-15', '2022-12-20', 165.00, 20, 'Cobrado'),
(13, 105, '2023-01-05', '2023-01-12', 185.00, 10, 'Cobrado'),
(14, 106, '2023-02-14', '2023-02-20', 125.00, 18, 'Entregado'),
(15, 107, '2023-03-10', '2023-03-16', 145.00, 5, 'Cobrado'),
(16, 108, '2023-04-12', '2023-04-18', 170.00, 12, 'Cobrado'),
(17, 109, '2023-05-05', '2023-05-10', 160.00, 6, 'Entregado'),
(18, 110, '2023-06-09', '2023-06-15', 110.00, 20, 'Cobrado'),
(19, 111, '2023-07-15', '2023-07-20', 120.00, 15, 'Cobrado'),
(20, 112, '2023-08-10', '2023-08-17', 135.00, 7, 'Entregado'),
(21, 113, '2023-09-22', '2023-09-28', 190.00, 9, 'Cobrado'),
(22, 114, '2023-10-08', '2023-10-13', 140.00, 8, 'Cobrado'),
(23, 115, '2023-11-12', '2023-11-18', 130.00, 11, 'Entregado'),
(24, 116, '2023-12-01', '2023-12-07', 150.00, 13, 'Cobrado'),
(25, 117, '2023-01-15', '2023-01-20', 170.00, 18, 'Cobrado'),
(26, 118, '2023-02-10', '2023-02-15', 180.00, 20, 'Entregado'),
(27, 119, '2023-03-05', '2023-03-12', 200.00, 19, 'Cobrado'),
(28, 120, '2023-04-14', '2023-04-18', 155.00, 16, 'Cobrado'),
(29, 121, '2023-05-05', '2023-05-10', 125.00, 8, 'Entregado'),
(30, 122, '2023-06-10', '2023-06-16', 185.00, 5, 'Cobrado'),
(31, 123, '2023-07-12', '2023-07-18', 195.00, 22, 'Cobrado'),
(32, 124, '2023-08-20', '2023-08-25', 140.00, 15, 'Entregado'),
(33, 125, '2023-09-10', '2023-09-15', 165.00, 7, 'Cobrado'),
(34, 126, '2023-10-01', '2023-10-07', 150.00, 10, 'Cobrado'),
(35, 127, '2023-11-08', '2023-11-12', 130.00, 12, 'Entregado'),
(36, 128, '2023-12-01', '2023-12-08', 160.00, 11, 'Entregado'),
(37, 129, '2023-04-16', '2023-04-18', 145.00, 9, 'Entregado'),
(38, 130, '2024-04-17', '2024-04-19', 170.00, 10, 'Entregado'),
(39, 131, '2024-04-18', '2024-04-21', 180.00, 8, 'Entregado'),
(40, 132, '2024-04-19', '2024-04-20', 120.00, 13, 'Entregado'),
(41, 133, '2024-04-22', '2024-04-22', 135.00, 6, 'Entregado'),
(42, 134, '2024-04-23', '2024-04-24', 110.00, 19, 'Entregado'),
(43, 135, '2024-04-22', '2024-04-23', 125.00, 14, 'Entregado'),
(44, 136, '2024-04-23', '2024-04-23', 150.00, 17, 'Entregado'),
(45, 137, '2024-10-28', '2024-10-29', 185.00, 20, 'Pendiente'),
(46, 138, '2024-10-28', '2024-10-29', 175.00, 9, 'Pendiente'),
(47, 139, '2024-10-28', '2024-10-29', 190.00, 8, 'Pendiente'),
(48, 140, '2024-10-28', '2024-10-29', 120.00, 12, 'Pendiente'),
(49, 93, '2024-10-28', '2024-10-29', 135.00, 7, 'Pendiente'),
(50, 94, '2024-10-28', '2024-10-29', 160.00, 5, 'Pendiente');

-- proveedores
INSERT INTO proveedores(nit,nombre_empresa,nombre_contacto,telefono,correo,direccion,id_ciudad_pueblo,zipcode) VALUES
(123456789, 'Maquillaje Efectos', 'Juan Libardo', '332789123', 'ventas@maquillajefx.com', 'carrera 1 #1-11', 5, 601002),
(987654321, 'Tecnología y Maquillaje', 'Carlos Ortiz', '321456987', 'carlos@tecnomakeup.com', 'avenida 5 #14-32', 1, 110003),
(654321987, 'Accesorios de Maquillaje', 'María Castro', '456789321', 'maria@accesoriomaquillaje.com', 'calle 11 #5-20', 4, 110006),
(741852963, 'Distribuciones de Maquillaje', 'Fernando Pérez', '123654789', 'fernando@distrimaquillaje.com', 'avenida 15 #10-30', 5, 110007),
(321654987, 'Sombras y Colores', 'Javier Mejía', '321654987', 'javier@sombrascolores.com', 'calle 18 #3-50', 7, 110009),
(963852741, 'Polvos y Estilos', 'Gloria Valencia', '654321987', 'gloria@polvosyestilos.com', 'avenida 9 #16-60', 8, 110010),
(456123789, 'Estilos Halloween', 'Diego Rodríguez', '159753258', 'diego@estiloshalloween.com', 'calle 7 #11-45', 9, 110011),
(147258369, 'Maquillaje y Glamour', 'Natalia Torres', '147258963', 'natalia@maquillajeyglamour.com', 'avenida 12 #5-70', 12, 110014),
(963741852, 'Estilo Fantasía', 'Camilo Herrera', '963741852', 'camilo@estilofantasia.com', 'calle 22 #13-55', 13, 110015),
(654987321, 'Maquillaje de Época', 'Oscar Moreno', '654987123', 'oscar@maquillajedepoca.com', 'avenida 11 #10-80', 18, 110020),
(852741963, 'Maquillaje Sobrenatural', 'Laura Gil', '852741963', 'laura@maquillajesobrenatural.com', 'calle 9 #13-25', 19, 110021),
(963258147, 'Accesorios de Fantasía', 'Sofía López', '963258123', 'sofia@accesoriosfantasia.com', 'calle 8 #11-50', 1, 110023),
(159486753, 'Maquillaje Escénico', 'Rodrigo Vargas', '159486753', 'rodrigo@maquillajeescenico.com', 'avenida 17 #14-60', 2, 110024),
(321789654, 'Fiesta de Maquillaje', 'Pedro Gutiérrez', '321789456', 'pedro@fiestamaquillaje.com', 'carrera 11 #3-30', 4, 110026),
(987321654, 'Efectos Visuales FX', 'María Toledo', '987321456', 'maria@fxvisuales.com', 'Zona franca', 5, 110028),
(963852147, 'Estilo Sobrenatural', 'Eduardo Fuentes', '963852741', 'eduardo@estilosobrenatural.com', 'carrera 16 #6-35', 8, 110030),
(258147963, 'Maquillaje Creativo', 'Patricia Ocampo', '258147963', 'patricia@maquillajecreativo.com', 'avenida 20 #10-55', 9, 110031),
(654123789, 'Distribuciones Artísticas', 'César Ortiz', '654123258', 'cesar@distrartisticos.com', 'calle 5 #14-75', 10, 110032),
(789654321, 'Sombra de Época', 'Liliana Ramírez', '789654987', 'liliana@sombradeepoca.com', 'avenida 23 #9-40', 12, 110033),
(111223334, 'Terror Fest', 'Luis Halloween', '3001234567', 'luis@terrorfest.com', 'calle 31 #15-20', 1, 110001),
(222334445, 'Disfraces y Más', 'Ana Espeluznante', '3002345678', 'ana@disfracesymas.com', 'carrera 6 #24-33', 2, 110002),
(333445556, 'Decoraciones Macabras', 'Carlos Tenebroso', '3003456789', 'carlos@decoracionesmacabras.com', 'avenida 10 #5-80', 3, 110003),
(444556667, 'Calabazas y Luces', 'Sofía Oscura', '3004567890', 'sofia@calabazasyuces.com', 'calle 19 #3-70', 4, 110004),
(555667778, 'Eventos de Miedo', 'Pedro Misterioso', '3005678901', 'pedro@eventosdemiedo.com', 'carrera 12 #18-40', 5, 110005),
(666778889, 'Monstruos en Acción', 'Laura Fantasmal', '3006789012', 'laura@monstruosenaccion.com', 'avenida 25 #7-60', 6, 110006),
(777889990, 'Sombras y Espectros', 'Javier Sobrenatural', '3007890123', 'javier@sombrasyespectros.com', 'calle 30 #9-50', 7, 110007),
(888990001, 'Cuentos de Terror', 'Marta Hechicera', '3008901234', 'marta@cuentosdeterror.com', 'carrera 5 #14-70', 8, 110008),
(999001112, 'Fiestas Embrujadas', 'David Nocturno', '3009012345', 'david@fiestasembrujadas.com', 'avenida 17 #8-90', 9, 110009),
(101112223, 'Misterios Nocturnos', 'Verónica Espectral', '3000123456', 'veronica@misteriosnocturnos.com', 'calle 22 #11-45', 10, 110010);

-- facturas_proveedor
INSERT INTO facturas_proveedor (fecha, total, nit) VALUES
('2020-01-01', 1000.00, 123456789),
('2020-01-30', 2400.00, 888990001),
('2020-02-01', 1750.00, 999001112),
('2020-02-05', 1900.00, 101112223),
('2020-10-01', 1500.00, 987654321),
('2020-10-25', 1900.00, 456123789),
('2020-10-30', 2100.00, 147258369),
('2020-11-01', 1600.00, 963741852),
('2020-11-05', 2000.00, 654987321),
('2020-12-10', 2400.00, 258147963),
('2020-12-15', 1900.00, 654123789),
('2020-12-20', 2050.00, 789654321),
('2020-12-25', 1750.00, 111223334),
('2021-01-01', 1800.00, 222334445),
('2021-01-05', 1600.00, 333445556),
('2021-01-10', 2000.00, 444556667),
('2021-01-15', 2200.00, 555667778),
('2021-01-20', 2100.00, 666778889),
('2021-01-25', 2300.00, 777889990),
('2021-10-05', 2000.00, 654321987),
('2021-10-10', 1800.00, 741852963),
('2021-10-15', 2200.00, 321654987),
('2021-10-20', 1700.00, 963852741),
('2024-01-10', 2500.00, 852741963),
('2024-07-15', 1700.00, 963258147),
('2024-08-20', 1900.00, 159486753),
('2024-09-25', 1800.00, 321789654),
('2024-10-01', 2150.00, 987321654),
('2024-10-05', 2300.00, 963852147);

-- transportadoras
INSERT INTO transportadoras(nit_transportadora, nombre, telefono, correo)VALUES 
(1234569, 'Coordinadora', '123456789', 'coordinador@gmail.com'),
(987654321, 'Servientrega', '987654321', 'servientrega@gmail.com'),
(111111111, 'Copetran', '111111111', 'Copetran@gmail.com'),
(222222222, 'Tolima Express', '222222222', 'Tolima@gmail.com'),
(333333333, 'Santander Express', '333333333', 'Santander@gmail.com'),
(444444444, 'DHL', '444444444', 'DHL@gmail.com');

-- envios
INSERT INTO envios (estado, direccion_envio, id_ciudad_pueblo, zipcode, nit_transportadora, fecha_envio, id_factura) 
VALUES

('Entregado', 'Calle 123 #45-67', 1, 050001, 1234569, '2022-01-06', 1),
('Entregado', 'Carrera 10 #15-30', 2, 110111, 987654321, '2022-01-13', 2),
('Entregado', 'Avenida 68 #70-90', 3, 760001, 111111111, '2022-02-16', 3),
('Entregado', 'Calle 45 #20-60', 4, 130001, 222222222, '2022-02-21', 4),
('Entregado', 'Carrera 7 #65-20', 5, 250001, 333333333, '2022-03-04', 5),
('Entregado', 'Avenida 9 #80-55', 6, 410001, 444444444, '2022-03-11', 6),
('Entregado', 'Calle 50 #30-80', 1, 760001, 1234569, '2022-04-02', 7),
('Entregado', 'Calle 20 #10-40', 2, 470001, 987654321, '2022-04-15', 8),
('Entregado', 'Calle 100 #45-67', 3, 500001, 111111111, '2022-05-08', 9),
('Entregado', 'Carrera 50 #60-70', 4, 860001, 222222222, '2022-05-21', 10),
('Entregado', 'Avenida 33 #22-12', 5, 630001, 333333333, '2022-02-11', 41),
('Entregado', 'Calle 30 #15-18', 6, 190001, 444444444, '2022-02-12', 42),
('Entregado', 'Carrera 40 #20-30', 1, 520001, 987654321, '2022-02-13', 43),
('Entregado', 'Calle 5 #10-20', 2, 730001, 111111111, '2022-02-14', 44),
('En transito', 'Avenida 80 #50-60', 3, 730001, 222222222, '2022-02-15', 45),
('En transito', 'Calle 90 #80-100', 4, 470001, 333333333, '2022-02-16', 46),
('En transito', 'Carrera 13 #50-70', 5, 630001, 111111111, '2022-02-17', 47),
('Preparacion', 'Calle 24 #40-30', 6, 410001, 1234569, '2024-10-18', 48),
('Preparacion', 'Avenida 56 #32-20', 1, 190001, 987654321, '2024-10-19', 49),
('Preparacion', 'Carrera 7 #90-85', 2, 520001, 111111111, '2024-10-20', 50);




-- tipos_gastos
INSERT INTO tipos_gastos(nombre)VALUES 
('Servio de luz'),
('Servicio de agua'),
('Servicio de gas'),
('Reparaciones'),
('Arriendo');

-- Gastos_operativos
INSERT INTO gastos_operativos(id_tipo_gasto, descripcion, fecha_pago, valor)
VALUES 
(1, 'Pago luz', '2024-04-15', 320.00),
(2, 'Pago agua', '2024-04-15', 120.50),
(3, 'Pago gas', '2024-04-16', 80.75),
(4, 'Reparación de tuberías', '2024-06-18', 450.00),
(5, 'Pago arriendo oficina', '2024-06-01', 1500.00),
(1, 'Pago luz', '2024-07-15', 310.00),
(2, 'Pago agua', '2024-07-15', 125.00),
(3, 'Pago gas', '2024-07-16', 85.00),
(4, 'Reparación de aire acondicionado', '2024-07-18', 600.00),
(5, 'Pago arriendo oficina', '2024-07-01', 1500.00),
(1, 'Pago luz', '2024-08-15', 295.00),
(2, 'Pago agua', '2024-08-15', 130.25),
(3, 'Pago gas', '2024-08-16', 78.50),
(4, 'Reparación eléctrica', '2024-08-20', 500.00),
(5, 'Pago arriendo oficina', '2024-08-01', 1500.00),
(1, 'Pago luz', '2024-09-15', 305.50),
(2, 'Pago agua', '2024-09-15', 140.00),
(3, 'Pago gas', '2024-09-16', 82.75),
(4, 'Reparación de fachada', '2024-09-22', 700.00),
(5, 'Pago arriendo oficina', '2024-09-01', 1500.00);


-- compra_producto
INSERT INTO compra_producto (id_factura_proveedor, id_producto, cantidad) 
VALUES
(1, 1, 50),   
(2, 2, 50),   
(3, 3, 50),   
(4, 4, 50),  
(5, 5, 50),   
(6, 6, 50),   
(7, 7, 50),   
(8, 8, 50),  
(9, 9, 50),   
(10, 10, 50),  
(11, 11, 50),  
(12, 12, 50),  
(13, 13, 50),  
(14, 14, 50),  
(15, 32, 40),  
(16, 33, 40), 
(17, 34, 20),  
(18, 35, 20),  
(19, 36, 40),  
(20, 37, 40), 
(21, 38, 40),  
(22, 39, 20),  
(23, 40, 40),  
(24, 41, 40),  
(25, 42, 10),  
(26, 43, 40),  
(27, 44, 10),   
(28, 45, 10),   
(29, 46, 10),   
(1, 62, 30),  
(2, 63, 20), 
(3, 64, 10), 
(4, 65, 30),  
(5, 66, 20),  
(6, 67, 10),  
(7, 68, 30), 
(8, 69, 20), 
(9, 70, 10), 
(10, 71, 30), 
(11, 72, 20), 
(12, 93, 50),  
(13, 94, 50),   
(14, 95, 50),  
(15, 96, 50),   
(16, 97, 50),   
(17, 98, 50),   
(18, 99, 50),   
(19, 100, 50),   
(20, 101, 50),   
(14, 102, 50);  

-- venta producto
INSERT INTO venta_producto (id_factura, id_producto, cantidad) VALUES
(1, 1, 20),   
(2, 2, 30),   
(3, 3, 30),   
(4, 4, 42),  
(5, 5, 29),   
(6, 6, 23),   
(7, 7, 40),   
(8, 8, 32),  
(9, 9, 33),   
(10, 10, 30),  
(11, 11, 32),  
(12, 12, 42),  
(13, 13, 45),  
(14, 14, 33),  
(15, 32, 20),  
(16, 33, 20), 
(17, 34, 10),  
(18, 35, 12),  
(19, 36, 20),  
(20, 37, 20), 
(21, 38, 20),  
(22, 39, 19),  
(23, 40, 13),  
(24, 41, 28),  
(25, 42, 2),  
(26, 43, 22),  
(27, 44, 5),   
(28, 45, 4),   
(29, 46, 5),   
(30, 62, 23),  
(31, 63, 12), 
(32, 64, 5), 
(33, 65, 26),  
(34, 66, 18),  
(35, 67, 7),  
(36, 68, 26), 
(37, 69, 14), 
(38, 70, 3), 
(39, 71, 21), 
(40, 72, 15), 
(41, 93, 34),  
(42, 94, 24),   
(43, 95, 33),  
(44, 96, 31),   
(45, 97, 28),   
(46, 98, 32),   
(47, 99, 35),   
(48, 100, 34),   
(49, 101, 27),   
(50, 102, 26);  















