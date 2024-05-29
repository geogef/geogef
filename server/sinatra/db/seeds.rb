require './app'
require './models/topic'
require './models/question'
require './models/option'
require './models/qa'
require './models/lesson'
require './models/exam'
require './models/level'
require './models/material'

Material.destroy_all
Qa.destroy_all
Question.destroy_all
Option.destroy_all
Exam.destroy_all
Level.destroy_all
Lesson.destroy_all
Topic.destroy_all   

topics_data = [
  { topic: 'Banderas' },
  { topic: 'Geografía Politica' },
  { topic: 'Geografía Humana' },
  { topic: 'Continentes' },
  { topic: 'Océanos y Mares' },
  { topic: 'Capitales' },
]

lessons_data = [
    { 
      title: 'Lección Geografía Física',
      name_topic: 'Geografía Física',
      description: 'Esta lección abarca el estudio de las características naturales de la Tierra, incluyendo formas del terreno, cuerpos de agua, clima, suelos y vegetación.',
      num_levels: 6
    },
    { 
      title: 'Lección Geografía Humana',
      name_topic: 'Geografía Humana',
      description: 'Esta lección explora los aspectos espaciales de la existencia humana, centrándose en temas como población, migración, cultura, urbanización y actividades económicas.',
      num_levels: 6
    },
    { 
      title: 'Lección Geografía Política',
      name_topic: 'Geografía Política',
      description: 'Esta lección examina la organización política del mundo, incluyendo países, estados, fronteras, gobiernos y cuestiones geopolíticas.',
      num_levels: 6
    },
    { 
      title: 'Lección Continentes',
      name_topic: 'Continentes',
      description: 'Esta lección introduce los siete continentes del mundo, sus características geográficas y poblaciones.',
      num_levels: 2
    },
    { 
      title: 'Lección Océanos y Mares',
      name_topic: 'Océanos y Mares',
      description: 'Esta lección abarca los océanos y mares de la Tierra, incluyendo sus características físicas y ubicacíón.',
      num_levels: 4
    },
    { 
      title: 'Lección Banderas',
      name_topic: 'Banderas',
      description: 'Esta lección explora las banderas de varios países, sus símbolos y colores.',
      num_levels: 6
    },
    { 
      title: 'Lección Capitales',
      name_topic: 'Capitales',
      description: 'Esta lección cubre las capitales de los países del mundo.',
      num_levels: 6
    }
  ]
  
levels_data = [
  { number: 1, name: 'Nivel Geografía Física 1', lesson_title: 'Lección Geografía Física' },
  { number: 2, name: 'Nivel Geografía Física 2', lesson_title: 'Lección Geografía Física' },
  { number: 3, name: 'Nivel Geografía Física 3', lesson_title: 'Lección Geografía Física' },
  { number: 4, name: 'Nivel Geografía Física 4', lesson_title: 'Lección Geografía Física' },
  { number: 5, name: 'Nivel Geografía Física 5', lesson_title: 'Lección Geografía Física' },
  { number: 6, name: 'Nivel Geografía Física 6', lesson_title: 'Lección Geografía Física' },
  { number: 1, name: 'Nivel Geografía Humana 1', lesson_title: 'Lección Geografía Humana' },
  { number: 2, name: 'Nivel Geografía Humana 2', lesson_title: 'Lección Geografía Humana' },
  { number: 3, name: 'Nivel Geografía Humana 3', lesson_title: 'Lección Geografía Humana' },
  { number: 4, name: 'Nivel Geografía Humana 4', lesson_title: 'Lección Geografía Humana' },
  { number: 5, name: 'Nivel Geografía Humana 5', lesson_title: 'Lección Geografía Humana' },
  { number: 6, name: 'Nivel Geografía Humana 6', lesson_title: 'Lección Geografía Humana' },
  { number: 1, name: 'Nivel Geografía Política 1', lesson_title: 'Lección Geografía Política' },
  { number: 2, name: 'Nivel Geografía Política 2', lesson_title: 'Lección Geografía Política' },
  { number: 3, name: 'Nivel Geografía Política 3', lesson_title: 'Lección Geografía Política' },
  { number: 4, name: 'Nivel Geografía Política 4', lesson_title: 'Lección Geografía Política' },
  { number: 5, name: 'Nivel Geografía Política 5', lesson_title: 'Lección Geografía Política' },
  { number: 6, name: 'Nivel Geografía Política 6', lesson_title: 'Lección Geografía Política' },
  { number: 1, name: 'Nivel Continentes 1', lesson_title: 'Lección Continentes' },
  { number: 2, name: 'Nivel Continentes 2', lesson_title: 'Lección Continentes' },
  { number: 1, name: 'Nivel Océanos y Mares 1', lesson_title: 'Lección Océanos y Mares' },
  { number: 2, name: 'Nivel Océanos y Mares 2', lesson_title: 'Lección Océanos y Mares' },
  { number: 3, name: 'Nivel Océanos y Mares 3', lesson_title: 'Lección Océanos y Mares' },
  { number: 4, name: 'Nivel Océanos y Mares 4', lesson_title: 'Lección Océanos y Mares' },
  { number: 1, name: 'Nivel Banderas 1', lesson_title: 'Lección Banderas' },
  { number: 2, name: 'Nivel Banderas 2', lesson_title: 'Lección Banderas' },
  { number: 3, name: 'Nivel Banderas 3', lesson_title: 'Lección Banderas' },
  { number: 4, name: 'Nivel Banderas 4', lesson_title: 'Lección Banderas' },
  { number: 5, name: 'Nivel Banderas 5', lesson_title: 'Lección Banderas' },
  { number: 6, name: 'Nivel Banderas 6', lesson_title: 'Lección Banderas' },
  { number: 1, name: 'Nivel Capitales 1', lesson_title: 'Lección Capitales' },
  { number: 2, name: 'Nivel Capitales 2', lesson_title: 'Lección Capitales' },
  { number: 3, name: 'Nivel Capitales 3', lesson_title: 'Lección capitales' },
  { number: 4, name: 'Nivel Capitales 4', lesson_title: 'Lección Capitales' },
  { number: 5, name: 'Nivel Capitales 5', lesson_title: 'Lección Capitales' },
  { number: 6, name: 'Nivel Capitales 6', lesson_title: 'Lección Capitales' }
]

exams_data = [
  { name: 'Examen Geografía Física 1', duration: 30, level_name: 'Nivel Geografía Física 1', lesson: 'Lección Geografía Física' },
  { name: 'Examen Geografía Física 2', duration: 30, level_name: 'Nivel Geografía Física 2', lesson: 'Lección Geografía Física' },
  { name: 'Examen Geografía Física 3', duration: 30, level_name: 'Nivel Geografía Física 3', lesson: 'Lección Geografía Física' },
  { name: 'Examen Geografía Física 4', duration: 30, level_name: 'Nivel Geografía Física 4', lesson: 'Lección Geografía Física' },
  { name: 'Examen Geografía Humana 1', duration: 30, level_name: 'Nivel Geografía Humana 1', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Humana 2', duration: 30, level_name: 'Nivel Geografía Humana 2', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Humana 3', duration: 30, level_name: 'Nivel Geografía Humana 3', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Humana 4', duration: 30, level_name: 'Nivel Geografía Humana 4', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Política 1', duration: 30, level_name: 'Nivel Geografía Política 1', lesson: 'Lección Geografía Política' },
  { name: 'Examen Geografía Política 2', duration: 30, level_name: 'Nivel Geografía Política 2', lesson: 'Lección Geografía Política' },
  { name: 'Examen Geografía Política 3', duration: 30, level_name: 'Nivel Geografía Política 3', lesson: 'Lección Geografía Política' },
  { name: 'Examen Geografía Política 4', duration: 30, level_name: 'Nivel Geografía Política 4', lesson: 'Lección Geografía Política' },
  { name: 'Examen Continentes 1', duration: 30, level_name: 'Nivel Continentes 1', lesson: 'Lección Continentes' },
  { name: 'Examen Continentes 2', duration: 30, level_name: 'Nivel Continentes 2', lesson: 'Lección Continentes' },
  { name: 'Examen Océanos y Mares 1', duration: 30, level_name: 'Nivel Océanos y Mares 1', lesson: 'Lección Océanos y Mares' },
  { name: 'Examen Océanos y Mares 2', duration: 30, level_name: 'Nivel Océanos y Mares 2', lesson: 'Lección Océanos y Mares' },
  { name: 'Examen Océanos y Mares 3', duration: 30, level_name: 'Nivel Océanos y Mares 3', lesson: 'Lección Océanos y Mares' },
  { name: 'Examen Océanos y Mares 4', duration: 30, level_name: 'Nivel Océanos y Mares 4', lesson: 'Lección Océanos y Mares' },
  { name: 'Examen Banderas 1', duration: 30, level_name: 'Nivel Banderas 1', lesson: 'Lección Banderas' },
  { name: 'Examen Banderas 2', duration: 30, level_name: 'Nivel Banderas 2', lesson: 'Lección Banderas' },
  { name: 'Examen Banderas 3', duration: 30, level_name: 'Nivel Banderas 3', lesson: 'Lección Banderas' },
  { name: 'Examen Banderas 4', duration: 30, level_name: 'Nivel Banderas 4', lesson: 'Lección Banderas' },
  { name: 'Examen Banderas 5', duration: 30, level_name: 'Nivel Banderas 5', lesson: 'Lección Banderas' },
  { name: 'Examen Banderas 6', duration: 30, level_name: 'Nivel Banderas 6', lesson: 'Lección Banderas' },
  { name: 'Examen Capitales 1', duration: 30, level_name: 'Nivel Capitales 1', lesson: 'Lección Capitales' },
  { name: 'Examen Capitales 2', duration: 30, level_name: 'Nivel Capitales 2', lesson: 'Lección Capitales' },
  { name: 'Examen Capitales 3', duration: 30, level_name: 'Nivel Capitales 3', lesson: 'Lección Capitales' },
  { name: 'Examen Capitales 4', duration: 30, level_name: 'Nivel Capitales 4', lesson: 'Lección Capitales' },
  { name: 'Examen Capitales 5', duration: 30, level_name: 'Nivel Capitales 5', lesson: 'Lección Capitales' },
  { name: 'Examen Capitales 6', duration: 30, level_name: 'Nivel Capitales 6', lesson: 'Lección Capitales' }
]

questions_data = [
  { question: '¿Qué es un país?', correct_option: 'Una entidad territorial y política', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es un volcán?', correct_option: 'Una montaña formada por la acumulación de materiales expulsados desde el interior de la Tierra', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Cómo se define una capital en geografía?', correct_option: 'Centro administrativo y político de un país o estado.', topic: 'Geografía Política' },
  { question: '¿Qué caracteriza a un desierto?', correct_option: 'Una región árida y seca con poca o ninguna vegetación y poca precipitación', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es un istmo?', correct_option: 'Una franja estrecha de tierra que conecta dos áreas de tierra más grandes y está rodeada por agua en ambos lados', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Cuál es la característica principal de un archipiélago?', correct_option: 'Un grupo o conjunto de islas cercanas entre sí en un cuerpo de agua', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es un golfo?', correct_option: 'Una porción de océano o mar parcialmente rodeada por tierra', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Cuál es la definición de una isla?', correct_option: 'Una masa de tierra rodeada completamente por agua', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es un río?', correct_option: 'Una corriente natural de agua que fluye en una dirección específica a través de la superficie terrestre', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué son las placas tectónicas en geografía física?', correct_option: 'Son fragmentos de la litosfera terrestre que se mueven sobre el manto terrestre.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es la meteorización?', correct_option: 'El proceso de descomposición y desgaste de rocas y suelo debido a factores como el clima y la acción biológica', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué son las montañas?', correct_option: 'Elevaciones naturales del terreno que se caracterizan por su altura y relieve escarpado', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es la tundra?', correct_option: 'Un bioma frío y árido caracterizado por suelos congelados y vegetación escasa, como musgos y líquenes', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Cuál es el proceso de erosión más común en las costas?', correct_option: 'La acción del oleaje y las corrientes marinas', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es el permafrost?', correct_option: 'Suelo permanentemente congelado que se encuentra en regiones frías, como el Ártico', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es un acuífero?', correct_option: 'Una formación geológica subterránea que almacena y transmite agua subterránea', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Cuál es el efecto de la deforestación en el medio ambiente?', correct_option: 'La pérdida de biodiversidad, el cambio climático y la degradación del suelo', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué son los glaciares?', correct_option: 'Grandes masas de hielo que se forman en tierra y se mueven lentamente debido a la gravedad', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es el ciclo del agua?', correct_option: 'El proceso continuo de evaporación, condensación, precipitación y escorrentía que mueve el agua a través del ambiente terrestre', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es un ecosistema?', correct_option: 'Una comunidad biológica de organismos vivos interactuando con su entorno físico', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es un delta?', correct_option: 'Una acumulación de sedimentos al final de un río, donde el agua fluvial se encuentra con el océano o un cuerpo de agua más grande', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es una meseta?', correct_option: 'Una extensa área de terreno plano o ligeramente inclinado elevado sobre la tierra circundante', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un glacial?', correct_option: 'Una gran masa de hielo que se mueve lentamente a través de la superficie de la Tierra debido a la acumulación y compresión de nieve', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué son los humedales?', correct_option: 'Áreas de tierra que están inundadas de forma permanente o temporal, como pantanos, pantanos y manglares', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un fenómeno natural?', correct_option: 'Un evento o proceso que ocurre en la naturaleza y no es causado por la actividad humana', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un archipiélago?', correct_option: 'Un grupo o cadena de islas dispersas en un cuerpo de agua más grande', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un acantilado?', correct_option: 'Una pared rocosa vertical o inclinada que se encuentra junto a una masa de agua, como un océano o un río', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un fósil?', correct_option: 'Los restos o vestigios de organismos que vivieron en el pasado, conservados en rocas sedimentarias.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Cuál es la definición de lluvia ácida?', correct_option: 'Precipitación atmosférica que contiene altos niveles de ácidos, debido a la combinación de la humedad en el aire con óxidos de azufre y nitrógeno liberados por fuentes naturales y humanas.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es la desertificación?', correct_option: 'La degradación de las tierras áridas, semiáridas y subhúmedas debido a varios factores, como el cambio climático y las actividades humanas, que lleva a la pérdida de la productividad del suelo y la vegetación.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué se entiende por línea de costa?', correct_option: 'La línea que marca el límite entre la tierra y el mar en una costa, sujeto a cambios debido a la erosión y la sedimentación.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es la biósfera?', correct_option: 'La capa de la Tierra que sustenta la vida, que incluye la superficie terrestre, los océanos y la atmósfera.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Cuál es la definición de península?', correct_option: 'Una porción de tierra rodeada de agua por tres lados, que se extiende hacia el cuerpo principal de tierra.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es la pluviosidad?', correct_option: 'La cantidad de precipitación medida en un área durante un período específico de tiempo.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es un estuario?', correct_option: 'Un área donde un río se encuentra con el mar, con un flujo y reflujo de agua salada y agua dulce, y un hábitat importante para la vida acuática.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué se entiende por continentalidad?', correct_option: 'El grado en que el clima de un área está influenciado por su ubicación lejos del océano y más hacia el interior de una masa de tierra.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Cuál es la definición de precipitación?', correct_option: 'Cualquier forma de agua, líquida o sólida, que cae de la atmósfera y llega a la superficie terrestre.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es un relámpago?', correct_option: 'Una descarga eléctrica visible producida durante una tormenta eléctrica, que resulta de la separación de cargas eléctricas en la atmósfera.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué se entiende por afloramiento rocoso?', correct_option: 'Una formación geológica donde las rocas subterráneas son expuestas en la superficie debido a la erosión o la actividad tectónica.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Cuál es la definición de convección?', correct_option: 'El movimiento de fluidos, como aire o agua, causado por diferencias en la temperatura y la densidad, que transporta calor desde una fuente caliente a otra más fría.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es la hidrografía?', correct_option: 'El estudio y la descripción de las aguas superficiales de la Tierra, incluyendo océanos, mares, ríos, lagos y sus características físicas y distribución.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es el clima?', correct_option: 'El patrón promedio del tiempo atmosférico en un área particular, que incluye temperatura, humedad, viento y precipitación, a lo largo de un período prolongado.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué son las dunas de arena?', correct_option: 'Montículos o colinas de arena creados por la acción del viento en áreas desérticas o costeras', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es una llanura aluvial?', correct_option: 'Una llanura plana o ligeramente inclinada formada por sedimentos depositados por un río durante períodos de inundación', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es la tundra?', correct_option: 'Una región fría y árida caracterizada por la falta de árboles, vegetación escasa y suelos congelados gran parte del año', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es un atolón?', correct_option: 'Un anillo de coral o islote que rodea una laguna de agua salada en medio del océano', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es una cascada?', correct_option: 'Una caída vertical o inclinada de agua en un río o arroyo, a menudo causada por un cambio brusco en el terreno', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es un arrecife de coral?', correct_option: 'Una estructura submarina formada por la acumulación de esqueletos de coral y otros organismos marinos', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué son los fiordos?', correct_option: 'Valles glaciares inundados por el mar, creando una forma de entrante costero con acantilados empinados', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Cuál es la función de un estuario?', correct_option: 'Los estuarios actúan como hábitats importantes para la vida marina, proporcionan protección contra inundaciones y erosionan los sedimentos antes de que lleguen al océano', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es una cordillera submarina?', correct_option: 'Una cadena de montañas submarinas que se extiende a lo largo del fondo del océano, generalmente formada por actividad volcánica', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Cuál es la diferencia entre un delta y una desembocadura?', correct_option: 'Un delta es una acumulación de sedimentos en la desembocadura de un río, mientras que una desembocadura es el punto donde un río se encuentra con otro cuerpo de agua, como un lago o el océano', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es una meseta?', correct_option: 'Una región plana y elevada con acantilados escarpados en al menos un lado, a menudo rodeada por tierras más bajas', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es un fenómeno meteorológico llamado tornado?', correct_option: 'Es una columna de aire en rotación que se extiende desde una nube de tormenta hasta el suelo, a menudo asociado con vientos destructivos y daños severos', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },     
  { question: '¿Qué es la población de un área geográfica?', correct_option: 'El número total de personas que viven en esa área', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la cultura en geografía humana?', correct_option: 'Las tradiciones y creencias compartidas por un grupo de personas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la urbanización?', correct_option: 'El proceso de crecimiento y expansión de áreas urbanas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la globalización?', correct_option: 'La integración de las economías, las culturas y las sociedades a nivel mundial', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué estudia la demografía?', correct_option: 'El estudio de las características poblacionales, como el tamaño y la distribución de la población', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la industrialización?', correct_option: 'El proceso de transformar una sociedad basada en la agricultura en una sociedad basada en la industria', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la pobreza?', correct_option: 'La falta de acceso a recursos básicos como alimentos, vivienda y educación', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la diversidad cultural?', correct_option: 'La variedad de grupos étnicos, religiosos y culturales que coexisten en una sociedad', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la gentrificación?', correct_option: 'El proceso de renovación urbana que a menudo resulta en el desplazamiento de residentes de bajos ingresos', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la migración?', correct_option: 'El movimiento de personas de un lugar a otro con el propósito de establecerse temporal o permanentemente en un nuevo lugar', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la geopolítica?', correct_option: 'El estudio de la influencia de factores geográficos en la política y las relaciones internacionales', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué son las ciudades globales?', correct_option: 'Ciudades que desempeñan un papel importante en la economía global y están interconectadas a nivel mundial', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es el desarrollo sostenible?', correct_option: 'El desarrollo que satisface las necesidades actuales sin comprometer la capacidad de las generaciones futuras para satisfacer sus propias necesidades', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué son los derechos humanos?', correct_option: 'Los derechos fundamentales inherentes a todos los seres humanos, sin importar su nacionalidad, lugar de residencia, sexo, origen nacional o étnico, color, religión, lengua o cualquier otra condición', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es la migración forzada?', correct_option: 'El movimiento de personas que se ven obligadas a abandonar sus hogares debido a conflictos armados, persecución, desastres naturales u otras circunstancias que ponen en peligro su vida o seguridad', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es la política de inmigración?', correct_option: 'Las políticas y leyes que regulan la entrada, permanencia y salida de personas de un país', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es la distribución de la riqueza?', correct_option: 'La forma en que los recursos económicos están repartidos entre los individuos o grupos dentro de una población o una región geográfica', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es el desarrollo sostenible?', correct_option: 'Un enfoque para satisfacer las necesidades del presente sin comprometer la capacidad de las generaciones futuras para satisfacer sus propias necesidades.', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es la justicia social?', correct_option: 'La idea de que todas las personas deben tener acceso igualitario a los derechos, oportunidades y recursos dentro de una sociedad', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué son los movimientos sociales?', correct_option: 'Grupos organizados de individuos que trabajan juntos para lograr un cambio social o político en una sociedad', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es el cambio climático?', correct_option: 'El cambio a largo plazo en los patrones climáticos de la Tierra, generalmente causado por actividades humanas como la quema de combustibles fósiles y la deforestación', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué son los recursos naturales?', correct_option: 'Los materiales y sustancias que se encuentran en la naturaleza y que son valiosos para los seres humanos, como el aire, el agua, los minerales y los bosques', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la gestión de recursos naturales?', correct_option: 'El proceso de administrar y conservar los recursos naturales para garantizar su uso sostenible y equitativo', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la agricultura de subsistencia?', correct_option: 'Un tipo de agricultura en el que las personas cultivan alimentos principalmente para alimentar a sus propias familias, con poco o ningún excedente para la venta', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la agricultura comercial?', correct_option: 'Un tipo de agricultura en el que los productos agrícolas se cultivan principalmente para la venta en el mercado, en lugar de para el consumo personal', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la desertificación?', correct_option: 'El proceso por el cual las tierras fértiles se vuelven desérticas debido a la sobreexplotación, la deforestación y otros factores ambientales', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la deforestación?', correct_option: 'La eliminación de árboles y bosques para dar paso a otros usos de la tierra, como la agricultura, la ganadería y la urbanización', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la contaminación del agua?', correct_option: 'La introducción de sustancias nocivas en cuerpos de agua como ríos, lagos y océanos, generalmente causada por actividades humanas como la industria y la agricultura', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué son los derechos de agua?', correct_option: 'Los derechos legales o de propiedad sobre el uso de agua, que pueden ser otorgados o regulados por los gobiernos para garantizar su uso equitativo y sostenible', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la seguridad alimentaria?', correct_option: 'La situación en la que todas las personas tienen acceso físico, social y económico a suficientes alimentos nutritivos para satisfacer sus necesidades dietéticas y preferencias alimentarias para una vida activa y saludable', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la tierra cultivable?', correct_option: 'Tierra apta y disponible para la agricultura, que puede ser utilizada para cultivar cultivos y criar ganado', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la urbanización descontrolada?', correct_option: 'El crecimiento no planificado y no regulado de áreas urbanas, que puede llevar a problemas como la falta de vivienda, la congestión del tráfico y la contaminación ambiental', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la gestión de desastres naturales?', correct_option: 'El proceso de planificación, organización y coordinación de recursos para prepararse y responder a desastres naturales como terremotos, huracanes e inundaciones', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la economía informal?', correct_option: 'El sector de la economía que está compuesto por actividades económicas no reguladas o no declaradas, como el trabajo informal y la venta ambulante', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la migración interna?', correct_option: 'El movimiento de personas dentro de un país, generalmente desde áreas rurales a áreas urbanas en busca de empleo y oportunidades económicas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es el desarrollo económico?', correct_option: 'El proceso de mejora de las condiciones económicas de un país o región, que puede medirse mediante indicadores como el crecimiento del PIB, la reducción de la pobreza y el aumento del empleo', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la brecha de desarrollo?', correct_option: 'La diferencia en el desarrollo económico, social y humano entre países o regiones, que puede manifestarse en desigualdades en ingresos, acceso a servicios básicos y calidad de vida', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué son las remesas?', correct_option: 'El dinero que los trabajadores migrantes envían a sus familias en sus países de origen, generalmente para ayudar con los gastos de subsistencia y el desarrollo económico', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la planificación urbana?', correct_option: 'El proceso de diseño y regulación del uso del suelo, la infraestructura y el desarrollo de las áreas urbanas para promover un crecimiento urbano sostenible y equitativo', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la gentrificación inversa?', correct_option: 'El proceso por el cual áreas urbanas previamente gentrificadas experimentan una reversión demográfica y socioeconómica, atrayendo de nuevo a residentes de bajos ingresos y minorías étnicas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la gobernanza urbana?', correct_option: 'El sistema de toma de decisiones y administración de recursos en áreas urbanas, que involucra a gobiernos locales, organizaciones comunitarias y sectores privados para abordar los desafíos urbanos', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la desigualdad de género?', correct_option: 'La disparidad en el acceso, el control y los beneficios de los recursos y oportunidades entre hombres y mujeres, que puede manifestarse en áreas como la educación, el empleo y la representación política', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la geografía electoral?', correct_option: 'El estudio de la distribución espacial de los votantes y los resultados electorales, así como los factores geográficos que influyen en el comportamiento político y la participación electoral', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la gentrificación cultural?', correct_option: 'El proceso por el cual áreas urbanas experimentan un cambio en su composición étnica y cultural, a menudo resultando en la pérdida de identidad cultural y la expulsión de residentes de bajos ingresos y minorías étnicas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la gestión de residuos?', correct_option: 'El proceso de recolección, tratamiento y disposición final de los desechos sólidos y líquidos, con el objetivo de minimizar el impacto ambiental y promover el reciclaje y la reutilización', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la migración forzada?', correct_option: 'El desplazamiento de personas de sus hogares debido a conflictos armados, persecución, desastres naturales u otras condiciones que ponen en peligro su seguridad y bienestar', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la gestión del crecimiento urbano?', correct_option: 'El proceso de planificación y regulación del desarrollo físico y socioeconómico de las áreas urbanas, con el fin de garantizar un crecimiento equitativo y sostenible', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la densidad de población?', correct_option: 'La medida de cuántas personas viven en un área determinada, generalmente expresada como el número de personas por kilómetro cuadrado o milla cuadrada', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué son los asentamientos informales?', correct_option: 'Áreas urbanas que carecen de servicios básicos y están construidas en terrenos ocupados ilegalmente o no planificados, a menudo habitadas por personas de bajos ingresos y migrantes', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Dónde se encuentra principalmente el continente de África?', correct_option: 'Mayormente en el hemisferio sur, extendiéndose desde el océano Atlántico en el oeste hasta el océano Índico en el este.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Cuál es la ubicación del continente de América?', correct_option: 'Se extiende desde el océano Ártico en el norte hasta el océano Antártico en el sur, y desde el océano Atlántico en el este hasta el océano Pacífico en el oeste.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Dónde se encuentra el continente de Asia?', correct_option: 'Es el continente más grande y se encuentra en el hemisferio este, limitando al oeste con Europa y África, al sur con el océano Índico, al este con el océano Pacífico y al norte con el océano Ártico.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Qué caracteriza la ubicación del continente de Europa?', correct_option: 'Principalmente en el hemisferio norte, limitada al norte por el océano Ártico, al oeste por el océano Atlántico, al sur por el mar Mediterráneo y al este por Asia.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Dónde se ubica el continente de Oceanía?', correct_option: 'En el hemisferio sur, comprendiendo miles de islas dispersas por el océano Pacífico, incluyendo Australia y Nueva Zelanda.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Cuál es la ubicación de la Antártida?', correct_option: 'Se encuentra en el polo sur de la Tierra y está rodeada por el océano Austral.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Cuál es la posición geográfica del continente de Australia?', correct_option: 'Se encuentra en el hemisferio sur, entre los océanos Índico y Pacífico, al sureste de Asia.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Dónde se localiza principalmente el continente de América del Norte?', correct_option: 'Se encuentra en el hemisferio norte, limitando al norte con el océano Ártico, al este con el océano Atlántico, al oeste con el océano Pacífico y al sur con América Central.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Cuál es la posición relativa del continente de Sudamérica?', correct_option: 'Se ubica en el hemisferio sur, limitando al oeste con el océano Pacífico, al este con el océano Atlántico, al norte con América Central y al sur con la Antártida.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Qué caracteriza la ubicación del continente de América Central?', correct_option: 'Se sitúa entre América del Norte y América del Sur, conectando los dos continentes y limitando al norte con el golfo de México y al sur con Colombia.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Dónde se encuentran principalmente las islas del continente de América Central?', correct_option: 'Principalmente en el mar Caribe y el océano Pacífico, formando un arco entre América del Norte y América del Sur.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Cuál es la ubicación geográfica del continente de África del Norte?', correct_option: 'Se encuentra en el extremo norte del continente africano, limitando con el mar Mediterráneo al norte y con el Sáhara al sur.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Dónde se sitúa principalmente el continente de África del Sur?', correct_option: 'Se encuentra en el extremo sur del continente africano, comprendiendo países como Sudáfrica, Namibia y Botsuana.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Cuál es la posición relativa del continente de Asia Central?', correct_option: 'Se sitúa en la parte central de Asia, rodeada por Rusia al norte, China al este, Irán al sur y Asia del Sur al oeste.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Dónde se localiza principalmente el continente de Asia del Sur?', correct_option: 'Se encuentra en el sur del continente asiático, limitando con el océano Índico al sur y con Asia Central y Asia del Este al norte.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Cuál es la ubicación geográfica del continente de Asia del Este?', correct_option: 'Se sitúa en el este de Asia, limitando con el océano Pacífico al este y con Asia Central y Asia del Sur al oeste.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Dónde se encuentran principalmente las islas del continente de Asia del Este?', correct_option: 'Principalmente en el mar de China Oriental y el mar de Japón, incluyendo islas como Japón, Taiwán y las islas Kuriles.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Cuál es la posición relativa del continente de Europa del Norte?', correct_option: 'Se encuentra en el norte de Europa, limitando con el océano Atlántico al oeste, el mar Báltico al este y Europa Central al sur.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Cuál es la ubicación geográfica del Mar Mediterráneo?', correct_option: 'Se encuentra entre Europa, África y Asia, conectando con el océano Atlántico a través del estrecho de Gibraltar.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se sitúa principalmente el Mar de China Meridional?', correct_option: 'Se encuentra al sur de China, entre China continental, Taiwán, Vietnam, Malasia, Filipinas e Indonesia.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Cuál es la ubicación geográfica del Mar Mediterráneo?', correct_option: 'Se encuentra entre Europa, África y Asia, conectando con el océano Atlántico a través del estrecho de Gibraltar.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se sitúa principalmente el Mar de China Meridional?', correct_option: 'Se encuentra al sur de China, entre China continental, Taiwán, Vietnam, Malasia, Filipinas e Indonesia.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Cuál es la ubicación del Mar Caribe?', correct_option: 'Está ubicado en el marco del océano Atlántico, al sureste del golfo de México y al norte de América del Sur.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se localiza principalmente el Mar de Bering?', correct_option: 'Se sitúa entre Alaska y el extremo oriental de Rusia, conectando el océano Pacífico y el océano Ártico.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Cuál es la posición relativa del Mar de Tasmania?', correct_option: 'Se encuentra al sur de Australia, entre la isla de Tasmania y el continente australiano.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se ubica principalmente el Mar del Norte?', correct_option: 'Se sitúa entre Gran Bretaña y Escandinavia, conectando el océano Atlántico con otros mares del norte de Europa.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Cuál es la ubicación geográfica del Mar de Coral?', correct_option: 'Se encuentra al este de Australia, entre la Gran Barrera de Coral y la costa noreste de Queensland.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se encuentra principalmente el Mar de Java?', correct_option: 'Se sitúa entre las islas de Java y Sumatra, en Indonesia, conectando el océano Índico con el mar de China Meridional.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Cuál es la posición relativa del Mar de Arabia?', correct_option: 'Se encuentra en el noroeste del océano Índico, entre la península arábiga y el subcontinente indio.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Dónde se localiza principalmente el Mar de Filipinas?', correct_option: 'Se sitúa entre Filipinas y Taiwán, al este del mar de China Meridional.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Cuál es la ubicación geográfica del Mar de Andamán?', correct_option: 'Se encuentra en el extremo oriental del océano Índico, entre la costa occidental de Tailandia, la península de Malasia y la isla de Andamán.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Dónde se sitúa principalmente el Mar de Ross?', correct_option: 'Se ubica en la Antártida, al sur del océano Pacífico y al este del mar de Weddell.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Cuál es la posición relativa del Mar de Weddell?', correct_option: 'Se encuentra en la Antártida, entre la península Antártica y el continente.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Dónde se localiza principalmente el Mar de Amundsen?', correct_option: 'Se sitúa en la Antártida occidental, al sur del océano Pacífico y al oeste del mar de Ross.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Cuál es la ubicación geográfica del Mar de Scotia?', correct_option: 'Se encuentra en el océano Atlántico sur, entre América del Sur y la península Antártica.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Dónde se encuentra principalmente el Mar de Irlanda?', correct_option: 'Se sitúa entre Irlanda y Gran Bretaña, conectando el océano Atlántico con el mar Céltico.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Cuál es la posición relativa del Mar de Labrador?', correct_option: 'Se encuentra en la costa este de Canadá, entre la isla de Terranova y la región continental de Labrador.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Cuál es la ubicación del Mar Caribe?', correct_option: 'Está ubicado en el marco del océano Atlántico, al sureste del golfo de México y al norte de América del Sur.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Dónde se localiza principalmente el Mar de Bering?', correct_option: 'Se sitúa entre Alaska y el extremo oriental de Rusia, conectando el océano Pacífico y el océano Ártico.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la posición relativa del Mar de Tasmania?', correct_option: 'Se encuentra al sur de Australia, entre la isla de Tasmania y el continente australiano.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Dónde se ubica principalmente el Mar del Norte?', correct_option: 'Se sitúa entre Gran Bretaña y Escandinavia, conectando el océano Atlántico con otros mares del norte de Europa.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la ubicación geográfica del Mar de Coral?', correct_option: 'Se encuentra al este de Australia, entre la Gran Barrera de Coral y la costa noreste de Queensland.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Dónde se encuentra principalmente el Mar de Java?', correct_option: 'Se sitúa entre las islas de Java y Sumatra, en Indonesia, conectando el océano Índico con el mar de China Meridional.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la posición relativa del Mar de Arabia?', correct_option: 'Se encuentra en el noroeste del océano Índico, entre la península arábiga y el subcontinente indio.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Dónde se localiza principalmente el Mar de Filipinas?', correct_option: 'Se sitúa entre Filipinas y Taiwán, al este del mar de China Meridional.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la ubicación geográfica del Mar de Andamán?', correct_option: 'Se encuentra en el extremo oriental del océano Índico, entre la costa occidental de Tailandia, la península de Malasia y la isla de Andamán.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Dónde se sitúa principalmente el Mar de Ross?', correct_option: 'Se ubica en la Antártida, al sur del océano Pacífico y al este del mar de Weddell.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la ubicación geográfica del Océano Pacífico?', correct_option: 'Es el océano más grande, extendiéndose desde el Ártico en el norte hasta el Antártico en el sur, y desde Asia y Australia en el este hasta América en el oeste.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Dónde se encuentra el Océano Atlántico?', correct_option: 'Entre las Américas al oeste y Europa y África al este.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
    { question: '¿Cuál es la capital de Estados Unidos?', correct_option: 'Washington D.C.', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de China?', correct_option: 'Pekín', topic: 'Capitales', exam_name: 'Exam Capitales 2' },
  { question: '¿Cuál es la capital de India?', correct_option: 'Nueva Delhi', topic: 'Capitales', exam_name: 'Exam Capitales 3' },
  { question: '¿Cuál es la capital de Rusia?', correct_option: 'Moscú', topic: 'Capitales', exam_name: 'Exam Capitales 4' },
  { question: '¿Cuál es la capital de Brasil?', correct_option: 'Brasilia', topic: 'Capitales', exam_name: 'Exam Capitales 5' },
  { question: '¿Cuál es la capital de Japón?', correct_option: 'Tokio', topic: 'Capitales', exam_name: 'Exam Capitales 6' },
  { question: '¿Cuál es la capital de Alemania?', correct_option: 'Berlín', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de Reino Unido?', correct_option: 'Londres', topic: 'Capitales', exam_name: 'Exam Capitales 2' },
  { question: '¿Cuál es la capital de Francia?', correct_option: 'París', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de México?', correct_option: 'Ciudad de México', topic: 'Capitales', exam_name: 'Exam Capitales 3' },
  { question: '¿Cuál es la capital de Italia?', correct_option: 'Roma', topic: 'Capitales', exam_name: 'Exam Capitales 4' },
  { question: '¿Cuál es la capital de Canadá?', correct_option: 'Ottawa', topic: 'Capitales', exam_name: 'Exam Capitales 5' },
  { question: '¿Cuál es la capital de Corea del Sur?', correct_option: 'Seúl', topic: 'Capitales', exam_name: 'Exam Capitales 6' },
  { question: '¿Cuál es la capital de España?', correct_option: 'Madrid', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de Australia?', correct_option: 'Camberra', topic: 'Capitales', exam_name: 'Exam Capitales 2' },
  { question: '¿Cuál es la capital de Indonesia?', correct_option: 'Yakarta', topic: 'Capitales', exam_name: 'Exam Capitales 3' },
  { question: '¿Cuál es la capital de Países Bajos?', correct_option: 'Ámsterdam', topic: 'Capitales', exam_name: 'Exam Capitales 4' },
  { question: '¿Cuál es la capital de Arabia Saudita?', correct_option: 'Riad', topic: 'Capitales', exam_name: 'Exam Capitales 5' },
  { question: '¿Cuál es la capital de Turquía?', correct_option: 'Ankara', topic: 'Capitales', exam_name: 'Exam Capitales 6' },
  { question: '¿Cuál es la capital de Argentina?', correct_option: 'Buenos Aires', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de Sudáfrica?', correct_option: 'Pretoria', topic: 'Capitales', exam_name: 'Exam Capitales 2' },
  { question: '¿Cuál es la capital de Nigeria?', correct_option: 'Abuja', topic: 'Capitales', exam_name: 'Exam Capitales 3' },
  { question: '¿Cuál es la capital de Egipto?', correct_option: 'El Cairo', topic: 'Capitales', exam_name: 'Exam Capitales 4' },
  { question: '¿Cuál es la capital de Pakistán?', correct_option: 'Islamabad', topic: 'Capitales', exam_name: 'Exam Capitales 5' },
  { question: '¿Cuál es la capital de Irán?', correct_option: 'Teherán', topic: 'Capitales', exam_name: 'Exam Capitales 6' },
  { question: '¿Cuál es la capital de Vietnam?', correct_option: 'Hanói', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de Tailandia?', correct_option: 'Bangkok', topic: 'Capitales', exam_name: 'Exam Capitales 2' },
    { question: '¿Cuál es la capital de Polonia?', correct_option: 'Varsovia', topic: 'Capitales', exam_name: 'Exam Capitales 3' },
  { question: '¿Cuál es la capital de Colombia?', correct_option: 'Bogotá', topic: 'Capitales', exam_name: 'Exam Capitales 4' },
  { question: '¿Cuál es la capital de Venezuela?', correct_option: 'Caracas', topic: 'Capitales', exam_name: 'Exam Capitales 5' },
  { question: '¿Cuál es la capital de Malasia?', correct_option: 'Kuala Lumpur', topic: 'Capitales', exam_name: 'Exam Capitales 6' },
  { question: '¿Cuál es la capital de Filipinas?', correct_option: 'Manila', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de Bangladesh?', correct_option: 'Daca', topic: 'Capitales', exam_name: 'Exam Capitales 2' },
  { question: '¿Cuál es la capital de Ucrania?', correct_option: 'Kiev', topic: 'Capitales', exam_name: 'Exam Capitales 3' },
  { question: '¿Cuál es la capital de Sudán?', correct_option: 'Jartum', topic: 'Capitales', exam_name: 'Exam Capitales 4' },
  { question: '¿Cuál es la capital de Marruecos?', correct_option: 'Rabat', topic: 'Capitales', exam_name: 'Exam Capitales 5' },
  { question: '¿Cuál es la capital de Kenia?', correct_option: 'Nairobi', topic: 'Capitales', exam_name: 'Exam Capitales 6' },
  { question: '¿Cuál es la capital de Perú?', correct_option: 'Lima', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de Chile?', correct_option: 'Santiago', topic: 'Capitales', exam_name: 'Exam Capitales 2' },
  { question: '¿Cuál es la capital de Suecia?', correct_option: 'Estocolmo', topic: 'Capitales', exam_name: 'Exam Capitales 3' },
  { question: '¿Cuál es la capital de Suiza?', correct_option: 'Berna', topic: 'Capitales', exam_name: 'Exam Capitales 4' },
  { question: '¿Cuál es la capital de Bélgica?', correct_option: 'Bruselas', topic: 'Capitales', exam_name: 'Exam Capitales 5' },
  { question: '¿Cuál es la capital de Austria?', correct_option: 'Viena', topic: 'Capitales', exam_name: 'Exam Capitales 6' },
  { question: '¿Cuál es la capital de Noruega?', correct_option: 'Oslo', topic: 'Capitales', exam_name: 'Exam Capitales 1' },
  { question: '¿Cuál es la capital de Israel?', correct_option: 'Jerusalén', topic: 'Capitales', exam_name: 'Exam Capitales 2' },
  { question: '¿Cuál es la capital de Ghana?', correct_option: 'Acra', topic: 'Capitales', exam_name: 'Exam Capitales 3' },
  { question: '¿Cuál es la capital de Irlanda?', correct_option: 'Dublín', topic: 'Capitales', exam_name: 'Exam Capitales 4' },
  { question: '¿Cuál es la capital de Finlandia?', correct_option: 'Helsinki', topic: 'Capitales', exam_name: 'Exam Capitales 5' },
  { question: '¿Cuál es la capital de Portugal?', correct_option: 'Lisboa', topic: 'Capitales', exam_name: 'Exam Capitales 6' },
  { question: '¿Qué es un país?', correct_option: 'Una entidad política soberana con un territorio definido y un gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es una frontera?', correct_option: 'Una línea imaginaria que separa dos países', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es la diplomacia?', correct_option: 'El proceso de manejar las relaciones internacionales entre países mediante la negociación y el diálogo', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es una monarquía?', correct_option: 'Un sistema de gobierno en el que un monarca es la cabeza de estado', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Cuál es la función de un tratado?', correct_option: 'Regular las relaciones entre países', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es la independencia?', correct_option: 'El estado de libertad y autonomía política de un país o territorio', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es una alianza?', correct_option: 'Una asociación entre dos o más países con el objetivo de cooperar en áreas específicas de interés común', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es la colonización?', correct_option: 'El proceso de establecer y controlar territorios por parte de una potencia extranjera', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es una organización internacional?', correct_option: 'Una entidad formada por países soberanos que trabajan juntos para abordar problemas globales y promover la cooperación internacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es el nacionalismo?', correct_option: 'La ideología que promueve la identidad y los intereses de una nación, a menudo asociada con la aspiración de autodeterminación y soberanía', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es un gobierno democrático?', correct_option: 'Un sistema de gobierno en el que el poder político es ejercido por el pueblo a través de elecciones libres y justas', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es la descolonización?', correct_option: 'El proceso de liberación de los territorios coloniales y la adquisición de la independencia política', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es un embargo?', correct_option: 'Una prohibición oficial impuesta por un país para detener el comercio con otro país como medida de presión política o económica', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es el derecho internacional?', correct_option: 'El conjunto de normas y principios que regulan las relaciones entre países y otras entidades internacionales', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es la soberanía?', correct_option: 'El principio de autoridad política y territorial de un estado independiente', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es un gobierno totalitario?', correct_option: 'Un sistema político en el que el gobierno tiene control absoluto sobre todos los aspectos de la vida pública y privada de los ciudadanos', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es un refugiado?', correct_option: 'Una persona que ha sido obligada a abandonar su país de origen debido a conflictos, persecución o violaciones de los derechos humanos', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es la autodeterminación?', correct_option: 'El derecho de los pueblos a decidir su propio estatus político y a determinar libremente su propia forma de gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es la diplomacia pública?', correct_option: 'Los esfuerzos de un gobierno para comunicarse y promover sus políticas y valores en el extranjero, dirigidos a la opinión pública internacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es un golpe de Estado?', correct_option: 'La toma violenta o ilegal del poder político por parte de un grupo dentro del gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es la asamblea general de las Naciones Unidas?', correct_option: 'El principal órgano deliberativo y representativo de las Naciones Unidas, compuesto por todos los estados miembros', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es el sistema de partido único?', correct_option: 'Un sistema político en el que solo un partido político está legalmente autorizado para gobernar y monopoliza el poder político', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la geopolítica?', correct_option: 'El estudio de la influencia de factores geográficos en la política internacional y las relaciones internacionales', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es el tratado de libre comercio?', correct_option: 'Un acuerdo entre dos o más países para eliminar barreras comerciales y promover el intercambio de bienes y servicios sin aranceles ni cuotas', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la democracia representativa?', correct_option: 'Un sistema político en el que los ciudadanos eligen representantes para que tomen decisiones en su nombre en el gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la cumbre internacional?', correct_option: 'Una reunión de líderes y representantes de varios países para discutir y tomar decisiones sobre temas de interés común', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la asamblea constituyente?', correct_option: 'Un cuerpo legislativo especial encargado de redactar o revisar una constitución para un país o territorio', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es el gobierno de coalición?', correct_option: 'Un gobierno formado por dos o más partidos políticos que trabajan juntos para formar una mayoría en el parlamento y gobernar el país', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la neutralidad?', correct_option: 'La política de un país de no tomar partido en conflictos internacionales y mantenerse imparcial', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es el federalismo?', correct_option: 'Un sistema de gobierno en el que el poder está dividido entre un gobierno central y unidades políticas más pequeñas, como estados o provincias', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es el imperialismo?', correct_option: 'La política de extender el control o la influencia de una nación sobre territorios extranjeros mediante la colonización, la conquista o la dominación económica', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es el bloque regional?', correct_option: 'Una asociación de países en una región geográfica que se unen para promover la cooperación económica y política', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la insurgencia?', correct_option: 'La rebelión armada de un grupo contra un gobierno establecido, a menudo por motivos políticos o sociales', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es un estado fallido?', correct_option: 'Un país que ha perdido el control efectivo sobre su territorio y no puede mantener el orden interno ni brindar servicios básicos a su población', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la anexión territorial?', correct_option: 'El acto de agregar un territorio a otro país mediante la conquista, el tratado o la ocupación militar', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es el sufragio universal?', correct_option: 'El derecho de todos los ciudadanos adultos a votar en elecciones políticas', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la constitución?', correct_option: 'Un conjunto de principios y leyes fundamentales que establecen la estructura del gobierno y los derechos de los ciudadanos en un país', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la geopolítica energética?', correct_option: 'El estudio de las relaciones entre el poder político y los recursos energéticos, como el petróleo y el gas natural, a nivel nacional e internacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la guerra fría?', correct_option: 'El período de tensión política y confrontación ideológica entre los Estados Unidos y la Unión Soviética después de la Segunda Guerra Mundial, sin un conflicto militar directo', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es un bloqueo económico?', correct_option: 'Una medida coercitiva en la que un país restringe o prohíbe el comercio con otro país como forma de presión política o económica', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la soberanía nacional?', correct_option: 'El principio de autoridad política y autonomía de un estado en su territorio, sin interferencia externa', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es la legislatura?', correct_option: 'El cuerpo legislativo encargado de hacer leyes en un país o estado', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es la economía de mercado?', correct_option: 'Un sistema económico en el que los precios de los bienes y servicios son determinados por la oferta y la demanda en el mercado, con una mínima interferencia del gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es el apartheid?', correct_option: 'El sistema de segregación racial y discriminación institucionalizada que existió en Sudáfrica entre 1948 y 1994', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es la globalización?', correct_option: 'El proceso de interconexión e interdependencia creciente entre las economías, las sociedades y las culturas a nivel mundial', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es el nacionalismo étnico?', correct_option: 'La identificación y lealtad hacia un grupo étnico particular como base de la identidad nacional y política', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es la diplomacia multilateral?', correct_option: 'El proceso de negociación y cooperación entre tres o más países para abordar problemas y desafíos comunes', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es un referéndum?', correct_option: 'Una votación en la que los ciudadanos expresan su opinión sobre una cuestión específica, generalmente de importancia nacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },  
  { question: '¿Qué es un tratado internacional?', correct_option: 'Un acuerdo formal entre dos o más países que establece derechos y obligaciones mutuos bajo el derecho internacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
    #So Easy Mode
  #{ correct_option: 'Argentina', topic: 'Banderas-1', imagepath: 'images/Banderas/ar.svg' },
  #{ correct_option: 'Bolivia', topic: 'Banderas-1', imagepath: 'images/Banderas/bo.svg' },
  #{ correct_option: 'Brasil', topic: 'Banderas-1', imagepath: 'images/Banderas/br.svg' },
  #{ correct_option: 'Canadá', topic: 'Banderas-1', imagepath: 'images/Banderas/ca.svg' },
  #{ correct_option: 'Chile', topic: 'Banderas-1', imagepath: 'images/Banderas/cl.svg' },
  #{ correct_option: 'China', topic: 'Banderas-1', imagepath: 'images/Banderas/cn.svg' },
  #{ correct_option: 'Colombia', topic: 'Banderas-1', imagepath: 'images/Banderas/co.svg' },
  #{ correct_option: 'Costa Rica', topic: 'Banderas-1', imagepath: 'images/Banderas/cr.svg' },
  #{ correct_option: 'Croacia', topic: 'Banderas-1', imagepath: 'images/Banderas/hr.svg' },
  #{ correct_option: 'Cuba', topic: 'Banderas-1', imagepath: 'images/Banderas/cu.svg' },
  #{ correct_option: 'Ecuador', topic: 'Banderas-1', imagepath: 'images/Banderas/ec.svg' },
  #{ correct_option: 'Francia', topic: 'Banderas-1', imagepath: 'images/Banderas/fr.svg' },
  #{ correct_option: 'Alemania', topic: 'Banderas-1', imagepath: 'images/Banderas/de.svg' },
  #{ correct_option: 'Italia', topic: 'Banderas-1', imagepath: 'images/Banderas/it.svg' },
  #{ correct_option: 'Japón', topic: 'Banderas-1', imagepath: 'images/Banderas/jp.svg' },
  #{ correct_option: 'México', topic: 'Banderas-1', imagepath: 'images/Banderas/mx.svg' },
  #{ correct_option: 'Portugal', topic: 'Banderas-1', imagepath: 'images/Banderas/pt.svg' },
  #{ correct_option: 'Perú', topic: 'Banderas-1', imagepath: 'images/Banderas/pe.svg' },
  #{ correct_option: 'España', topic: 'Banderas-1', imagepath: 'images/Banderas/es.svg' },
  #{ correct_option: 'Uruguay', topic: 'Banderas-1', imagepath: 'images/Banderas/uy.svg' },
  #{ correct_option: 'Reino Unido', topic: 'Banderas-1', imagepath: 'images/Banderas/gb.svg' },
  #{ correct_option: 'Estados Unidos de América', topic: 'Banderas-1', imagepath: 'images/Banderas/us.svg' },
  #{ correct_option: 'Venezuela', topic: 'Banderas-1', imagepath: 'images/Banderas/ve.svg' },
  #{ correct_option: 'Paraguay', topic: 'Banderas-1', imagepath: 'images/Banderas/py.svg' },
  #{ correct_option: 'Puerto Rico', topic: 'Banderas-1', imagepath: 'images/Banderas/pr.svg' },
  #{ correct_option: 'Honduras', topic: 'Banderas-1', imagepath: 'images/Banderas/hn.svg' },

  ##Easy mode

  #{ correct_option: 'Argelia', topic: 'Banderas-2', imagepath: 'images/Banderas/dz.svg' },
  #{ correct_option: 'Bélgica', topic: 'Banderas-2', imagepath: 'images/Banderas/be.svg' },
  #{ correct_option: 'Bosnia y Herzegovina', topic: 'Banderas-2', imagepath: 'images/Banderas/ba.svg' },
  #{ correct_option: 'Camerún', topic: 'Banderas-2', imagepath: 'images/Banderas/cm.svg' },
  #{ correct_option: 'Dominica', topic: 'Banderas-2', imagepath: 'images/Banderas/dm.svg' },
  #{ correct_option: 'República Dominicana', topic: 'Banderas-2', imagepath: 'images/Banderas/do.svg' },
  #{ correct_option: 'El Salvador', topic: 'Banderas-2', imagepath: 'images/Banderas/sv.svg' },
  #{ correct_option: 'Finlandia', topic: 'Banderas-2', imagepath: 'images/Banderas/fi.svg' },
  #{ correct_option: 'Ghana', topic: 'Banderas-2', imagepath: 'images/Banderas/gh.svg' },
  #{ correct_option: 'Grecia', topic: 'Banderas-2', imagepath: 'images/Banderas/gr.svg' },
  #{ correct_option: 'Guatemala', topic: 'Banderas-2', imagepath: 'images/Banderas/gt.svg' },
  #{ correct_option: 'India', topic: 'Banderas-2', imagepath: 'images/Banderas/in.svg' },
  #{ correct_option: 'Irán', topic: 'Banderas-2', imagepath: 'images/Banderas/ir.svg' },
  #{ correct_option: 'Israel', topic: 'Banderas-2', imagepath: 'images/Banderas/il.svg' },
  #{ correct_option: 'Jamaica', topic: 'Banderas-2', imagepath: 'images/Banderas/jm.svg' },
  #{ correct_option: 'Países Bajos', topic: 'Banderas-2', imagepath: 'images/Banderas/nl.svg' },
  #{ correct_option: 'Nueva Zelanda', topic: 'Banderas-2', imagepath: 'images/Banderas/nz.svg' },
  #{ correct_option: 'Nicaragua', topic: 'Banderas-2', imagepath: 'images/Banderas/ni.svg' },
  #{ correct_option: 'Nigeria', topic: 'Banderas-2', imagepath: 'images/Banderas/ng.svg' },
  #{ correct_option: 'Polonia', topic: 'Banderas-2', imagepath: 'images/Banderas/pl.svg' },
  #{ correct_option: 'Rusia', topic: 'Banderas-2', imagepath: 'images/Banderas/ru.svg' },
  #{ correct_option: 'Arabia Saudita', topic: 'Banderas-2', imagepath: 'images/Banderas/sa.svg' },
  #{ correct_option: 'Senegal', topic: 'Banderas-2', imagepath: 'images/Banderas/sn.svg' },
  #{ correct_option: 'Serbia', topic: 'Banderas-2', imagepath: 'images/Banderas/rs.svg' },
  #{ correct_option: 'Corea del Sur', topic: 'Banderas-2', imagepath: 'images/Banderas/kr.svg' },
  #{ correct_option: 'Panamá', topic: 'Banderas-2', imagepath: 'images/Banderas/pa.svg' },

  ##Medium Mode

  #{ correct_option: 'Andorra', topic: 'Banderas-3', imagepath: 'images/Banderas/ad.svg' },
  #{ correct_option: 'Australia', topic: 'Banderas-3', imagepath: 'images/Banderas/au.svg' },
  #{ correct_option: 'Bulgaria', topic: 'Banderas-3', imagepath: 'images/Banderas/bg.svg' },
  #{ correct_option: 'Egipto', topic: 'Banderas-3', imagepath: 'images/Banderas/eg.svg' },
  #{ correct_option: 'Estonia', topic: 'Banderas-3', imagepath: 'images/Banderas/ee.svg' },
  #{ correct_option: 'Dinamarca', topic: 'Banderas-3', imagepath: 'images/Banderas/dk.svg' },
  #{ correct_option: 'Georgia', topic: 'Banderas-3', imagepath: 'images/Banderas/ge.svg' },
  #{ correct_option: 'Haití', topic: 'Banderas-3', imagepath: 'images/Banderas/ht.svg' },
  #{ correct_option: 'Hungría', topic: 'Banderas-3', imagepath: 'images/Banderas/hu.svg' },
  #{ correct_option: 'Islandia', topic: 'Banderas-3', imagepath: 'images/Banderas/is.svg' },
  #{ correct_option: 'Indonesia', topic: 'Banderas-3', imagepath: 'images/Banderas/id.svg' },
  #{ correct_option: 'Irak', topic: 'Banderas-3', imagepath: 'images/Banderas/iq.svg' },
  #{ correct_option: 'Irlanda', topic: 'Banderas-3', imagepath: 'images/Banderas/ie.svg' },
  #{ correct_option: 'Kenia', topic: 'Banderas-3', imagepath: 'images/Banderas/ke.svg' },
  #{ correct_option: 'Luxemburgo', topic: 'Banderas-3', imagepath: 'images/Banderas/lu.svg' },
  #{ correct_option: 'Madagascar', topic: 'Banderas-3', imagepath: 'images/Banderas/mg.svg' },
  #{ correct_option: 'Mónaco', topic: 'Banderas-3', imagepath: 'images/Banderas/mc.svg' },
  #{ correct_option: 'Ucrania', topic: 'Banderas-3', imagepath: 'images/Banderas/ua.svg' },
  #{ correct_option: 'Corea del Norte', topic: 'Banderas-3', imagepath: 'images/Banderas/kp.svg' },
  #{ correct_option: 'Pakistán', topic: 'Banderas-3', imagepath: 'images/Banderas/pk.svg' },
  #{ correct_option: 'Hong Kong', topic: 'Banderas-3', imagepath: 'images/Banderas/hk.svg' },
  #{ correct_option: 'Filipinas', topic: 'Banderas-3', imagepath: 'images/Banderas/ph.svg' },
  #{ correct_option: 'Catar', topic: 'Banderas-3', imagepath: 'images/Banderas/qa.svg' },
  #{ correct_option: 'Sudáfrica', topic: 'Banderas-3', imagepath: 'images/Banderas/za.svg' },
  #{ correct_option: 'Suecia', topic: 'Banderas-3', imagepath: 'images/Banderas/se.svg' },
  #{ correct_option: 'Suiza', topic: 'Banderas-3', imagepath: 'images/Banderas/ch.svg' },

  ##Semi-hard mode

  #{ correct_option: 'San Marino', topic: 'Banderas-4', imagepath: 'images/Banderas/sm.svg' },
  #{ correct_option: 'Montenegro', topic: 'Banderas-4', imagepath: 'images/Banderas/me.svg' },
  #{ correct_option: 'Nepal', topic: 'Banderas-4', imagepath: 'images/Banderas/np.svg' },
  #{ correct_option: 'Zambia', topic: 'Banderas-4', imagepath: 'images/Banderas/zm.svg' },
  #{ correct_option: 'Turquía', topic: 'Banderas-4', imagepath: 'images/Banderas/tr.svg' },
  #{ correct_option: 'Yemen', topic: 'Banderas-4', imagepath: 'images/Banderas/ye.svg' },
  #{ correct_option: 'Afganistán', topic: 'Banderas-4', imagepath: 'images/Banderas/af.svg' },
  #{ correct_option: 'Albania', topic: 'Banderas-4', imagepath: 'images/Banderas/al.svg' },
  #{ correct_option: 'Angola', topic: 'Banderas-4', imagepath: 'images/Banderas/ao.svg' },
  #{ correct_option: 'República Checa', topic: 'Banderas-4', imagepath: 'images/Banderas/cz.svg' },
  #{ correct_option: 'Guinea', topic: 'Banderas-4', imagepath: 'images/Banderas/gn.svg' },
  #{ correct_option: 'Malí', topic: 'Banderas-4', imagepath: 'images/Banderas/ml.svg' },
  #{ correct_option: 'Moldavia', topic: 'Banderas-4', imagepath: 'images/Banderas/md.svg' },
  #{ correct_option: 'Mongolia', topic: 'Banderas-4', imagepath: 'images/Banderas/mn.svg' },
  #{ correct_option: 'Marruecos', topic: 'Banderas-4', imagepath: 'images/Banderas/ma.svg' },
  #{ correct_option: 'Namibia', topic: 'Banderas-4', imagepath: 'images/Banderas/na.svg' },
  #{ correct_option: 'Níger', topic: 'Banderas-4', imagepath: 'images/Banderas/ne.svg' },
  #{ correct_option: 'República del Congo', topic: 'Banderas-4', imagepath: 'images/Banderas/cg.svg' },
  #{ correct_option: 'Rumania', topic: 'Banderas-4', imagepath: 'images/Banderas/ro.svg' },
  #{ correct_option: 'Eslovaquia', topic: 'Banderas-4', imagepath: 'images/Banderas/sk.svg' },
  #{ correct_option: 'Eslovenia', topic: 'Banderas-4', imagepath: 'images/Banderas/si.svg' },
  #{ correct_option: 'Taiwán', topic: 'Banderas-4', imagepath: 'images/Banderas/tw.svg' },
  #{ correct_option: 'Tailandia', topic: 'Banderas-4', imagepath: 'images/Banderas/th.svg' },
  #{ correct_option: 'Vietnam', topic: 'Banderas-4', imagepath: 'images/Banderas/vn.svg' },
  #{ correct_option: 'Omán', topic: 'Banderas-4', imagepath: 'images/Banderas/om.svg' },
  #{ correct_option: 'Emiratos Árabes Unidos', topic: 'Banderas-4', imagepath: 'images/Banderas/ae.svg' },

  ##Hard mode

  #{ correct_option: 'Belice', topic: 'Banderas-5', imagepath: 'images/Banderas/bz.svg' },
  #{ correct_option: 'Cabo Verde', topic: 'Banderas-5', imagepath: 'images/Banderas/cv.svg' },
  #{ correct_option: 'Etiopía', topic: 'Banderas-5', imagepath: 'images/Banderas/et.svg' },
  #{ correct_option: 'Fiyi', topic: 'Banderas-5', imagepath: 'images/Banderas/fj.svg' },
  #{ correct_option: 'Gibraltar', topic: 'Banderas-5', imagepath: 'images/Banderas/gi.svg' },
  #{ correct_option: 'Groenlandia', topic: 'Banderas-5', imagepath: 'images/Banderas/gl.svg' },
  #{ correct_option: 'Kazajistán', topic: 'Banderas-5', imagepath: 'images/Banderas/kz.svg' },
  #{ correct_option: 'Kuwait', topic: 'Banderas-5', imagepath: 'images/Banderas/kw.svg' },
  #{ correct_option: 'Liberia', topic: 'Banderas-5', imagepath: 'images/Banderas/lr.svg' },
  #{ correct_option: 'Libia', topic: 'Banderas-5', imagepath: 'images/Banderas/ly.svg' },
  #{ correct_option: 'Macedonia del Norte', topic: 'Banderas-5', imagepath: 'images/Banderas/mk.svg' },
  #{ correct_option: 'Singapur', topic: 'Banderas-5', imagepath: 'images/Banderas/sg.svg' },
  #{ correct_option: 'Somalia', topic: 'Banderas-5', imagepath: 'images/Banderas/so.svg' },
  #{ correct_option: 'Sudán del Sur', topic: 'Banderas-5', imagepath: 'images/Banderas/ss.svg' },
  #{ correct_option: 'Sudán', topic: 'Banderas-5', imagepath: 'images/Banderas/sd.svg' },
  #{ correct_option: 'Siria', topic: 'Banderas-5', imagepath: 'images/Banderas/sy.svg' },
  #{ correct_option: 'Uganda', topic: 'Banderas-5', imagepath: 'images/Banderas/ug.svg' },
  #{ correct_option: 'Bangladesh', topic: 'Banderas-5', imagepath: 'images/Banderas/bd.svg' },
  #{ correct_option: 'Trinidad y Tobago', topic: 'Banderas-5', imagepath: 'images/Banderas/tt.svg' },
  #{ correct_option: 'Túnez', topic: 'Banderas-5', imagepath: 'images/Banderas/tn.svg' },
  #{ correct_option: 'Estado de Palestina', topic: 'Banderas-5', imagepath: 'images/Banderas/ps.svg' },
  #{ correct_option: 'Armenia', topic: 'Banderas-5', imagepath: 'images/Banderas/am.svg' },
  #{ correct_option: 'Austria', topic: 'Banderas-5', imagepath: 'images/Banderas/at.svg' },

  ##Demential 1

  #{ correct_option: 'Islas Malvinas', topic: 'Banderas-6', imagepath: 'images/Banderas/fk.svg' },
  #{ correct_option: 'Kirguistán', topic: 'Banderas-6', imagepath: 'images/Banderas/kg.svg' },
  #{ correct_option: 'Burkina Faso', topic: 'Banderas-6', imagepath: 'images/Banderas/bf.svg' },
  #{ correct_option: 'República Democrática del Congo', topic: 'Banderas-6', imagepath: 'images/Banderas/cd.svg' },
  #{ correct_option: 'Anguila', topic: 'Banderas-6', imagepath: 'images/Banderas/ai.svg' },
  #{ correct_option: 'Polinesia Francesa', topic: 'Banderas-6', imagepath: 'images/Banderas/pf.svg' },
  #{ correct_option: 'Jordania', topic: 'Banderas-6', imagepath: 'images/Banderas/jo.svg' },
  #{ correct_option: 'Territorios Franceses del Sur', topic: 'Banderas-6', imagepath: 'images/Banderas/tf.svg' },
  #{ correct_option: 'San Vicente y las Granadinas', topic: 'Banderas-6', imagepath: 'images/Banderas/vc.svg' },
  #{ correct_option: 'Aruba', topic: 'Banderas-6', imagepath: 'images/Banderas/aw.svg' },
  #{ correct_option: 'Eritrea', topic: 'Banderas-6', imagepath: 'images/Banderas/er.svg' },
  #{ correct_option: 'Turkmenistán', topic: 'Banderas-6', imagepath: 'images/Banderas/tm.svg' },
  #{ correct_option: 'Nauru', topic: 'Banderas-6', imagepath: 'images/Banderas/nr.svg' },
  #{ correct_option: 'Isla Bouvet', topic: 'Banderas-6', imagepath: 'images/Banderas/bv.svg' },
  #{ correct_option: 'Letonia', topic: 'Banderas-6', imagepath: 'images/Banderas/lv.svg' },
  #{ correct_option: 'Baréin', topic: 'Banderas-6', imagepath: 'images/Banderas/bh.svg' },
  #{ correct_option: 'Svalbard y Jan Mayen', topic: 'Banderas-6', imagepath: 'images/Banderas/sj.svg' },
  #{ correct_option: 'Chad', topic: 'Banderas-6', imagepath: 'images/Banderas/td.svg' },
  #{ correct_option: 'Antártida', topic: 'Banderas-6', imagepath: 'images/Banderas/aq.svg' },
  #{ correct_option: 'Islas Vírgenes de los Estados Unidos', topic: 'Banderas-6', imagepath: 'images/Banderas/vi.svg' },
  #{ correct_option: 'Guinea-Bisáu', topic: 'Banderas-6', imagepath: 'images/Banderas/gw.svg' },
  #{ correct_option: 'Pitcairn', topic: 'Banderas-6', imagepath: 'images/Banderas/pn.svg' },
  #{ correct_option: 'Benín', topic: 'Banderas-6', imagepath: 'images/Banderas/bj.svg' },
  #{ correct_option: 'Santa Sede', topic: 'Banderas-6', imagepath: 'images/Banderas/va.svg' },
  #{ correct_option: 'Guam', topic: 'Banderas-6', imagepath: 'images/Banderas/gu.svg' },

  ##Demential 2

  #{ correct_option: 'Mauritania', topic: 'Banderas-7', imagepath: 'images/Banderas/mr.svg' },
  #{ correct_option: 'Territorio Británico del Océano Índico', topic: 'Banderas-7', imagepath: 'images/Banderas/io.svg' },
  #{ correct_option: 'Liechtenstein', topic: 'Banderas-7', imagepath: 'images/Banderas/li.svg' },
  #{ correct_option: 'Bermudas', topic: 'Banderas-7', imagepath: 'images/Banderas/bm.svg' },
  #{ correct_option: 'Estados Federados de Micronesia', topic: 'Banderas-7', imagepath: 'images/Banderas/fm.svg' },
  #{ correct_option: 'Surinam', topic: 'Banderas-7', imagepath: 'images/Banderas/sr.svg' },
  #{ correct_option: 'Brunéi', topic: 'Banderas-7', imagepath: 'images/Banderas/bn.svg' },
  #{ correct_option: 'Reunión', topic: 'Banderas-7', imagepath: 'images/Banderas/re.svg' },
  #{ correct_option: 'Samoa', topic: 'Banderas-7', imagepath: 'images/Banderas/ws.svg' },
  #{ correct_option: 'Islas Heard y McDonald', topic: 'Banderas-7', imagepath: 'images/Banderas/hm.svg' },
  #{ correct_option: 'Camboya', topic: 'Banderas-7', imagepath: 'images/Banderas/kh.svg' },
  #{ correct_option: 'Isla Norfolk', topic: 'Banderas-7', imagepath: 'images/Banderas/nf.svg' },
  #{ correct_option: 'San Cristóbal y Nieves', topic: 'Banderas-7', imagepath: 'images/Banderas/kn.svg' },
  #{ correct_option: 'Montserrat', topic: 'Banderas-7', imagepath: 'images/Banderas/ms.svg' },
  #{ correct_option: 'Malasia', topic: 'Banderas-7', imagepath: 'images/Banderas/my.svg' },
  #{ correct_option: 'Malta', topic: 'Banderas-7', imagepath: 'images/Banderas/mt.svg' },
  #{ correct_option: 'San Pedro y Miquelón', topic: 'Banderas-7', imagepath: 'images/Banderas/pm.svg' },
  #{ correct_option: 'Niue', topic: 'Banderas-7', imagepath: 'images/Banderas/nu.svg' },
  #{ correct_option: 'Isla de Man', topic: 'Banderas-7', imagepath: 'images/Banderas/im.svg' },
  #{ correct_option: 'eSwatini', topic: 'Banderas-7', imagepath: 'images/Banderas/sz.svg' },
  #{ correct_option: 'Suecia', topic: 'Banderas-7', imagepath: 'images/Banderas/se.svg' },
  #{ correct_option: 'Maldivas', topic: 'Banderas-7', imagepath: 'images/Banderas/mv.svg' },
  #{ correct_option: 'Tayikistán', topic: 'Banderas-7', imagepath: 'images/Banderas/tj.svg' },
  #{ correct_option: 'Guernsey', topic: 'Banderas-7', imagepath: 'images/Banderas/gg.svg' },

  ##Demential 3

  #{ correct_option: 'Islas Turcas y Caicos', topic: 'Banderas-8', imagepath: 'images/Banderas/tc.svg' },
  #{ correct_option: 'Islas Menores Alejadas de los Estados Unidos', topic: 'Banderas-8', imagepath: 'images/Banderas/um.svg' },
  #{ correct_option: 'Yibuti', topic: 'Banderas-8', imagepath: 'images/Banderas/dj.svg' },
  #{ correct_option: 'San Bartolomé', topic: 'Banderas-8', imagepath: 'images/Banderas/bl.svg' },
  #{ correct_option: 'Martinica', topic: 'Banderas-8', imagepath: 'images/Banderas/mq.svg' },
  #{ correct_option: 'Islas Vírgenes Británicas', topic: 'Banderas-8', imagepath: 'images/Banderas/vg.svg' },
  #{ correct_option: 'Mozambique', topic: 'Banderas-8', imagepath: 'images/Banderas/mz.svg' },
  #{ correct_option: 'Sahara Occidental', topic: 'Banderas-8', imagepath: 'images/Banderas/eh.svg' },
  #{ correct_option: 'Antigua y Barbuda', topic: 'Banderas-8', imagepath: 'images/Banderas/ag.svg' },
  #{ correct_option: 'Sri Lanka', topic: 'Banderas-8', imagepath: 'images/Banderas/lk.svg' },
  #{ correct_option: 'Botsuana', topic: 'Banderas-8', imagepath: 'images/Banderas/bw.svg' },
  #{ correct_option: 'Tonga', topic: 'Banderas-8', imagepath: 'images/Banderas/to.svg' },
  #{ correct_option: 'Uzbekistán', topic: 'Banderas-8', imagepath: 'images/Banderas/uz.svg' },
  #{ correct_option: 'Granada', topic: 'Banderas-8', imagepath: 'images/Banderas/gd.svg' },
  #{ correct_option: 'República Árabe Siria', topic: 'Banderas-8', imagepath: 'images/Banderas/sy.svg' },
  #{ correct_option: 'Curazao', topic: 'Banderas-8', imagepath: 'images/Banderas/cw.svg' },
  #{ correct_option: 'Mauricio', topic: 'Banderas-8', imagepath: 'images/Banderas/mu.svg' },
  #{ correct_option: 'Tanzania', topic: 'Banderas-8', imagepath: 'images/Banderas/tz.svg' },
  #{ correct_option: 'Jersey', topic: 'Banderas-8', imagepath: 'images/Banderas/je.svg' },
  #{ correct_option: 'Gambia', topic: 'Banderas-8', imagepath: 'images/Banderas/gm.svg' },
  #{ correct_option: 'Islas Feroe', topic: 'Banderas-8', imagepath: 'images/Banderas/fo.svg' },
  #{ correct_option: 'Nueva Caledonia', topic: 'Banderas-8', imagepath: 'images/Banderas/nc.svg' },
  #{ correct_option: 'Myanmar', topic: 'Banderas-8', imagepath: 'images/Banderas/mm.svg' },
  #{ correct_option: 'Islas Salomón', topic: 'Banderas-8', imagepath: 'images/Banderas/sb.svg' },
  #{ correct_option: 'Laos', topic: 'Banderas-8', imagepath: 'images/Banderas/la.svg' },

  ##Demential 4

  #{ correct_option: 'Samoa Americana', topic: 'Banderas-9', imagepath: 'images/Banderas/as.svg' },
  #{ correct_option: 'Chipre', topic: 'Banderas-9', imagepath: 'images/Banderas/cy.svg' },
  #{ correct_option: 'Guayana Francesa', topic: 'Banderas-9', imagepath: 'images/Banderas/gf.svg' },
  #{ correct_option: 'Vanuatu', topic: 'Banderas-9', imagepath: 'images/Banderas/vu.svg' },
  #{ correct_option: 'Georgia del Sur y las Islas Sandwich del Sur', topic: 'Banderas-9', imagepath: 'images/Banderas/gs.svg' },
  #{ correct_option: 'Sierra Leona', topic: 'Banderas-9', imagepath: 'images/Banderas/sl.svg' },
  #{ correct_option: 'Líbano', topic: 'Banderas-9', imagepath: 'images/Banderas/lb.svg' },
  #{ correct_option: 'Comoras', topic: 'Banderas-9', imagepath: 'images/Banderas/km.svg' },
  #{ correct_option: 'Timor Oriental', topic: 'Banderas-9', imagepath: 'images/Banderas/tl.svg' },
  #{ correct_option: 'Mayotte', topic: 'Banderas-9', imagepath: 'images/Banderas/yt.svg' },
  #{ correct_option: 'Guadalupe', topic: 'Banderas-9', imagepath: 'images/Banderas/gp.svg' },
  #{ correct_option: 'Islas Cocos (Keeling)', topic: 'Banderas-9', imagepath: 'images/Banderas/cc.svg' },
  #{ correct_option: 'Wallis y Futuna', topic: 'Banderas-9', imagepath: 'images/Banderas/wf.svg' },
  #{ correct_option: 'Caribe Neerlandés', topic: 'Banderas-9', imagepath: 'images/Banderas/bq.svg' },
  #{ correct_option: 'Lesoto', topic: 'Banderas-9', imagepath: 'images/Banderas/ls.svg' },
  #{ correct_option: 'Palaos', topic: 'Banderas-9', imagepath: 'images/Banderas/pw.svg' },
  #{ correct_option: 'Tokelau', topic: 'Banderas-9', imagepath: 'images/Banderas/tk.svg' },
  #{ correct_option: 'Santa Elena, Ascensión y Tristán de Acuña', topic: 'Banderas-9', imagepath: 'images/Banderas/sh.svg' },
  #{ correct_option: 'Papúa Nueva Guinea', topic: 'Banderas-9', imagepath: 'images/Banderas/pg.svg' },
  #{ correct_option: 'Bielorrusia', topic: 'Banderas-9', imagepath: 'images/Banderas/by.svg' },
  #{ correct_option: 'Santa Lucía', topic: 'Banderas-9', imagepath: 'images/Banderas/lc.svg' },
  #{ correct_option: 'Islas Marshall', topic: 'Banderas-9', imagepath: 'images/Banderas/mh.svg' },
  #{ correct_option: 'Malaui', topic: 'Banderas-9', imagepath: 'images/Banderas/mw.svg' },
  #{ correct_option: 'Barbados', topic: 'Banderas-9', imagepath: 'images/Banderas/bb.svg' },

  ##Demential 5

  #{ correct_option: 'Seychelles', topic: 'Banderas-10', imagepath: 'images/Banderas/sc.svg' },
  #{ correct_option: 'Noruega', topic: 'Banderas-10', imagepath: 'images/Banderas/no.svg' },
  #{ correct_option: 'San Martín', topic: 'Banderas-10', imagepath: 'images/Banderas/mf.svg' },
  #{ correct_option: 'Sint Maarten', topic: 'Banderas-10', imagepath: 'images/Banderas/sx.svg' },
  #{ correct_option: 'Guyana', topic: 'Banderas-10', imagepath: 'images/Banderas/gy.svg' },
  #{ correct_option: 'Costa de Marfil', topic: 'Banderas-10', imagepath: 'images/Banderas/ci.svg' },
  #{ correct_option: 'Ruanda', topic: 'Banderas-10', imagepath: 'images/Banderas/rw.svg' },
  #{ correct_option: 'Kiribati', topic: 'Banderas-10', imagepath: 'images/Banderas/ki.svg' },
  #{ correct_option: 'República Centroafricana', topic: 'Banderas-10', imagepath: 'images/Banderas/cf.svg' },
  #{ correct_option: 'Burundi', topic: 'Banderas-10', imagepath: 'images/Banderas/bi.svg' },
  #{ correct_option: 'Santo Tomé y Príncipe', topic: 'Banderas-10', imagepath: 'images/Banderas/st.svg' },
  #{ correct_option: 'Gabón', topic: 'Banderas-10', imagepath: 'images/Banderas/ga.svg' },
  #{ correct_option: 'Islas Åland', topic: 'Banderas-10', imagepath: 'images/Banderas/ax.svg' },
  #{ correct_option: 'Togo', topic: 'Banderas-10', imagepath: 'images/Banderas/tg.svg' },
  #{ correct_option: 'Zimbabue', topic: 'Banderas-10', imagepath: 'images/Banderas/zw.svg' },
  #{ correct_option: 'Isla de Navidad', topic: 'Banderas-10', imagepath: 'images/Banderas/cx.svg' },
  #{ correct_option: 'Bután', topic: 'Banderas-10', imagepath: 'images/Banderas/bt.svg' },
  #{ correct_option: 'Islas Marianas del Norte', topic: 'Banderas-10', imagepath: 'images/Banderas/mp.svg' },
  #{ correct_option: 'Islas Caimán', topic: 'Banderas-10', imagepath: 'images/Banderas/ky.svg' },
  #{ correct_option: 'Guinea Ecuatorial', topic: 'Banderas-10', imagepath: 'images/Banderas/gq.svg' },
  #{ correct_option: 'Islas Cook', topic: 'Banderas-10', imagepath: 'images/Banderas/ck.svg' },
  #{ correct_option: 'Tuvalu', topic: 'Banderas-10', imagepath: 'images/Banderas/tv.svg' },
  #{ correct_option: 'Macao', topic: 'Banderas-10', imagepath: 'images/Banderas/mo.svg' }
]

options_data = [
  { response: 'Washington D.C.', topic: 'Banderas' },
  { response: 'Shanghái', topic: 'Banderas' },
  { response: 'Bombay', topic: 'Banderas' },
  { response: 'San Petersburgo', topic: 'Banderas' },
  { response: 'São Paulo', topic: 'Banderas' },
  { response: 'Osaka', topic: 'Banderas' },
  { response: 'Hamburgo', topic: 'Banderas' },
  { response: 'Liverpool', topic: 'Banderas' },
  { response: 'Lyon', topic: 'Banderas' },
  { response: 'Ciudad de Guatemala', topic: 'Banderas' },
  { response: 'Luxemburgo', topic: 'Banderas' },
  { response: 'Bruselas', topic: 'Banderas' },
  { response: 'Budapest', topic: 'Banderas' },
  { response: 'Copenhague', topic: 'Banderas' },
  { response: 'Sofía', topic: 'Banderas' },
  { response: 'Zagreb', topic: 'Banderas' },
  { response: 'Bucarest', topic: 'Banderas' },
  { response: 'Liubliana', topic: 'Banderas' },
  { response: 'Atenas', topic: 'Banderas' },
  { response: 'Sucre', topic: 'Banderas' },
  { response: 'Johannesburgo', topic: 'Banderas' },
  { response: 'Abuja', topic: 'Banderas' },
  { response: 'Alejandría', topic: 'Banderas' },
  { response: 'Lahore', topic: 'Banderas' },
  { response: 'Tabriz', topic: 'Banderas' },
  { response: 'Hanói', topic: 'Banderas' },
  { response: 'Phnom Penh', topic: 'Banderas' },
  { response: 'Cracovia', topic: 'Banderas' },
  { response: 'Medellín', topic: 'Banderas' },
  { response: 'Caracas', topic: 'Banderas' },
  { response: 'Kuala Lumpur', topic: 'Banderas' },
  { response: 'Manila', topic: 'Banderas' },
  { response: 'Dacca', topic: 'Banderas' },
  { response: 'Lviv', topic: 'Banderas' },
  { response: 'Khartoum', topic: 'Banderas' },
  { response: 'Casablanca', topic: 'Banderas' },
  { response: 'Nairobi', topic: 'Banderas' },
  { response: 'Lima', topic: 'Banderas' },
  { response: 'Santiago', topic: 'Banderas' },
  { response: 'Estocolmo', topic: 'Banderas' },
  { response: 'Zúrich', topic: 'Banderas' },
  { response: 'Gante', topic: 'Banderas' },
  { response: 'Innsbruck', topic: 'Banderas' },
  { response: 'Bergen', topic: 'Banderas' },
  { response: 'Haifa', topic: 'Banderas' },
  { response: 'Basora', topic: 'Banderas' },
  { response: 'Dubái', topic: 'Banderas' },
  { response: 'Madeira', topic: 'Banderas' },
  { response: 'Johor Bahru', topic: 'Banderas' },
  { response: 'Salónica', topic: 'Banderas' },
  { response: 'Aarhus', topic: 'Banderas' },
  { response: 'Tampere', topic: 'Banderas' },
  { response: 'Győr', topic: 'Banderas' },
  { response: 'Olomouc', topic: 'Banderas' },
  { response: 'Constanza', topic: 'Banderas' },
  { response: 'Niš', topic: 'Banderas' },
  { response: 'Plovdiv', topic: 'Banderas' },
  { response: 'Košice', topic: 'Banderas' },
  { response: 'Zadar', topic: 'Banderas' },
  { response: 'Tarija', topic: 'Banderas' },        
  { response: 'Una entidad política soberana con un territorio definido y un gobierno', topic: 'Geografía Física' },
  { response: 'Una montaña o colina formada por la acumulación de materiales expulsados desde el interior de la Tierra', topic: 'Geografía Física' },
  { response: 'Centro administrativo y político de un país o estado', topic: 'Geografía Política' },
  { response: 'Un país es un área geográfica que no tiene límites definidos y está habitada por múltiples grupos étnicos.', topic: 'Geografía Física' },
  { response: 'Un volcán es una formación geológica compuesta por capas de rocas sedimentarias.', topic: 'Geografía Física' },
  { response: 'Una capital en geografía se define como la ciudad más grande de un país.', topic: 'Geografía Física' },
  { response: 'Un desierto es una región geográfica caracterizada por su abundante vegetación y altos niveles de precipitación.', topic: 'Geografía Física' },
  { response: 'Un istmo es una cordillera montañosa que divide dos océanos.', topic: 'Geografía Física' },
  { response: 'Un archipiélago se refiere a una serie de montañas próximas entre sí en medio de un océano.', topic: 'Geografía Física' },
  { response: 'Un golfo es una formación geográfica compuesta por tierras altas y montañas.', topic: 'Geografía Física' },
  { response: 'Una isla es una extensión de tierra que no está rodeada por agua.', topic: 'Geografía Física' },
  { response: 'Un río es una formación geológica que se encuentra bajo tierra.', topic: 'Geografía Física' },
  { response: 'Las placas tectónicas en geografía física son formaciones de hielo en los polos terrestres.', topic: 'Geografía Física' }, 
  { question: '¿Qué es la meteorización?', correct_option: 'El proceso de descomposición y desgaste de rocas y suelo debido a factores como el clima y la acción biológica', topic: 'Geografía Física' },
  { question: '¿Qué son las montañas?', correct_option: 'Elevaciones naturales del terreno que se caracterizan por su altura y relieve escarpado', topic: 'Geografía Física' },
  { question: '¿Qué es la tundra?', correct_option: 'Un bioma frío y árido caracterizado por suelos congelados y vegetación escasa, como musgos y líquenes', topic: 'Geografía Física' },
  { question: '¿Cuál es el proceso de erosión más común en las costas?', correct_option: 'La acción del oleaje y las corrientes marinas', topic: 'Geografía Física' },
  { question: '¿Qué es el permafrost?', correct_option: 'Suelo permanentemente congelado que se encuentra en regiones frías, como el Ártico', topic: 'Geografía Física' },
  { question: '¿Qué es un acuífero?', correct_option: 'Una formación geológica subterránea que almacena y transmite agua subterránea', topic: 'Geografía Física' },
  { question: '¿Cuál es el efecto de la deforestación en el medio ambiente?', correct_option: 'La pérdida de biodiversidad, el cambio climático y la degradación del suelo', topic: 'Geografía Física' },
  { question: '¿Qué son los glaciares?', correct_option: 'Grandes masas de hielo que se forman en tierra y se mueven lentamente debido a la gravedad', topic: 'Geografía Física' },
  { question: '¿Qué es el ciclo del agua?', correct_option: 'El proceso continuo de evaporación, condensación, precipitación y escorrentía que mueve el agua a través del ambiente terrestre', topic: 'Geografía Física' },
  { question: '¿Qué es un ecosistema?', correct_option: 'Una comunidad biológica de organismos vivos interactuando con su entorno físico', topic: 'Geografía Física' },
  { response: 'La población de un área geográfica se refiere al número total de edificios en esa área.', topic: 'Human Geography' },
  { response: 'La cultura en geografía humana se define como la forma en que las personas se mueven y viajan dentro de una región específica.', topic: 'Human Geography' },
  { response: 'La urbanización se refiere al proceso de reducción del tamaño de las áreas urbanas.', topic: 'Human Geography' },
  { response: 'La globalización se refiere a la tendencia de las culturas a permanecer aisladas y sin influencia externa.', topic: 'Human Geography' },
  { response: 'La demografía es el estudio de los patrones climáticos en una región determinada.', topic: 'Human Geography' },
  { response: 'La industrialización es el proceso de transformar una sociedad basada en la industria en una sociedad basada en la agricultura.', topic: 'Human Geography' },
  { response: 'La pobreza se define como el acceso abundante a recursos básicos como alimentos, vivienda y educación.', topic: 'Human Geography' },
  { response: 'La diversidad cultural se refiere a la homogeneidad cultural dentro de una sociedad.', topic: 'Human Geography' },
  { response: 'La gentrificación es el proceso de renovación urbana que a menudo resulta en la mejora de la calidad de vida de los residentes de bajos ingresos.', topic: 'Human Geography' },
  { response: 'La migración se refiere al proceso de inmovilización de personas dentro de un mismo lugar.', topic: 'Human Geography' },  
  { response: 'Es un continente pequeño ubicado en el hemisferio sur, rodeado principalmente por el océano Índico.', topic: 'Continentes' },
  { response: 'Este continente se encuentra en el hemisferio norte y está rodeado principalmente por el océano Atlántico y el océano Pacífico.', topic: 'Continentes' },
  { response: 'Ubicado en el hemisferio sur, este continente limita con Europa y África al norte.', topic: 'Continentes' },
  { response: 'Es el continente más pequeño del mundo y está rodeado principalmente por el océano Pacífico.', topic: 'Continentes' },
  { response: 'Es el océano más pequeño y se encuentra en el hemisferio sur, rodeado principalmente por Europa y África.', topic: 'Océanos y Mares' },
  { response: 'Se encuentra entre América del Norte y América del Sur, y es conocido por ser el océano más frío del mundo.', topic: 'Océanos y Mares' },
  { response: 'Este océano se encuentra principalmente en el hemisferio sur y limita con Asia y Oceanía.', topic: 'Océanos y Mares' },
  { response: 'Ubicado en el hemisferio norte, este océano está rodeado por Australia, África y América del Sur.', topic: 'Océanos y Mares' },
  { response: 'Un grupo de personas que viven juntas en un área geográfica', topic: 'Geografía Política' },
  { response: 'Un conjunto de leyes y regulaciones que rigen un país', topic: 'Geografía Política' },
  { response: 'Una estructura física que separa dos países', topic: 'Geografía Política' },
  { response: 'Un sistema de gobierno en el que el pueblo elige a sus líderes mediante elecciones directas', topic: 'Geografía Política' },
  { response: 'Un documento histórico que registra eventos políticos importantes', topic: 'Geografía Política' },
  { response: 'El proceso de crear nuevas leyes y políticas dentro de un país', topic: 'Geografía Política' },
  { response: 'Una forma de gobierno en la que los militares tienen el control político', topic: 'Geografía Política' },
  { response: 'Una organización religiosa que tiene influencia sobre las decisiones políticas de un país', topic: 'Geografía Política' },
  { response: 'Un tipo de gobierno en el que las decisiones políticas se toman de manera descentralizada', topic: 'Geografía Política' }
]

materials_data = [
  { content: 'Un país es una entidad territorial y política.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un volcán es una montaña formada por la acumulación de materiales expulsados desde el interior de la Tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Las montañas son elevaciones naturales del terreno que se caracterizan por su altura y relieve escarpado.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un desierto es una región árida y seca con poca o ninguna vegetación y poca precipitación.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un istmo es una franja estrecha de tierra que conecta dos áreas de tierra más grandes y está rodeada por agua en ambos lados.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un archipiélago es un grupo o conjunto de islas cercanas entre sí en un cuerpo de agua.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un golfo es una porción de océano o mar parcialmente rodeada por tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'El efecto de la deforestación en el medio ambiente incluye la pérdida de biodiversidad, el cambio climático y la degradación del suelo.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Una isla es una masa de tierra rodeada completamente por agua.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un río es una corriente natural de agua que fluye en una dirección específica a través de la superficie terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Las placas tectónicas son fragmentos de la litosfera terrestre que se mueven sobre el manto terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'La meteorización es el proceso de descomposición y desgaste de rocas y suelo debido a factores como el clima y la acción biológica.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'La tundra es un bioma frío y árido caracterizado por suelos congelados y vegetación escasa, como musgos y líquenes.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'La erosión más común en las costas es causada por la acción del oleaje y las corrientes marinas.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'El permafrost es suelo permanentemente congelado que se encuentra en regiones frías, como el Ártico.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'Un acuífero es una formación geológica subterránea que almacena y transmite agua subterránea.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'Los glaciares son grandes masas de hielo que se forman en tierra y se mueven lentamente debido a la gravedad.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'El ciclo del agua es el proceso continuo de evaporación, condensación, precipitación y escorrentía que mueve el agua a través del ambiente terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'Un ecosistema es una comunidad biológica de organismos vivos interactuando con su entorno físico.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'Un delta es una acumulación de sedimentos al final de un río, donde el agua fluvial se encuentra con el océano o un cuerpo de agua más grande.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'Una meseta es una extensa área de terreno plano o ligeramente inclinado elevado sobre la tierra circundante.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Un glacial es una gran masa de hielo que se mueve lentamente a través de la superficie de la Tierra debido a la acumulación y compresión de nieve.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Los humedales son áreas de tierra que están inundadas de forma permanente o temporal, como pantanos, pantanos y manglares.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Un fenómeno natural es un evento o proceso que ocurre en la naturaleza y no es causado por la actividad humana.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Un acantilado es una pared rocosa vertical o inclinada que se encuentra junto a una masa de agua, como un océano o un río.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Un fósil son los restos o vestigios de organismos que vivieron en el pasado, conservados en rocas sedimentarias.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'La lluvia ácida es la precipitación atmosférica que contiene altos niveles de ácidos, debido a la combinación de la humedad en el aire con óxidos de azufre y nitrógeno liberados por fuentes naturales y humanas.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'La desertificación es la degradación de las tierras áridas, semiáridas y subhúmedas debido a varios factores, como el cambio climático y las actividades humanas, que lleva a la pérdida de la productividad del suelo y la vegetación.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'La línea de costa es la línea que marca el límite entre la tierra y el mar en una costa, sujeto a cambios debido a la erosión y la sedimentación.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'La biósfera es la capa de la Tierra que sustenta la vida, que incluye la superficie terrestre, los océanos y la atmósfera.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'Una península es una porción de tierra rodeada de agua por tres lados, que se extiende hacia el cuerpo principal de tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La pluviosidad es la cantidad de precipitación medida en un área durante un período específico de tiempo.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'Un estuario es un área donde un río se encuentra con el mar, con un flujo y reflujo de agua salada y agua dulce, y un hábitat importante para la vida acuática.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La continentalidad es el grado en que el clima de un área está influenciado por su ubicación lejos del océano y más hacia el interior de una masa de tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La precipitación es cualquier forma de agua, líquida o sólida, que cae de la atmósfera y llega a la superficie terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'Un relámpago es una descarga eléctrica visible producida durante una tormenta eléctrica, que resulta de la separación de cargas eléctricas en la atmósfera.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'Un afloramiento rocoso es una formación geológica donde las rocas subterráneas son expuestas en la superficie debido a la erosión o la actividad tectónica.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La convección es el movimiento de fluidos, como aire o agua, causado por diferencias en la temperatura y la densidad, que transporta calor desde una fuente caliente a otra más fría.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La hidrografía es el estudio y la descripción de las aguas superficiales de la Tierra, incluyendo océanos, mares, ríos, lagos y sus características físicas y distribución.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'El clima es el patrón promedio del tiempo atmosférico en un área particular, que incluye temperatura, humedad, viento y precipitación, observado durante un largo período de tiempo.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' }
]

#Create topics
topics_data.each do |data| 
  topic = Topic.find_or_create_by(topic: data[:topic])
end

#Create lessons
lessons_data.each do |l_data|
  topic = Topic.find_or_create_by(topic: l_data[:name_topic])

  lesson = Lesson.find_or_create_by(title: l_data[:title], topic_id: topic.id, num_levels: l_data[:num_levels]) do |l|
    l.description = l_data[:description]
  end

  levels_data.select { |level_data| level_data[:lesson_title] == l_data[:title] }.each do |le_data|
    Level.find_or_create_by(number: le_data[:number], name: le_data[:name], lesson_id: lesson.id)
  end
end

#Creates a lesson for each topic and associates its levels
lessons_data.each do |l_data|
  topic = Topic.find_or_create_by(topic: l_data[:name_topic])

  lesson = Lesson.find_or_create_by(title: l_data[:title], topic_id: topic.id, num_levels: l_data[:num_levels]) do |l|
    l.description = l_data[:description]
  end

  levels_data.select { |level_data| level_data[:lesson_title] == l_data[:title] }.each do |le_data|
    Level.find_or_create_by(number: le_data[:number], name: le_data[:name], lesson_id: lesson.id)
  end
end

#Create exams
exams_data.each do |exam_data|
  level = Level.find_or_create_by(name: exam_data[:level_name])
  lesson = Lesson.find_or_create_by(title: exam_data[:lesson])
  exam = Exam.find_or_create_by(name: exam_data[:name], duration: exam_data[:duration], level_id: level.id, lesson_id: lesson.id)

  questions = questions_data.select { |q| q[:topic] == exam_data[:topic] && q[:level_name] == exam_data[:level_name] }

  questions.each_slice(10).with_index(1) do |question_slice, index|
    next if question_slice.empty?

    exam_name = "#{exam_data[:topic]} #{index}"
    next unless exam_data[:name] == exam_name

    question_slice.each do |q_data|
      topic_record = Topic.find_or_create_by(topic: q_data[:topic])
      question = Question.find_or_create_by(question: q_data[:question], exam_id: exam.id, topic: topic_record)
      exam.questions << question unless exam.questions.include?(question)
    end
  end
end


#Create questions
questions_data.each do |q_data|
  topic = Topic.find_by(topic: q_data[:topic])
  next unless topic

  correct_option = Option.find_or_create_by(response: q_data[:correct_option], topics_id: topic.id)
  
  if (q_data[:imagepath] != nil)
    question = Question.find_or_create_by(question: '¿A qué país pertenece esta bandera?', topic_id: topic.id)    
    Qa.create!(questions_id: question.id, options_id: correct_option.id, imagepath: q_data[:imagepath])
  else
    question = Question.create!(question: q_data[:question], topic_id: topic.id)
    exam = Exam.find_by(name: q_data[:exam_name])
    Qa.create!(questions_id: question.id, options_id: correct_option.id, imagepath: q_data[:imagepath], exam_id: exam&.id)
  end
  
end

#Create options
options_data.each do |o_data| 
  topic = Topic.find_by(topic: o_data[:topic])
  next unless topic

  Option.find_or_create_by(response: o_data[:response], topics_id: topic.id)
end

#Create material
materials_data.each do |m_data|
  topic = Topic.find_or_create_by(topic: m_data[:topic])

  level = Level.find_or_create_by(name: m_data[:level])

  Material.find_or_create_by(content: m_data[:content], level_id: level.id, topic_id: topic.id)
end

levels = Level.all
materials = Material.all
levels.each do |l|  
  materials = materials_data.select { |q| q[:level] == l[:name] }
  materials.each do |m|
    materials_list = Material.find_or_create_by(content: m[:content])
    l.materials << materials_list
  end
end