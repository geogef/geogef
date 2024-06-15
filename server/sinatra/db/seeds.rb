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
  { topic: 'Capitales' }
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
  { name: 'Examen Geografía Física 5', duration: 30, level_name: 'Nivel Geografía Física 5', lesson: 'Lección Geografía Física' },
  { name: 'Examen Geografía Física 6', duration: 30, level_name: 'Nivel Geografía Física 6', lesson: 'Lección Geografía Física' },
  { name: 'Examen Geografía Humana 1', duration: 30, level_name: 'Nivel Geografía Humana 1', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Humana 2', duration: 30, level_name: 'Nivel Geografía Humana 2', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Humana 3', duration: 30, level_name: 'Nivel Geografía Humana 3', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Humana 4', duration: 30, level_name: 'Nivel Geografía Humana 4', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Humana 5', duration: 30, level_name: 'Nivel Geografía Humana 5', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Humana 6', duration: 30, level_name: 'Nivel Geografía Humana 6', lesson: 'Lección Geografía Humana' },
  { name: 'Examen Geografía Política 1', duration: 30, level_name: 'Nivel Geografía Política 1', lesson: 'Lección Geografía Política' },
  { name: 'Examen Geografía Política 2', duration: 30, level_name: 'Nivel Geografía Política 2', lesson: 'Lección Geografía Política' },
  { name: 'Examen Geografía Política 3', duration: 30, level_name: 'Nivel Geografía Política 3', lesson: 'Lección Geografía Política' },
  { name: 'Examen Geografía Política 4', duration: 30, level_name: 'Nivel Geografía Política 4', lesson: 'Lección Geografía Política' },
  { name: 'Examen Geografía Política 5', duration: 30, level_name: 'Nivel Geografía Política 5', lesson: 'Lección Geografía Política' },
  { name: 'Examen Geografía Política 6', duration: 30, level_name: 'Nivel Geografía Política 6', lesson: 'Lección Geografía Política' },
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

  #Geografia fisica
  #Nivel 1
  { question: '¿Qué es un país?', correct_option: 'Una entidad territorial y política', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es un volcán?', correct_option: 'Una montaña formada por la acumulación de materiales expulsados desde el interior de la Tierra', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué caracteriza a un desierto?', correct_option: 'Una región árida y seca con poca o ninguna vegetación y poca precipitación', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es un istmo?', correct_option: 'Una franja estrecha de tierra que conecta dos áreas de tierra más grandes y está rodeada por agua en ambos lados', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Cuál es la característica principal de un archipiélago?', correct_option: 'Un grupo o conjunto de islas cercanas entre sí en un cuerpo de agua', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es un golfo?', correct_option: 'Una porción de océano o mar parcialmente rodeada por tierra', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Cuál es la definición de una isla?', correct_option: 'Una masa de tierra rodeada completamente por agua', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  { question: '¿Qué es un río?', correct_option: 'Una corriente natural de agua que fluye en una dirección específica a través de la superficie terrestre', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 1' },
  #Nivel 2
  { question: '¿Qué son las placas tectónicas en geografía física?', correct_option: 'Son fragmentos de la litosfera terrestre que se mueven sobre el manto terrestre.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es la meteorización?', correct_option: 'El proceso de descomposición y desgaste de rocas y suelo debido a factores como el clima y la acción biológica', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué son las montañas?', correct_option: 'Elevaciones naturales del terreno que se caracterizan por su altura y relieve escarpado', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es la tundra?', correct_option: 'Un bioma frío y árido caracterizado por suelos congelados y vegetación escasa, como musgos y líquenes', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Cuál es el proceso de erosión más común en las costas?', correct_option: 'La acción del oleaje y las corrientes marinas', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es el permafrost?', correct_option: 'Suelo permanentemente congelado que se encuentra en regiones frías, como el Ártico', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Qué es un acuífero?', correct_option: 'Una formación geológica subterránea que almacena y transmite agua subterránea', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  { question: '¿Cuál es el efecto de la deforestación en el medio ambiente?', correct_option: 'La pérdida de biodiversidad, el cambio climático y la degradación del suelo', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 2' },
  #Nivel 3
  { question: '¿Qué son los glaciares?', correct_option: 'Grandes masas de hielo que se forman en tierra y se mueven lentamente debido a la gravedad', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es el ciclo del agua?', correct_option: 'El proceso continuo de evaporación, condensación, precipitación y escorrentía que mueve el agua a través del ambiente terrestre', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un ecosistema?', correct_option: 'Una comunidad biológica de organismos vivos interactuando con su entorno físico', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un delta?', correct_option: 'Una acumulación de sedimentos al final de un río, donde el agua fluvial se encuentra con el océano o un cuerpo de agua más grande', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es una meseta?', correct_option: 'Una extensa área de terreno plano o ligeramente inclinado elevado sobre la tierra circundante', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un glacial?', correct_option: 'Una gran masa de hielo que se mueve lentamente a través de la superficie de la Tierra debido a la acumulación y compresión de nieve', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué son los humedales?', correct_option: 'Áreas de tierra que están inundadas de forma permanente o temporal, como pantanos, pantanos y manglares', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  { question: '¿Qué es un fenómeno natural?', correct_option: 'Un evento o proceso que ocurre en la naturaleza y no es causado por la actividad humana', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 3' },
  #Nivel 4
  { question: '¿Qué es un archipiélago?', correct_option: 'Un grupo o cadena de islas dispersas en un cuerpo de agua más grande', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es un acantilado?', correct_option: 'Una pared rocosa vertical o inclinada que se encuentra junto a una masa de agua, como un océano o un río', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es un fósil?', correct_option: 'Los restos o vestigios de organismos que vivieron en el pasado, conservados en rocas sedimentarias.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Cuál es la definición de lluvia ácida?', correct_option: 'Precipitación atmosférica que contiene altos niveles de ácidos, debido a la combinación de la humedad en el aire con óxidos de azufre y nitrógeno liberados por fuentes naturales y humanas.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es la desertificación?', correct_option: 'La degradación de las tierras áridas, semiáridas y subhúmedas debido a varios factores, como el cambio climático y las actividades humanas, que lleva a la pérdida de la productividad del suelo y la vegetación.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué se entiende por línea de costa?', correct_option: 'La línea que marca el límite entre la tierra y el mar en una costa, sujeto a cambios debido a la erosión y la sedimentación.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Qué es la biósfera?', correct_option: 'La capa de la Tierra que sustenta la vida, que incluye la superficie terrestre, los océanos y la atmósfera.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  { question: '¿Cuál es la definición de península?', correct_option: 'Una porción de tierra rodeada de agua por tres lados, que se extiende hacia el cuerpo principal de tierra.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 4' },
  #Nivel 5
  { question: '¿Qué es la pluviosidad?', correct_option: 'La cantidad de precipitación medida en un área durante un período específico de tiempo.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es un estuario?', correct_option: 'Un área donde un río se encuentra con el mar, con un flujo y reflujo de agua salada y agua dulce, y un hábitat importante para la vida acuática.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué se entiende por continentalidad?', correct_option: 'El grado en que el clima de un área está influenciado por su ubicación lejos del océano y más hacia el interior de una masa de tierra.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Cuál es la definición de precipitación?', correct_option: 'Cualquier forma de agua, líquida o sólida, que cae de la atmósfera y llega a la superficie terrestre.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es un relámpago?', correct_option: 'Una descarga eléctrica visible producida durante una tormenta eléctrica, que resulta de la separación de cargas eléctricas en la atmósfera.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué se entiende por afloramiento rocoso?', correct_option: 'Una formación geológica donde las rocas subterráneas son expuestas en la superficie debido a la erosión o la actividad tectónica.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Cuál es la definición de convección?', correct_option: 'El movimiento de fluidos, como aire o agua, causado por diferencias en la temperatura y la densidad, que transporta calor desde una fuente caliente a otra más fría.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  { question: '¿Qué es la hidrografía?', correct_option: 'El estudio y la descripción de las aguas superficiales de la Tierra, incluyendo océanos, mares, ríos, lagos y sus características físicas y distribución.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  #Nivel 6
  { question: '¿Qué es el clima?', correct_option: 'El patrón promedio del tiempo atmosférico en un área particular, que incluye temperatura, humedad, viento y precipitación, a lo largo de un período prolongado.', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 6' },
  { question: '¿Qué son las dunas de arena?', correct_option: 'Montículos o colinas de arena creados por la acción del viento en áreas desérticas o costeras', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 6' },
  { question: '¿Qué es una llanura aluvial?', correct_option: 'Una llanura plana o ligeramente inclinada formada por sedimentos depositados por un río durante períodos de inundación', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 6' },
  { question: '¿Qué es la tundra?', correct_option: 'Una región fría y árida caracterizada por la falta de árboles, vegetación escasa y suelos congelados gran parte del año', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 6' },
  { question: '¿Qué es un atolón?', correct_option: 'Un anillo de coral o islote que rodea una laguna de agua salada en medio del océano', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 6' },
  { question: '¿Qué es una cascada?', correct_option: 'Una caída vertical o inclinada de agua en un río o arroyo, a menudo causada por un cambio brusco en el terreno', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 6' },
  { question: '¿Qué es un arrecife de coral?', correct_option: 'Una estructura submarina formada por la acumulación de esqueletos de coral y otros organismos marinos', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 6' },
  { question: '¿Qué son los fiordos?', correct_option: 'Valles glaciares inundados por el mar, creando una forma de entrante costero con acantilados empinados', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 6' },
  #Extras
  # { question: '¿Cuál es la función de un estuario?', correct_option: 'Los estuarios actúan como hábitats importantes para la vida marina, proporcionan protección contra inundaciones y erosionan los sedimentos antes de que lleguen al océano', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  # { question: '¿Qué es una cordillera submarina?', correct_option: 'Una cadena de montañas submarinas que se extiende a lo largo del fondo del océano, generalmente formada por actividad volcánica', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  # { question: '¿Cuál es la diferencia entre un delta y una desembocadura?', correct_option: 'Un delta es una acumulación de sedimentos en la desembocadura de un río, mientras que una desembocadura es el punto donde un río se encuentra con otro cuerpo de agua, como un lago o el océano', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  # { question: '¿Qué es una meseta?', correct_option: 'Una región plana y elevada con acantilados escarpados en al menos un lado, a menudo rodeada por tierras más bajas', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },
  # { question: '¿Qué es un fenómeno meteorológico llamado tornado?', correct_option: 'Es una columna de aire en rotación que se extiende desde una nube de tormenta hasta el suelo, a menudo asociado con vientos destructivos y daños severos', topic: 'Geografía Física', exam_name: 'Examen Geografía Física 5' },    
  
  #Geografia Humana 
  #Nivel 1
  { question: '¿Qué es la población de un área geográfica?', correct_option: 'El número total de personas que viven en esa área', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la cultura en geografía humana?', correct_option: 'Las tradiciones y creencias compartidas por un grupo de personas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la urbanización?', correct_option: 'El proceso de crecimiento y expansión de áreas urbanas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la globalización?', correct_option: 'La integración de las economías, las culturas y las sociedades a nivel mundial', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué estudia la demografía?', correct_option: 'El estudio de las características poblacionales, como el tamaño y la distribución de la población', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la industrialización?', correct_option: 'El proceso de transformar una sociedad basada en la agricultura en una sociedad basada en la industria', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la pobreza?', correct_option: 'La falta de acceso a recursos básicos como alimentos, vivienda y educación', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  { question: '¿Qué es la diversidad cultural?', correct_option: 'La variedad de grupos étnicos, religiosos y culturales que coexisten en una sociedad', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 1' },
  #Nivel 2
  { question: '¿Qué es la gentrificación?', correct_option: 'El proceso de renovación urbana que a menudo resulta en el desplazamiento de residentes de bajos ingresos', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es la migración?', correct_option: 'El movimiento de personas de un lugar a otro con el propósito de establecerse temporal o permanentemente en un nuevo lugar', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es la geopolítica?', correct_option: 'El estudio de la influencia de factores geográficos en la política y las relaciones internacionales', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué son las ciudades globales?', correct_option: 'Ciudades que desempeñan un papel importante en la economía global y están interconectadas a nivel mundial', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es el desarrollo sostenible?', correct_option: 'El desarrollo que satisface las necesidades actuales sin comprometer la capacidad de las generaciones futuras para satisfacer sus propias necesidades', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué son los derechos humanos?', correct_option: 'Los derechos fundamentales inherentes a todos los seres humanos, sin importar su nacionalidad, lugar de residencia, sexo, origen nacional o étnico, color, religión, lengua o cualquier otra condición', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es la migración forzada?', correct_option: 'El movimiento de personas que se ven obligadas a abandonar sus hogares debido a conflictos armados, persecución, desastres naturales u otras circunstancias que ponen en peligro su vida o seguridad', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  { question: '¿Qué es la política de inmigración?', correct_option: 'Las políticas y leyes que regulan la entrada, permanencia y salida de personas de un país', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 2' },
  #Nivel 3
  { question: '¿Qué es la distribución de la riqueza?', correct_option: 'La forma en que los recursos económicos están repartidos entre los individuos o grupos dentro de una población o una región geográfica', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es el desarrollo sostenible?', correct_option: 'Un enfoque para satisfacer las necesidades del presente sin comprometer la capacidad de las generaciones futuras para satisfacer sus propias necesidades.', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la justicia social?', correct_option: 'La idea de que todas las personas deben tener acceso igualitario a los derechos, oportunidades y recursos dentro de una sociedad', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué son los movimientos sociales?', correct_option: 'Grupos organizados de individuos que trabajan juntos para lograr un cambio social o político en una sociedad', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es el cambio climático?', correct_option: 'El cambio a largo plazo en los patrones climáticos de la Tierra, generalmente causado por actividades humanas como la quema de combustibles fósiles y la deforestación', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué son los recursos naturales?', correct_option: 'Los materiales y sustancias que se encuentran en la naturaleza y que son valiosos para los seres humanos, como el aire, el agua, los minerales y los bosques', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la gestión de recursos naturales?', correct_option: 'El proceso de administrar y conservar los recursos naturales para garantizar su uso sostenible y equitativo', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  { question: '¿Qué es la agricultura de subsistencia?', correct_option: 'Un tipo de agricultura en el que las personas cultivan alimentos principalmente para alimentar a sus propias familias, con poco o ningún excedente para la venta', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 3' },
  #Nivel 4
  { question: '¿Qué es la agricultura comercial?', correct_option: 'Un tipo de agricultura en el que los productos agrícolas se cultivan principalmente para la venta en el mercado, en lugar de para el consumo personal', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la desertificación?', correct_option: 'El proceso por el cual las tierras fértiles se vuelven desérticas debido a la sobreexplotación, la deforestación y otros factores ambientales', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la deforestación?', correct_option: 'La eliminación de árboles y bosques para dar paso a otros usos de la tierra, como la agricultura, la ganadería y la urbanización', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la contaminación del agua?', correct_option: 'La introducción de sustancias nocivas en cuerpos de agua como ríos, lagos y océanos, generalmente causada por actividades humanas como la industria y la agricultura', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué son los derechos de agua?', correct_option: 'Los derechos legales o de propiedad sobre el uso de agua, que pueden ser otorgados o regulados por los gobiernos para garantizar su uso equitativo y sostenible', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la seguridad alimentaria?', correct_option: 'La situación en la que todas las personas tienen acceso físico, social y económico a suficientes alimentos nutritivos para satisfacer sus necesidades dietéticas y preferencias alimentarias para una vida activa y saludable', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la tierra cultivable?', correct_option: 'Tierra apta y disponible para la agricultura, que puede ser utilizada para cultivar cultivos y criar ganado', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  { question: '¿Qué es la urbanización descontrolada?', correct_option: 'El crecimiento no planificado y no regulado de áreas urbanas, que puede llevar a problemas como la falta de vivienda, la congestión del tráfico y la contaminación ambiental', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 4' },
  #Nivel 5
  { question: '¿Qué es la gestión de desastres naturales?', correct_option: 'El proceso de planificación, organización y coordinación de recursos para prepararse y responder a desastres naturales como terremotos, huracanes e inundaciones', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la economía informal?', correct_option: 'El sector de la economía que está compuesto por actividades económicas no reguladas o no declaradas, como el trabajo informal y la venta ambulante', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la migración interna?', correct_option: 'El movimiento de personas dentro de un país, generalmente desde áreas rurales a áreas urbanas en busca de empleo y oportunidades económicas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es el desarrollo económico?', correct_option: 'El proceso de mejora de las condiciones económicas de un país o región, que puede medirse mediante indicadores como el crecimiento del PIB, la reducción de la pobreza y el aumento del empleo', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la brecha de desarrollo?', correct_option: 'La diferencia en el desarrollo económico, social y humano entre países o regiones, que puede manifestarse en desigualdades en ingresos, acceso a servicios básicos y calidad de vida', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué son las remesas?', correct_option: 'El dinero que los trabajadores migrantes envían a sus familias en sus países de origen, generalmente para ayudar con los gastos de subsistencia y el desarrollo económico', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la planificación urbana?', correct_option: 'El proceso de diseño y regulación del uso del suelo, la infraestructura y el desarrollo de las áreas urbanas para promover un crecimiento urbano sostenible y equitativo', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  { question: '¿Qué es la gentrificación inversa?', correct_option: 'El proceso por el cual áreas urbanas previamente gentrificadas experimentan una reversión demográfica y socioeconómica, atrayendo de nuevo a residentes de bajos ingresos y minorías étnicas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },
  #Nivel 6
  { question: '¿Qué es la gobernanza urbana?', correct_option: 'El sistema de toma de decisiones y administración de recursos en áreas urbanas, que involucra a gobiernos locales, organizaciones comunitarias y sectores privados para abordar los desafíos urbanos', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 6' },
  { question: '¿Qué es la desigualdad de género?', correct_option: 'La disparidad en el acceso, el control y los beneficios de los recursos y oportunidades entre hombres y mujeres, que puede manifestarse en áreas como la educación, el empleo y la representación política', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 6' },
  { question: '¿Qué es la geografía electoral?', correct_option: 'El estudio de la distribución espacial de los votantes y los resultados electorales, así como los factores geográficos que influyen en el comportamiento político y la participación electoral', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 6' },
  { question: '¿Qué es la gentrificación cultural?', correct_option: 'El proceso por el cual áreas urbanas experimentan un cambio en su composición étnica y cultural, a menudo resultando en la pérdida de identidad cultural y la expulsión de residentes de bajos ingresos y minorías étnicas', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 6' },
  { question: '¿Qué es la gestión de residuos?', correct_option: 'El proceso de recolección, tratamiento y disposición final de los desechos sólidos y líquidos, con el objetivo de minimizar el impacto ambiental y promover el reciclaje y la reutilización', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 6' },
  { question: '¿Qué es la migración forzada?', correct_option: 'El desplazamiento de personas de sus hogares debido a conflictos armados, persecución, desastres naturales u otras condiciones que ponen en peligro su seguridad y bienestar', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 6' },
  { question: '¿Qué es la gestión del crecimiento urbano?', correct_option: 'El proceso de planificación y regulación del desarrollo físico y socioeconómico de las áreas urbanas, con el fin de garantizar un crecimiento equitativo y sostenible', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 6' },
  { question: '¿Qué es la densidad de población?', correct_option: 'La medida de cuántas personas viven en un área determinada, generalmente expresada como el número de personas por kilómetro cuadrado o milla cuadrada', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 6' },
  #Extra
  # { question: '¿Qué son los asentamientos informales?', correct_option: 'Áreas urbanas que carecen de servicios básicos y están construidas en terrenos ocupados ilegalmente o no planificados, a menudo habitadas por personas de bajos ingresos y migrantes', topic: 'Geografía Física', exam_name: 'Examen Geografía Humana 5' },

  #Continentes
  #Nivel 1
  { question: '¿Dónde se encuentra principalmente el continente de África?', correct_option: 'Mayormente en el hemisferio sur, extendiéndose desde el océano Atlántico en el oeste hasta el océano Índico en el este.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Cuál es la ubicación del continente de América?', correct_option: 'Se extiende desde el océano Ártico en el norte hasta el océano Antártico en el sur, y desde el océano Atlántico en el este hasta el océano Pacífico en el oeste.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Dónde se encuentra el continente de Asia?', correct_option: 'Es el continente más grande y se encuentra en el hemisferio este, limitando al oeste con Europa y África, al sur con el océano Índico, al este con el océano Pacífico y al norte con el océano Ártico.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Qué caracteriza la ubicación del continente de Europa?', correct_option: 'Principalmente en el hemisferio norte, limitada al norte por el océano Ártico, al oeste por el océano Atlántico, al sur por el mar Mediterráneo y al este por Asia.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Dónde se ubica el continente de Oceanía?', correct_option: 'En el hemisferio sur, comprendiendo miles de islas dispersas por el océano Pacífico, incluyendo Australia y Nueva Zelanda.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Cuál es la ubicación de la Antártida?', correct_option: 'Se encuentra en el polo sur de la Tierra y está rodeada por el océano Austral.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Cuál es la posición geográfica del continente de Australia?', correct_option: 'Se encuentra en el hemisferio sur, entre los océanos Índico y Pacífico, al sureste de Asia.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  { question: '¿Dónde se localiza principalmente el continente de América del Norte?', correct_option: 'Se encuentra en el hemisferio norte, limitando al norte con el océano Ártico, al este con el océano Atlántico, al oeste con el océano Pacífico y al sur con América Central.', topic: 'Continentes', exam_name: 'Examen Continentes 1' },
  #Nivel 2
  { question: '¿Cuál es la posición relativa del continente de Sudamérica?', correct_option: 'Se ubica en el hemisferio sur, limitando al oeste con el océano Pacífico, al este con el océano Atlántico, al norte con América Central y al sur con la Antártida.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Qué caracteriza la ubicación del continente de América Central?', correct_option: 'Se sitúa entre América del Norte y América del Sur, conectando los dos continentes y limitando al norte con el golfo de México y al sur con Colombia.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Dónde se encuentran principalmente las islas del continente de América Central?', correct_option: 'Principalmente en el mar Caribe y el océano Pacífico, formando un arco entre América del Norte y América del Sur.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Cuál es la ubicación geográfica del continente de África del Norte?', correct_option: 'Se encuentra en el extremo norte del continente africano, limitando con el mar Mediterráneo al norte y con el Sáhara al sur.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Dónde se sitúa principalmente el continente de África del Sur?', correct_option: 'Se encuentra en el extremo sur del continente africano, comprendiendo países como Sudáfrica, Namibia y Botsuana.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Cuál es la posición relativa del continente de Asia Central?', correct_option: 'Se sitúa en la parte central de Asia, rodeada por Rusia al norte, China al este, Irán al sur y Asia del Sur al oeste.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Dónde se localiza principalmente el continente de Asia del Sur?', correct_option: 'Se encuentra en el sur del continente asiático, limitando con el océano Índico al sur y con Asia Central y Asia del Este al norte.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  { question: '¿Cuál es la ubicación geográfica del continente de Asia del Este?', correct_option: 'Se sitúa en el este de Asia, limitando con el océano Pacífico al este y con Asia Central y Asia del Sur al oeste.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  #Extra
  # { question: '¿Dónde se encuentran principalmente las islas del continente de Asia del Este?', correct_option: 'Principalmente en el mar de China Oriental y el mar de Japón, incluyendo islas como Japón, Taiwán y las islas Kuriles.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },
  # { question: '¿Cuál es la posición relativa del continente de Europa del Norte?', correct_option: 'Se encuentra en el norte de Europa, limitando con el océano Atlántico al oeste, el mar Báltico al este y Europa Central al sur.', topic: 'Continentes', exam_name: 'Examen Continentes 2' },

  #Oceanos y Mares
  #Nivel 1
  { question: '¿Cuál es la ubicación geográfica del Mar Mediterráneo?', correct_option: 'Se encuentra entre Europa, África y Asia, conectando con el océano Atlántico a través del estrecho de Gibraltar.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se sitúa principalmente el Mar de China Meridional?', correct_option: 'Se encuentra al sur de China, entre China continental, Taiwán, Vietnam, Malasia, Filipinas e Indonesia.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Cuál es la ubicación geográfica del Mar Mediterráneo?', correct_option: 'Se encuentra entre Europa, África y Asia, conectando con el océano Atlántico a través del estrecho de Gibraltar.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se sitúa principalmente el Mar de China Meridional?', correct_option: 'Se encuentra al sur de China, entre China continental, Taiwán, Vietnam, Malasia, Filipinas e Indonesia.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Cuál es la ubicación del Mar Caribe?', correct_option: 'Está ubicado en el marco del océano Atlántico, al sureste del golfo de México y al norte de América del Sur.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se localiza principalmente el Mar de Bering?', correct_option: 'Se sitúa entre Alaska y el extremo oriental de Rusia, conectando el océano Pacífico y el océano Ártico.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Cuál es la posición relativa del Mar de Tasmania?', correct_option: 'Se encuentra al sur de Australia, entre la isla de Tasmania y el continente australiano.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  { question: '¿Dónde se ubica principalmente el Mar del Norte?', correct_option: 'Se sitúa entre Gran Bretaña y Escandinavia, conectando el océano Atlántico con otros mares del norte de Europa.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 1' },
  #Nivel 2
  { question: '¿Cuál es la ubicación geográfica del Mar de Coral?', correct_option: 'Se encuentra al este de Australia, entre la Gran Barrera de Coral y la costa noreste de Queensland.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Dónde se encuentra principalmente el Mar de Java?', correct_option: 'Se sitúa entre las islas de Java y Sumatra, en Indonesia, conectando el océano Índico con el mar de China Meridional.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Cuál es la posición relativa del Mar de Arabia?', correct_option: 'Se encuentra en el noroeste del océano Índico, entre la península arábiga y el subcontinente indio.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Dónde se localiza principalmente el Mar de Filipinas?', correct_option: 'Se sitúa entre Filipinas y Taiwán, al este del mar de China Meridional.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Cuál es la ubicación geográfica del Mar de Andamán?', correct_option: 'Se encuentra en el extremo oriental del océano Índico, entre la costa occidental de Tailandia, la península de Malasia y la isla de Andamán.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Dónde se sitúa principalmente el Mar de Ross?', correct_option: 'Se ubica en la Antártida, al sur del océano Pacífico y al este del mar de Weddell.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  { question: '¿Cuál es la posición relativa del Mar de Weddell?', correct_option: 'Se encuentra en la Antártida, entre la península Antártica y el continente.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 2' },
  #Nivel 3
  { question: '¿Dónde se localiza principalmente el Mar de Amundsen?', correct_option: 'Se sitúa en la Antártida occidental, al sur del océano Pacífico y al oeste del mar de Ross.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la ubicación geográfica del Mar de Scotia?', correct_option: 'Se encuentra en el océano Atlántico sur, entre América del Sur y la península Antártica.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Dónde se encuentra principalmente el Mar de Irlanda?', correct_option: 'Se sitúa entre Irlanda y Gran Bretaña, conectando el océano Atlántico con el mar Céltico.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la posición relativa del Mar de Labrador?', correct_option: 'Se encuentra en la costa este de Canadá, entre la isla de Terranova y la región continental de Labrador.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la ubicación del Mar Caribe?', correct_option: 'Está ubicado en el marco del océano Atlántico, al sureste del golfo de México y al norte de América del Sur.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Dónde se localiza principalmente el Mar de Bering?', correct_option: 'Se sitúa entre Alaska y el extremo oriental de Rusia, conectando el océano Pacífico y el océano Ártico.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Cuál es la posición relativa del Mar de Tasmania?', correct_option: 'Se encuentra al sur de Australia, entre la isla de Tasmania y el continente australiano.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  { question: '¿Dónde se ubica principalmente el Mar del Norte?', correct_option: 'Se sitúa entre Gran Bretaña y Escandinavia, conectando el océano Atlántico con otros mares del norte de Europa.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 3' },
  #Nivel 4
  { question: '¿Cuál es la ubicación geográfica del Mar de Coral?', correct_option: 'Se encuentra al este de Australia, entre la Gran Barrera de Coral y la costa noreste de Queensland.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 4' },
  { question: '¿Dónde se encuentra principalmente el Mar de Java?', correct_option: 'Se sitúa entre las islas de Java y Sumatra, en Indonesia, conectando el océano Índico con el mar de China Meridional.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 4' },
  { question: '¿Cuál es la posición relativa del Mar de Arabia?', correct_option: 'Se encuentra en el noroeste del océano Índico, entre la península arábiga y el subcontinente indio.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 4' },
  { question: '¿Dónde se localiza principalmente el Mar de Filipinas?', correct_option: 'Se sitúa entre Filipinas y Taiwán, al este del mar de China Meridional.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 4' },
  { question: '¿Cuál es la ubicación geográfica del Mar de Andamán?', correct_option: 'Se encuentra en el extremo oriental del océano Índico, entre la costa occidental de Tailandia, la península de Malasia y la isla de Andamán.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 4' },
  { question: '¿Dónde se sitúa principalmente el Mar de Ross?', correct_option: 'Se ubica en la Antártida, al sur del océano Pacífico y al este del mar de Weddell.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 4' },
  { question: '¿Cuál es la ubicación geográfica del Océano Pacífico?', correct_option: 'Es el océano más grande, extendiéndose desde el Ártico en el norte hasta el Antártico en el sur, y desde Asia y Australia en el este hasta América en el oeste.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 4' },
  { question: '¿Dónde se encuentra el Océano Atlántico?', correct_option: 'Entre las Américas al oeste y Europa y África al este.', topic: 'Océanos y Mares', exam_name: 'Examen Océanos y Mares 4' },

  #Capitales
  #Nivel 1
  { question: '¿Cuál es la capital de Estados Unidos?', correct_option: 'Washington D.C.', topic: 'Capitales', exam_name: 'Examen Capitales 1' },
  { question: '¿Cuál es la capital de China?', correct_option: 'Pekin', topic: 'Capitales', exam_name: 'Examen Capitales 1' },
  { question: '¿Cuál es la capital de India?', correct_option: 'Nueva Delhi', topic: 'Capitales', exam_name: 'Examen Capitales 1' },
  { question: '¿Cuál es la capital de Rusia?', correct_option: 'Moscú', topic: 'Capitales', exam_name: 'Examen Capitales 1' },
  { question: '¿Cuál es la capital de Brasil?', correct_option: 'Brasilia', topic: 'Capitales', exam_name: 'Examen Capitales 1' },
  { question: '¿Cuál es la capital de Japón?', correct_option: 'Tokio', topic: 'Capitales', exam_name: 'Examen Capitales 1' },
  { question: '¿Cuál es la capital de Alemania?', correct_option: 'Berlín', topic: 'Capitales', exam_name: 'Examen Capitales 1' },
  { question: '¿Cuál es la capital de Reino Unido?', correct_option: 'Londres', topic: 'Capitales', exam_name: 'Examen Capitales 1' },
  #Nivel 2
  { question: '¿Cuál es la capital de Francia?', correct_option: 'París', topic: 'Capitales', exam_name: 'Examen Capitales 2' },
  { question: '¿Cuál es la capital de México?', correct_option: 'Ciudad de México', topic: 'Capitales', exam_name: 'Examen Capitales 2' },
  { question: '¿Cuál es la capital de Italia?', correct_option: 'Roma', topic: 'Capitales', exam_name: 'Examen Capitales 2' },
  { question: '¿Cuál es la capital de Canadá?', correct_option: 'Ottawa', topic: 'Capitales', exam_name: 'Examen Capitales 2' },
  { question: '¿Cuál es la capital de Corea del Sur?', correct_option: 'Seúl', topic: 'Capitales', exam_name: 'Examen Capitales 2' },
  { question: '¿Cuál es la capital de España?', correct_option: 'Madrid', topic: 'Capitales', exam_name: 'Examen Capitales 2' },
  { question: '¿Cuál es la capital de Australia?', correct_option: 'Camberra', topic: 'Capitales', exam_name: 'Examen Capitales 2' },
  { question: '¿Cuál es la capital de Indonesia?', correct_option: 'Yakarta', topic: 'Capitales', exam_name: 'Examen Capitales 2' },
  #Nivel 3
  { question: '¿Cuál es la capital de Países Bajos?', correct_option: 'Ámsterdam', topic: 'Capitales', exam_name: 'Examen Capitales 3' },
  { question: '¿Cuál es la capital de Arabia Saudita?', correct_option: 'Riad', topic: 'Capitales', exam_name: 'Examen Capitales 3' },
  { question: '¿Cuál es la capital de Turquía?', correct_option: 'Ankara', topic: 'Capitales', exam_name: 'Examen Capitales 3' },
  { question: '¿Cuál es la capital de Argentina?', correct_option: 'Buenos Aires', topic: 'Capitales', exam_name: 'Examen Capitales 3' },
  { question: '¿Cuál es la capital de Sudáfrica?', correct_option: 'Pretoria', topic: 'Capitales', exam_name: 'Examen Capitales 3' },
  { question: '¿Cuál es la capital de Nigeria?', correct_option: 'Abuja', topic: 'Capitales', exam_name: 'Examen Capitales 3' },
  { question: '¿Cuál es la capital de Egipto?', correct_option: 'El Cairo', topic: 'Capitales', exam_name: 'Examen Capitales 3' },
  { question: '¿Cuál es la capital de Pakistán?', correct_option: 'Islamabad', topic: 'Capitales', exam_name: 'Examen Capitales 3' },
  #Nivel 4
  { question: '¿Cuál es la capital de Irán?', correct_option: 'Teherán', topic: 'Capitales', exam_name: 'Examen Capitales 4' },
  { question: '¿Cuál es la capital de Vietnam?', correct_option: 'Hanói', topic: 'Capitales', exam_name: 'Examen Capitales 4' },
  { question: '¿Cuál es la capital de Tailandia?', correct_option: 'Bangkok', topic: 'Capitales', exam_name: 'Examen Capitales 4' },
  { question: '¿Cuál es la capital de Polonia?', correct_option: 'Varsovia', topic: 'Capitales', exam_name: 'Examen Capitales 4' },
  { question: '¿Cuál es la capital de Colombia?', correct_option: 'Bogotá', topic: 'Capitales', exam_name: 'Examen Capitales 4' },
  { question: '¿Cuál es la capital de Venezuela?', correct_option: 'Caracas', topic: 'Capitales', exam_name: 'Examen Capitales 4' },
  { question: '¿Cuál es la capital de Malasia?', correct_option: 'Kuala Lumpur', topic: 'Capitales', exam_name: 'Examen Capitales 4' },
  { question: '¿Cuál es la capital de Filipinas?', correct_option: 'Manila', topic: 'Capitales', exam_name: 'Examen Capitales 4' },
  #Nivel 5
  { question: '¿Cuál es la capital de Bangladesh?', correct_option: 'Daca', topic: 'Capitales', exam_name: 'Examen Capitales 5' },
  { question: '¿Cuál es la capital de Ucrania?', correct_option: 'Kiev', topic: 'Capitales', exam_name: 'Examen Capitales 5' },
  { question: '¿Cuál es la capital de Sudán?', correct_option: 'Jartum', topic: 'Capitales', exam_name: 'Examen Capitales 5' },
  { question: '¿Cuál es la capital de Marruecos?', correct_option: 'Rabat', topic: 'Capitales', exam_name: 'Examen Capitales 5' },
  { question: '¿Cuál es la capital de Kenia?', correct_option: 'Nairobi', topic: 'Capitales', exam_name: 'Examen Capitales 5' },
  { question: '¿Cuál es la capital de Perú?', correct_option: 'Lima', topic: 'Capitales', exam_name: 'Examen Capitales 5' },
  { question: '¿Cuál es la capital de Chile?', correct_option: 'Santiago', topic: 'Capitales', exam_name: 'Examen Capitales 5' },
  { question: '¿Cuál es la capital de Suecia?', correct_option: 'Estocolmo', topic: 'Capitales', exam_name: 'Examen Capitales 5' },
  #Nivel 6
  { question: '¿Cuál es la capital de Suiza?', correct_option: 'Berna', topic: 'Capitales', exam_name: 'Examen Capitales 6' },
  { question: '¿Cuál es la capital de Bélgica?', correct_option: 'Bruselas', topic: 'Capitales', exam_name: 'Examen Capitales 6' },
  { question: '¿Cuál es la capital de Austria?', correct_option: 'Viena', topic: 'Capitales', exam_name: 'Examen Capitales 6' },
  { question: '¿Cuál es la capital de Noruega?', correct_option: 'Oslo', topic: 'Capitales', exam_name: 'Examen Capitales 6' },
  { question: '¿Cuál es la capital de Israel?', correct_option: 'Jerusalén', topic: 'Capitales', exam_name: 'Examen Capitales 6' },
  { question: '¿Cuál es la capital de Ghana?', correct_option: 'Acra', topic: 'Capitales', exam_name: 'Examen Capitales 6' },
  { question: '¿Cuál es la capital de Irlanda?', correct_option: 'Dublín', topic: 'Capitales', exam_name: 'Examen Capitales 6' },
  { question: '¿Cuál es la capital de Finlandia?', correct_option: 'Helsinki', topic: 'Capitales', exam_name: 'Examen Capitales 6' },
  #Extra
  # { question: '¿Cuál es la capital de Portugal?', correct_option: 'Lisboa', topic: 'Capitales', exam_name: 'Examen Capitales 6' },

  #Geografia Politica
  #Nivel 1
  { question: '¿Qué es un país?', correct_option: 'Una entidad política soberana con un territorio definido y un gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es una frontera?', correct_option: 'Una línea imaginaria que separa dos países', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es la diplomacia?', correct_option: 'El proceso de manejar las relaciones internacionales entre países mediante la negociación y el diálogo', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es una monarquía?', correct_option: 'Un sistema de gobierno en el que un monarca es la cabeza de estado', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Cuál es la función de un tratado?', correct_option: 'Regular las relaciones entre países', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es la independencia?', correct_option: 'El estado de libertad y autonomía política de un país o territorio', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es una alianza?', correct_option: 'Una asociación entre dos o más países con el objetivo de cooperar en áreas específicas de interés común', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  { question: '¿Qué es la colonización?', correct_option: 'El proceso de establecer y controlar territorios por parte de una potencia extranjera', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 1' },
  #Nivel 2
  { question: '¿Qué es una organización internacional?', correct_option: 'Una entidad formada por países soberanos que trabajan juntos para abordar problemas globales y promover la cooperación internacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es el nacionalismo?', correct_option: 'La ideología que promueve la identidad y los intereses de una nación, a menudo asociada con la aspiración de autodeterminación y soberanía', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es un gobierno democrático?', correct_option: 'Un sistema de gobierno en el que el poder político es ejercido por el pueblo a través de elecciones libres y justas', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es la descolonización?', correct_option: 'El proceso de liberación de los territorios coloniales y la adquisición de la independencia política', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es un embargo?', correct_option: 'Una prohibición oficial impuesta por un país para detener el comercio con otro país como medida de presión política o económica', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es el derecho internacional?', correct_option: 'El conjunto de normas y principios que regulan las relaciones entre países y otras entidades internacionales', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es la soberanía?', correct_option: 'El principio de autoridad política y territorial de un estado independiente', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  { question: '¿Qué es un gobierno totalitario?', correct_option: 'Un sistema político en el que el gobierno tiene control absoluto sobre todos los aspectos de la vida pública y privada de los ciudadanos', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 2' },
  #Nivel 3
  { question: '¿Qué es un refugiado?', correct_option: 'Una persona que ha sido obligada a abandonar su país de origen debido a conflictos, persecución o violaciones de los derechos humanos', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la autodeterminación?', correct_option: 'El derecho de los pueblos a decidir su propio estatus político y a determinar libremente su propia forma de gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la diplomacia pública?', correct_option: 'Los esfuerzos de un gobierno para comunicarse y promover sus políticas y valores en el extranjero, dirigidos a la opinión pública internacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es un golpe de Estado?', correct_option: 'La toma violenta o ilegal del poder político por parte de un grupo dentro del gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la asamblea general de las Naciones Unidas?', correct_option: 'El principal órgano deliberativo y representativo de las Naciones Unidas, compuesto por todos los estados miembros', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es el sistema de partido único?', correct_option: 'Un sistema político en el que solo un partido político está legalmente autorizado para gobernar y monopoliza el poder político', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es la geopolítica?', correct_option: 'El estudio de la influencia de factores geográficos en la política internacional y las relaciones internacionales', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  { question: '¿Qué es el tratado de libre comercio?', correct_option: 'Un acuerdo entre dos o más países para eliminar barreras comerciales y promover el intercambio de bienes y servicios sin aranceles ni cuotas', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 3' },
  #Nivel 4
  { question: '¿Qué es la democracia representativa?', correct_option: 'Un sistema político en el que los ciudadanos eligen representantes para que tomen decisiones en su nombre en el gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la cumbre internacional?', correct_option: 'Una reunión de líderes y representantes de varios países para discutir y tomar decisiones sobre temas de interés común', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la asamblea constituyente?', correct_option: 'Un cuerpo legislativo especial encargado de redactar o revisar una constitución para un país o territorio', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es el gobierno de coalición?', correct_option: 'Un gobierno formado por dos o más partidos políticos que trabajan juntos para formar una mayoría en el parlamento y gobernar el país', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es la neutralidad?', correct_option: 'La política de un país de no tomar partido en conflictos internacionales y mantenerse imparcial', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es el federalismo?', correct_option: 'Un sistema de gobierno en el que el poder está dividido entre un gobierno central y unidades políticas más pequeñas, como estados o provincias', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es el imperialismo?', correct_option: 'La política de extender el control o la influencia de una nación sobre territorios extranjeros mediante la colonización, la conquista o la dominación económica', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  { question: '¿Qué es el bloque regional?', correct_option: 'Una asociación de países en una región geográfica que se unen para promover la cooperación económica y política', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 4' },
  #Nivel 5
  { question: '¿Qué es la insurgencia?', correct_option: 'La rebelión armada de un grupo contra un gobierno establecido, a menudo por motivos políticos o sociales', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es un estado fallido?', correct_option: 'Un país que ha perdido el control efectivo sobre su territorio y no puede mantener el orden interno ni brindar servicios básicos a su población', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es la anexión territorial?', correct_option: 'El acto de agregar un territorio a otro país mediante la conquista, el tratado o la ocupación militar', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es el sufragio universal?', correct_option: 'El derecho de todos los ciudadanos adultos a votar en elecciones políticas', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es la constitución?', correct_option: 'Un conjunto de principios y leyes fundamentales que establecen la estructura del gobierno y los derechos de los ciudadanos en un país', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es la geopolítica energética?', correct_option: 'El estudio de las relaciones entre el poder político y los recursos energéticos, como el petróleo y el gas natural, a nivel nacional e internacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es la guerra fría?', correct_option: 'El período de tensión política y confrontación ideológica entre los Estados Unidos y la Unión Soviética después de la Segunda Guerra Mundial, sin un conflicto militar directo', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  { question: '¿Qué es un bloqueo económico?', correct_option: 'Una medida coercitiva en la que un país restringe o prohíbe el comercio con otro país como forma de presión política o económica', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  #Nivel 6
  { question: '¿Qué es la soberanía nacional?', correct_option: 'El principio de autoridad política y autonomía de un estado en su territorio, sin interferencia externa', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 6' },
  { question: '¿Qué es la legislatura?', correct_option: 'El cuerpo legislativo encargado de hacer leyes en un país o estado', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 6' },
  { question: '¿Qué es la economía de mercado?', correct_option: 'Un sistema económico en el que los precios de los bienes y servicios son determinados por la oferta y la demanda en el mercado, con una mínima interferencia del gobierno', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 6' },
  { question: '¿Qué es el apartheid?', correct_option: 'El sistema de segregación racial y discriminación institucionalizada que existió en Sudáfrica entre 1948 y 1994', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 6' },
  { question: '¿Qué es la globalización?', correct_option: 'El proceso de interconexión e interdependencia creciente entre las economías, las sociedades y las culturas a nivel mundial', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 6' },
  { question: '¿Qué es el nacionalismo étnico?', correct_option: 'La identificación y lealtad hacia un grupo étnico particular como base de la identidad nacional y política', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 6' },
  { question: '¿Qué es la diplomacia multilateral?', correct_option: 'El proceso de negociación y cooperación entre tres o más países para abordar problemas y desafíos comunes', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 6' },
  { question: '¿Qué es un referéndum?', correct_option: 'Una votación en la que los ciudadanos expresan su opinión sobre una cuestión específica, generalmente de importancia nacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 6' },  
  #Extra
  # { question: '¿Qué es un tratado internacional?', correct_option: 'Un acuerdo formal entre dos o más países que establece derechos y obligaciones mutuos bajo el derecho internacional', topic: 'Geografía Política', exam_name: 'Examen Geografía Política 5' },
  
  #Banderas
  #Nivel 1
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Argentina', topic: 'Banderas', exam_name: 'Examen Banderas 1', imagepath: 'images/flags/ar.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Bolivia', topic: 'Banderas', exam_name: 'Examen Banderas 1', imagepath: 'images/flags/bo.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Brasil', topic: 'Banderas', exam_name: 'Examen Banderas 1', imagepath: 'images/flags/br.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Canadá', topic: 'Banderas', exam_name: 'Examen Banderas 1', imagepath: 'images/flags/ca.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Chile', topic: 'Banderas', exam_name: 'Examen Banderas 1', imagepath: 'images/flags/cl.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'China', topic: 'Banderas', exam_name: 'Examen Banderas 1', imagepath: 'images/flags/cn.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Colombia', topic: 'Banderas', exam_name: 'Examen Banderas 1', imagepath: 'images/flags/co.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Costa Rica', topic: 'Banderas', exam_name: 'Examen Banderas 1', imagepath: 'images/flags/cr.svg' },
  #Nivel 2
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Croacia', topic: 'Banderas', exam_name: 'Examen Banderas 2', imagepath: 'images/flags/hr.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Cuba', topic: 'Banderas', exam_name: 'Examen Banderas 2', imagepath: 'images/flags/cu.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Ecuador', topic: 'Banderas', exam_name: 'Examen Banderas 2', imagepath: 'images/flags/ec.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Francia', topic: 'Banderas', exam_name: 'Examen Banderas 2', imagepath: 'images/flags/fr.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Alemania', topic: 'Banderas', exam_name: 'Examen Banderas 2', imagepath: 'images/flags/de.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Italia', topic: 'Banderas', exam_name: 'Examen Banderas 2', imagepath: 'images/flags/it.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Japón', topic: 'Banderas', exam_name: 'Examen Banderas 2', imagepath: 'images/flags/jp.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'México', topic: 'Banderas', exam_name: 'Examen Banderas 2', imagepath: 'images/flags/mx.svg' },
  #Nivel 3
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Portugal', topic: 'Banderas', exam_name: 'Examen Banderas 3', imagepath: 'images/flags/pt.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Perú', topic: 'Banderas', exam_name: 'Examen Banderas 3', imagepath: 'images/flags/pe.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'España', topic: 'Banderas', exam_name: 'Examen Banderas 3', imagepath: 'images/flags/es.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Uruguay', topic: 'Banderas', exam_name: 'Examen Banderas 3', imagepath: 'images/flags/uy.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Reino Unido', topic: 'Banderas', exam_name: 'Examen Banderas 3', imagepath: 'images/flags/gb.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Estados Unidos de América', topic: 'Banderas', exam_name: 'Examen Banderas 3', imagepath: 'images/flags/us.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Venezuela', topic: 'Banderas', exam_name: 'Examen Banderas 3', imagepath: 'images/flags/ve.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Paraguay', topic: 'Banderas', exam_name: 'Examen Banderas 3', imagepath: 'images/flags/py.svg' },
  #Nivel 4
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Puerto Rico', topic: 'Banderas', exam_name: 'Examen Banderas 4', imagepath: 'images/flags/pr.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Honduras', topic: 'Banderas', exam_name: 'Examen Banderas 4', imagepath: 'images/flags/hn.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Argelia', topic: 'Banderas', exam_name: 'Examen Banderas 4', imagepath: 'images/flags/dz.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Bélgica', topic: 'Banderas', exam_name: 'Examen Banderas 4', imagepath: 'images/flags/be.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Bosnia y Herzegovina', topic: 'Banderas', exam_name: 'Examen Banderas 4', imagepath: 'images/flags/ba.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Camerún', topic: 'Banderas', exam_name: 'Examen Banderas 4', imagepath: 'images/flags/cm.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Dominica', topic: 'Banderas', exam_name: 'Examen Banderas 4', imagepath: 'images/flags/dm.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'República Dominicana', topic: 'Banderas', exam_name: 'Examen Banderas 4', imagepath: 'images/flags/do.svg' },
  #Nivel 5
  { question: '¿A que país pertenece esta bandera?', correct_option: 'El Salvador', topic: 'Banderas', exam_name: 'Examen Banderas 5', imagepath: 'images/flags/sv.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Finlandia', topic: 'Banderas', exam_name: 'Examen Banderas 5', imagepath: 'images/flags/fi.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Ghana', topic: 'Banderas', exam_name: 'Examen Banderas 5', imagepath: 'images/flags/gh.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Grecia', topic: 'Banderas', exam_name: 'Examen Banderas 5', imagepath: 'images/flags/gr.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Guatemala', topic: 'Banderas', exam_name: 'Examen Banderas 5', imagepath: 'images/flags/gt.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'India', topic: 'Banderas', exam_name: 'Examen Banderas 5', imagepath: 'images/flags/in.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Irán', topic: 'Banderas', exam_name: 'Examen Banderas 5', imagepath: 'images/flags/ir.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Israel', topic: 'Banderas', exam_name: 'Examen Banderas 5', imagepath: 'images/flags/il.svg' },
  #Nivel 6
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Jamaica', topic: 'Banderas', exam_name: 'Examen Banderas 6', imagepath: 'images/flags/jm.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Países Bajos', topic: 'Banderas', exam_name: 'Examen Banderas 6', imagepath: 'images/flags/nl.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Nueva Zelanda', topic: 'Banderas', exam_name: 'Examen Banderas 6', imagepath: 'images/flags/nz.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Nicaragua', topic: 'Banderas', exam_name: 'Examen Banderas 6', imagepath: 'images/flags/ni.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Nigeria', topic: 'Banderas', exam_name: 'Examen Banderas 6', imagepath: 'images/flags/ng.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Polonia', topic: 'Banderas', exam_name: 'Examen Banderas 6', imagepath: 'images/flags/pl.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Rusia', topic: 'Banderas', exam_name: 'Examen Banderas 6', imagepath: 'images/flags/ru.svg' },
  { question: '¿A que país pertenece esta bandera?', correct_option: 'Arabia Saudita', topic: 'Banderas', exam_name: 'Examen Banderas 6', imagepath: 'images/flags/sa.svg' },
  #Extras
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Senegal', topic: 'Banderas', imagepath: 'images/flags/sn.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Serbia', topic: 'Banderas', imagepath: 'images/flags/rs.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Corea del Sur', topic: 'Banderas', imagepath: 'images/flags/kr.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Panamá', topic: 'Banderas', imagepath: 'images/flags/pa.svg' },

  ##Medium Mode

  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Andorra', topic: 'Banderas', imagepath: 'images/flags/ad.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Australia', topic: 'Banderas', imagepath: 'images/flags/au.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Bulgaria', topic: 'Banderas', imagepath: 'images/flags/bg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Egipto', topic: 'Banderas', imagepath: 'images/flags/eg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Estonia', topic: 'Banderas', imagepath: 'images/flags/ee.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Dinamarca', topic: 'Banderas', imagepath: 'images/flags/dk.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Georgia', topic: 'Banderas', imagepath: 'images/flags/ge.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Haití', topic: 'Banderas', imagepath: 'images/flags/ht.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Hungría', topic: 'Banderas', imagepath: 'images/flags/hu.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islandia', topic: 'Banderas', imagepath: 'images/flags/is.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Indonesia', topic: 'Banderas', imagepath: 'images/flags/id.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Irak', topic: 'Banderas', imagepath: 'images/flags/iq.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Irlanda', topic: 'Banderas', imagepath: 'images/flags/ie.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Kenia', topic: 'Banderas', imagepath: 'images/flags/ke.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Luxemburgo', topic: 'Banderas', imagepath: 'images/flags/lu.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Madagascar', topic: 'Banderas', imagepath: 'images/flags/mg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Mónaco', topic: 'Banderas', imagepath: 'images/flags/mc.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Ucrania', topic: 'Banderas', imagepath: 'images/flags/ua.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Corea del Norte', topic: 'Banderas', imagepath: 'images/flags/kp.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Pakistán', topic: 'Banderas', imagepath: 'images/flags/pk.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Hong Kong', topic: 'Banderas', imagepath: 'images/flags/hk.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Filipinas', topic: 'Banderas', imagepath: 'images/flags/ph.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Catar', topic: 'Banderas', imagepath: 'images/flags/qa.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Sudáfrica', topic: 'Banderas', imagepath: 'images/flags/za.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Suecia', topic: 'Banderas', imagepath: 'images/flags/se.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Suiza', topic: 'Banderas', imagepath: 'images/flags/ch.svg' },

  ##Semi-hard mode

  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'San Marino', topic: 'Banderas', imagepath: 'images/flags/sm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Montenegro', topic: 'Banderas', imagepath: 'images/flags/me.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Nepal', topic: 'Banderas', imagepath: 'images/flags/np.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Zambia', topic: 'Banderas', imagepath: 'images/flags/zm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Turquía', topic: 'Banderas', imagepath: 'images/flags/tr.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Yemen', topic: 'Banderas', imagepath: 'images/flags/ye.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Afganistán', topic: 'Banderas', imagepath: 'images/flags/af.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Albania', topic: 'Banderas', imagepath: 'images/flags/al.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Angola', topic: 'Banderas', imagepath: 'images/flags/ao.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'República Checa', topic: 'Banderas', imagepath: 'images/flags/cz.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Guinea', topic: 'Banderas', imagepath: 'images/flags/gn.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Malí', topic: 'Banderas', imagepath: 'images/flags/ml.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Moldavia', topic: 'Banderas', imagepath: 'images/flags/md.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Mongolia', topic: 'Banderas', imagepath: 'images/flags/mn.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Marruecos', topic: 'Banderas', imagepath: 'images/flags/ma.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Namibia', topic: 'Banderas', imagepath: 'images/flags/na.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Níger', topic: 'Banderas', imagepath: 'images/flags/ne.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'República del Congo', topic: 'Banderas', imagepath: 'images/flags/cg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Rumania', topic: 'Banderas', imagepath: 'images/flags/ro.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Eslovaquia', topic: 'Banderas', imagepath: 'images/flags/sk.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Eslovenia', topic: 'Banderas', imagepath: 'images/flags/si.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Taiwán', topic: 'Banderas', imagepath: 'images/flags/tw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Tailandia', topic: 'Banderas', imagepath: 'images/flags/th.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Vietnam', topic: 'Banderas', imagepath: 'images/flags/vn.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Omán', topic: 'Banderas', imagepath: 'images/flags/om.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Emiratos Árabes Unidos', topic: 'Banderas', imagepath: 'images/flags/ae.svg' },

  ##Hard mode

  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Belice', topic: 'Banderas', imagepath: 'images/flags/bz.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Cabo Verde', topic: 'Banderas', imagepath: 'images/flags/cv.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Etiopía', topic: 'Banderas', imagepath: 'images/flags/et.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Fiyi', topic: 'Banderas', imagepath: 'images/flags/fj.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Gibraltar', topic: 'Banderas', imagepath: 'images/flags/gi.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Groenlandia', topic: 'Banderas', imagepath: 'images/flags/gl.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Kazajistán', topic: 'Banderas', imagepath: 'images/flags/kz.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Kuwait', topic: 'Banderas', imagepath: 'images/flags/kw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Liberia', topic: 'Banderas', imagepath: 'images/flags/lr.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Libia', topic: 'Banderas', imagepath: 'images/flags/ly.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Macedonia del Norte', topic: 'Banderas', imagepath: 'images/flags/mk.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Singapur', topic: 'Banderas', imagepath: 'images/flags/sg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Somalia', topic: 'Banderas', imagepath: 'images/flags/so.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Sudán del Sur', topic: 'Banderas', imagepath: 'images/flags/ss.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Sudán', topic: 'Banderas', imagepath: 'images/flags/sd.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Siria', topic: 'Banderas', imagepath: 'images/flags/sy.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Uganda', topic: 'Banderas', imagepath: 'images/flags/ug.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Bangladesh', topic: 'Banderas', imagepath: 'images/flags/bd.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Trinidad y Tobago', topic: 'Banderas', imagepath: 'images/flags/tt.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Túnez', topic: 'Banderas', imagepath: 'images/flags/tn.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Estado de Palestina', topic: 'Banderas', imagepath: 'images/flags/ps.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Armenia', topic: 'Banderas', imagepath: 'images/flags/am.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Austria', topic: 'Banderas', imagepath: 'images/flags/at.svg' },

  ##Demential 1

  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Malvinas', topic: 'Banderas', imagepath: 'images/flags/fk.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Kirguistán', topic: 'Banderas', imagepath: 'images/flags/kg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Burkina Faso', topic: 'Banderas', imagepath: 'images/flags/bf.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'República Democrática del Congo', topic: 'Banderas', imagepath: 'images/flags/cd.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Anguila', topic: 'Banderas', imagepath: 'images/flags/ai.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Polinesia Francesa', topic: 'Banderas', imagepath: 'images/flags/pf.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Jordania', topic: 'Banderas', imagepath: 'images/flags/jo.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Territorios Franceses del Sur', topic: 'Banderas', imagepath: 'images/flags/tf.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'San Vicente y las Granadinas', topic: 'Banderas', imagepath: 'images/flags/vc.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Aruba', topic: 'Banderas', imagepath: 'images/flags/aw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Eritrea', topic: 'Banderas', imagepath: 'images/flags/er.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Turkmenistán', topic: 'Banderas', imagepath: 'images/flags/tm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Nauru', topic: 'Banderas', imagepath: 'images/flags/nr.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Isla Bouvet', topic: 'Banderas', imagepath: 'images/flags/bv.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Letonia', topic: 'Banderas', imagepath: 'images/flags/lv.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Baréin', topic: 'Banderas', imagepath: 'images/flags/bh.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Svalbard y Jan Mayen', topic: 'Banderas', imagepath: 'images/flags/sj.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Chad', topic: 'Banderas', imagepath: 'images/flags/td.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Antártida', topic: 'Banderas', imagepath: 'images/flags/aq.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Vírgenes de los Estados Unidos', topic: 'Banderas', imagepath: 'images/flags/vi.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Guinea-Bisáu', topic: 'Banderas', imagepath: 'images/flags/gw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Pitcairn', topic: 'Banderas', imagepath: 'images/flags/pn.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Benín', topic: 'Banderas', imagepath: 'images/flags/bj.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Santa Sede', topic: 'Banderas', imagepath: 'images/flags/va.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Guam', topic: 'Banderas', imagepath: 'images/flags/gu.svg' },

  ##Demential 2

  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Mauritania', topic: 'Banderas', imagepath: 'images/flags/mr.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Territorio Británico del Océano Índico', topic: 'Banderas', imagepath: 'images/flags/io.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Liechtenstein', topic: 'Banderas', imagepath: 'images/flags/li.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Bermudas', topic: 'Banderas', imagepath: 'images/flags/bm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Estados Federados de Micronesia', topic: 'Banderas', imagepath: 'images/flags/fm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Surinam', topic: 'Banderas', imagepath: 'images/flags/sr.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Brunéi', topic: 'Banderas', imagepath: 'images/flags/bn.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Reunión', topic: 'Banderas', imagepath: 'images/flags/re.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Samoa', topic: 'Banderas', imagepath: 'images/flags/ws.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Heard y McDonald', topic: 'Banderas', imagepath: 'images/flags/hm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Camboya', topic: 'Banderas', imagepath: 'images/flags/kh.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Isla Norfolk', topic: 'Banderas', imagepath: 'images/flags/nf.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'San Cristóbal y Nieves', topic: 'Banderas', imagepath: 'images/flags/kn.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Montserrat', topic: 'Banderas', imagepath: 'images/flags/ms.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Malasia', topic: 'Banderas', imagepath: 'images/flags/my.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Malta', topic: 'Banderas', imagepath: 'images/flags/mt.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'San Pedro y Miquelón', topic: 'Banderas', imagepath: 'images/flags/pm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Niue', topic: 'Banderas', imagepath: 'images/flags/nu.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Isla de Man', topic: 'Banderas', imagepath: 'images/flags/im.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'eSwatini', topic: 'Banderas', imagepath: 'images/flags/sz.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Suecia', topic: 'Banderas', imagepath: 'images/flags/se.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Maldivas', topic: 'Banderas', imagepath: 'images/flags/mv.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Tayikistán', topic: 'Banderas', imagepath: 'images/flags/tj.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Guernsey', topic: 'Banderas', imagepath: 'images/flags/gg.svg' },

  ##Demential 3

  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Turcas y Caicos', topic: 'Banderas', imagepath: 'images/flags/tc.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Menores Alejadas de los Estados Unidos', topic: 'Banderas', imagepath: 'images/flags/um.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Yibuti', topic: 'Banderas', imagepath: 'images/flags/dj.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'San Bartolomé', topic: 'Banderas', imagepath: 'images/flags/bl.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Martinica', topic: 'Banderas', imagepath: 'images/flags/mq.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Vírgenes Británicas', topic: 'Banderas', imagepath: 'images/flags/vg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Mozambique', topic: 'Banderas', imagepath: 'images/flags/mz.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Sahara Occidental', topic: 'Banderas', imagepath: 'images/flags/eh.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Antigua y Barbuda', topic: 'Banderas', imagepath: 'images/flags/ag.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Sri Lanka', topic: 'Banderas', imagepath: 'images/flags/lk.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Botsuana', topic: 'Banderas', imagepath: 'images/flags/bw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Tonga', topic: 'Banderas', imagepath: 'images/flags/to.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Uzbekistán', topic: 'Banderas', imagepath: 'images/flags/uz.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Granada', topic: 'Banderas', imagepath: 'images/flags/gd.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'República Árabe Siria', topic: 'Banderas', imagepath: 'images/flags/sy.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Curazao', topic: 'Banderas', imagepath: 'images/flags/cw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Mauricio', topic: 'Banderas', imagepath: 'images/flags/mu.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Tanzania', topic: 'Banderas', imagepath: 'images/flags/tz.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Jersey', topic: 'Banderas', imagepath: 'images/flags/je.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Gambia', topic: 'Banderas', imagepath: 'images/flags/gm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Feroe', topic: 'Banderas', imagepath: 'images/flags/fo.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Nueva Caledonia', topic: 'Banderas', imagepath: 'images/flags/nc.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Myanmar', topic: 'Banderas', imagepath: 'images/flags/mm.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Salomón', topic: 'Banderas', imagepath: 'images/flags/sb.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Laos', topic: 'Banderas', imagepath: 'images/flags/la.svg' },

  ##Demential 4

  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Samoa Americana', topic: 'Banderas', imagepath: 'images/flags/as.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Chipre', topic: 'Banderas', imagepath: 'images/flags/cy.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Guayana Francesa', topic: 'Banderas', imagepath: 'images/flags/gf.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Vanuatu', topic: 'Banderas', imagepath: 'images/flags/vu.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Georgia del Sur y las Islas Sandwich del Sur', topic: 'Banderas', imagepath: 'images/flags/gs.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Sierra Leona', topic: 'Banderas', imagepath: 'images/flags/sl.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Líbano', topic: 'Banderas', imagepath: 'images/flags/lb.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Comoras', topic: 'Banderas', imagepath: 'images/flags/km.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Timor Oriental', topic: 'Banderas', imagepath: 'images/flags/tl.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Mayotte', topic: 'Banderas', imagepath: 'images/flags/yt.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Guadalupe', topic: 'Banderas', imagepath: 'images/flags/gp.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Cocos (Keeling)', topic: 'Banderas', imagepath: 'images/flags/cc.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Wallis y Futuna', topic: 'Banderas', imagepath: 'images/flags/wf.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Caribe Neerlandés', topic: 'Banderas', imagepath: 'images/flags/bq.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Lesoto', topic: 'Banderas', imagepath: 'images/flags/ls.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Palaos', topic: 'Banderas', imagepath: 'images/flags/pw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Tokelau', topic: 'Banderas', imagepath: 'images/flags/tk.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Santa Elena, Ascensión y Tristán de Acuña', topic: 'Banderas', imagepath: 'images/flags/sh.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Papúa Nueva Guinea', topic: 'Banderas', imagepath: 'images/flags/pg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Bielorrusia', topic: 'Banderas', imagepath: 'images/flags/by.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Santa Lucía', topic: 'Banderas', imagepath: 'images/flags/lc.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Marshall', topic: 'Banderas', imagepath: 'images/flags/mh.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Malaui', topic: 'Banderas', imagepath: 'images/flags/mw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Barbados', topic: 'Banderas', imagepath: 'images/flags/bb.svg' },

  ##Demential 5

  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Seychelles', topic: 'Banderas0', imagepath: 'images/flags/sc.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Noruega', topic: 'Banderas0', imagepath: 'images/flags/no.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'San Martín', topic: 'Banderas0', imagepath: 'images/flags/mf.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Sint Maarten', topic: 'Banderas0', imagepath: 'images/flags/sx.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Guyana', topic: 'Banderas0', imagepath: 'images/flags/gy.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Costa de Marfil', topic: 'Banderas0', imagepath: 'images/flags/ci.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Ruanda', topic: 'Banderas0', imagepath: 'images/flags/rw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Kiribati', topic: 'Banderas0', imagepath: 'images/flags/ki.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'República Centroafricana', topic: 'Banderas0', imagepath: 'images/flags/cf.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Burundi', topic: 'Banderas0', imagepath: 'images/flags/bi.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Santo Tomé y Príncipe', topic: 'Banderas0', imagepath: 'images/flags/st.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Gabón', topic: 'Banderas0', imagepath: 'images/flags/ga.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Åland', topic: 'Banderas0', imagepath: 'images/flags/ax.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Togo', topic: 'Banderas0', imagepath: 'images/flags/tg.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Zimbabue', topic: 'Banderas0', imagepath: 'images/flags/zw.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Isla de Navidad', topic: 'Banderas0', imagepath: 'images/flags/cx.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Bután', topic: 'Banderas0', imagepath: 'images/flags/bt.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Marianas del Norte', topic: 'Banderas0', imagepath: 'images/flags/mp.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Caimán', topic: 'Banderas0', imagepath: 'images/flags/ky.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Guinea Ecuatorial', topic: 'Banderas0', imagepath: 'images/flags/gq.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Islas Cook', topic: 'Banderas0', imagepath: 'images/flags/ck.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Tuvalu', topic: 'Banderas0', imagepath: 'images/flags/tv.svg' },
  #{ question: '¿A que país pertenece esta bandera?', correct_option: 'Macao', topic: 'Banderas0', imagepath: 'images/flags/mo.svg' }
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
  #Geografia Fisica
  #Nivel 1
  { content: 'Un país es una entidad territorial y política.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un volcán es una montaña formada por la acumulación de materiales expulsados desde el interior de la Tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Las montañas son elevaciones naturales del terreno que se caracterizan por su altura y relieve escarpado.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un desierto es una región árida y seca con poca o ninguna vegetación y poca precipitación.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un istmo es una franja estrecha de tierra que conecta dos áreas de tierra más grandes y está rodeada por agua en ambos lados.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un archipiélago es un grupo o conjunto de islas cercanas entre sí en un cuerpo de agua.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'Un golfo es una porción de océano o mar parcialmente rodeada por tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  { content: 'El efecto de la deforestación en el medio ambiente incluye la pérdida de biodiversidad, el cambio climático y la degradación del suelo.', topic: 'Geografía Física', level: 'Nivel Geografía Física 1' },
  #Nivel 2
  { content: 'Una isla es una masa de tierra rodeada completamente por agua.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'Un río es una corriente natural de agua que fluye en una dirección específica a través de la superficie terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'Las placas tectónicas son fragmentos de la litosfera terrestre que se mueven sobre el manto terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'La meteorización es el proceso de descomposición y desgaste de rocas y suelo debido a factores como el clima y la acción biológica.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'La tundra es un bioma frío y árido caracterizado por suelos congelados y vegetación escasa, como musgos y líquenes.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'La erosión más común en las costas es causada por la acción del oleaje y las corrientes marinas.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'El permafrost es suelo permanentemente congelado que se encuentra en regiones frías, como el Ártico.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  { content: 'Un acuífero es una formación geológica subterránea que almacena y transmite agua subterránea.', topic: 'Geografía Física', level: 'Nivel Geografía Física 2' },
  #Nivel 3
  { content: 'Los glaciares son grandes masas de hielo que se forman en tierra y se mueven lentamente debido a la gravedad.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'El ciclo del agua es el proceso continuo de evaporación, condensación, precipitación y escorrentía que mueve el agua a través del ambiente terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Un ecosistema es una comunidad biológica de organismos vivos interactuando con su entorno físico.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Un delta es una acumulación de sedimentos al final de un río, donde el agua fluvial se encuentra con el océano o un cuerpo de agua más grande.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Una meseta es una extensa área de terreno plano o ligeramente inclinado elevado sobre la tierra circundante.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Un glacial es una gran masa de hielo que se mueve lentamente a través de la superficie de la Tierra debido a la acumulación y compresión de nieve.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Los humedales son áreas de tierra que están inundadas de forma permanente o temporal, como pantanos, pantanos y manglares.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  { content: 'Un fenómeno natural es un evento o proceso que ocurre en la naturaleza y no es causado por la actividad humana.', topic: 'Geografía Física', level: 'Nivel Geografía Física 3' },
  #Nivel 4
  { content: 'Un acantilado es una pared rocosa vertical o inclinada que se encuentra junto a una masa de agua, como un océano o un río.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'Un fósil son los restos o vestigios de organismos que vivieron en el pasado, conservados en rocas sedimentarias.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La lluvia ácida es la precipitación atmosférica que contiene altos niveles de ácidos, debido a la combinación de la humedad en el aire con óxidos de azufre y nitrógeno liberados por fuentes naturales y humanas.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La desertificación es la degradación de las tierras áridas, semiáridas y subhúmedas debido a varios factores, como el cambio climático y las actividades humanas, que lleva a la pérdida de la productividad del suelo y la vegetación.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La línea de costa es la línea que marca el límite entre la tierra y el mar en una costa, sujeto a cambios debido a la erosión y la sedimentación.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La biósfera es la capa de la Tierra que sustenta la vida, que incluye la superficie terrestre, los océanos y la atmósfera.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'Una península es una porción de tierra rodeada de agua por tres lados, que se extiende hacia el cuerpo principal de tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  { content: 'La pluviosidad es la cantidad de precipitación medida en un área durante un período específico de tiempo.', topic: 'Geografía Física', level: 'Nivel Geografía Física 4' },
  #Nivel 5
  { content: 'Un estuario es un área donde un río se encuentra con el mar, con un flujo y reflujo de agua salada y agua dulce, y un hábitat importante para la vida acuática.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  { content: 'La continentalidad es el grado en que el clima de un área está influenciado por su ubicación lejos del océano y más hacia el interior de una masa de tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  { content: 'La precipitación es cualquier forma de agua, líquida o sólida, que cae de la atmósfera y llega a la superficie terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  { content: 'Un relámpago es una descarga eléctrica visible producida durante una tormenta eléctrica, que resulta de la separación de cargas eléctricas en la atmósfera.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  { content: 'Un afloramiento rocoso es una formación geológica donde las rocas subterráneas son expuestas en la superficie debido a la erosión o la actividad tectónica.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  { content: 'La convección es el movimiento de fluidos, como aire o agua, causado por diferencias en la temperatura y la densidad, que transporta calor desde una fuente caliente a otra más fría.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  { content: 'La hidrografía es el estudio y la descripción de las aguas superficiales de la Tierra, incluyendo océanos, mares, ríos, lagos y sus características físicas y distribución.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  { content: 'El clima es el patrón promedio del tiempo atmosférico en un área particular, que incluye temperatura, humedad, viento y precipitación, observado durante un largo período de tiempo.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  #Nivel 6
  { content: 'La pluviosidad es la cantidad de precipitación medida en un área durante un período específico de tiempo.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  { content: 'Un estuario es un área donde un río se encuentra con el mar, con un flujo y reflujo de agua salada y agua dulce, y un hábitat importante para la vida acuática.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  { content: 'La continentalidad es el grado en que el clima de un área está influenciado por su ubicación lejos del océano y más hacia el interior de una masa de tierra.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  { content: 'La precipitación es cualquier forma de agua, líquida o sólida, que cae de la atmósfera y llega a la superficie terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  { content: 'La precipitación es cualquier forma de agua, líquida o sólida, que cae de la atmósfera y llega a la superficie terrestre.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  { content: 'Un relámpago es una descarga eléctrica visible producida durante una tormenta eléctrica, que resulta de la separación de cargas eléctricas en la atmósfera.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  { content: 'Un afloramiento rocoso es una formación geológica donde las rocas subterráneas son expuestas en la superficie debido a la erosión o la actividad tectónica.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  { content: 'La convección es el movimiento de fluidos, como aire o agua, causado por diferencias en la temperatura y la densidad, que transporta calor desde una fuente caliente a otra más fría.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  #Extras
  # { content: 'La hidrografía es el estudio y la descripción de las aguas superficiales de la Tierra, incluyendo océanos, mares, ríos, lagos y sus características físicas y distribución.', topic: 'Geografía Física', level: 'Nivel Geografía Física 5' },
  # { content: 'El clima es el patrón promedio del tiempo atmosférico en un área particular, que incluye temperatura, humedad, viento y precipitación, a lo largo de un período prolongado.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  # { content: 'Las dunas de arena son montículos o colinas de arena creados por la acción del viento en áreas desérticas o costeras.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  # { content: 'Una llanura aluvial es una llanura plana o ligeramente inclinada formada por sedimentos depositados por un río durante períodos de inundación.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  # { content: 'La tundra es una región fría y árida caracterizada por la falta de árboles, vegetación escasa y suelos congelados gran parte del año.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  # { content: 'Un atolón es un anillo de coral o islote que rodea una laguna de agua salada en medio del océano.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  # { content: 'Una cascada es una caída vertical o inclinada de agua en un río o arroyo, a menudo causada por un cambio brusco en el terreno.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  # { content: 'Un arrecife de coral es una estructura submarina formada por la acumulación de esqueletos de coral y otros organismos marinos.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  # { content: 'Los fiordos son valles glaciares inundados por el mar, creando una forma de entrante costero con acantilados empinados.', topic: 'Geografía Física', level: 'Nivel Geografía Física 6' },
  #Geografia Humana
  #Nivel 1
  { content: 'La población de un área geográfica es el número total de personas que viven en esa área.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 1' },
  { content: 'La cultura en geografía humana son las tradiciones y creencias compartidas por un grupo de personas.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 1' },
  { content: 'La urbanización es el proceso de crecimiento y expansión de áreas urbanas.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 1' },
  { content: 'La globalización es la integración de las economías, las culturas y las sociedades a nivel mundial.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 1' },
  { content: 'La demografía estudia las características poblacionales, como el tamaño y la distribución de la población.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 1' },
  { content: 'La industrialización es el proceso de transformar una sociedad basada en la agricultura en una sociedad basada en la industria.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 1' },
  { content: 'La pobreza es la falta de acceso a recursos básicos como alimentos, vivienda y educación.', topic: 'Geografía Física', level: 'Geografía Humana 1' },
  { content: 'La diversidad cultural es la variedad de grupos étnicos, religiosos y culturales que coexisten en una sociedad.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 1' },
  #Nivel 2
  { content: 'La gentrificación es el proceso de renovación urbana que a menudo resulta en el desplazamiento de residentes de bajos ingresos.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 2' },
  { content: 'La migración es el movimiento de personas de un lugar a otro con el propósito de establecerse temporal o permanentemente en un nuevo lugar.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 2' },
  { content: 'La geopolítica es el estudio de la influencia de factores geográficos en la política y las relaciones internacionales.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 2' },
  { content: 'Las ciudades globales son ciudades que desempeñan un papel importante en la economía global y están interconectadas a nivel mundial.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 2' },
  { content: 'El desarrollo sostenible es el desarrollo que satisface las necesidades actuales sin comprometer la capacidad de las generaciones futuras para satisfacer sus propias necesidades.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 2' },
  { content: 'Los derechos humanos son los derechos fundamentales inherentes a todos los seres humanos, sin importar su nacionalidad, lugar de residencia, sexo, origen nacional o étnico, color, religión, lengua o cualquier otra condición.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 2' },
  { content: 'La migración forzada es el movimiento de personas que se ven obligadas a abandonar sus hogares debido a conflictos armados, persecución, desastres naturales u otras circunstancias que ponen en peligro su vida o seguridad.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 2' },
  { content: 'La política de inmigración son las políticas y leyes que regulan la entrada, permanencia y salida de personas de un país.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 2' },
  #Nivel 3
  { content: 'La distribución de la riqueza es la forma en que los recursos económicos están repartidos entre los individuos o grupos dentro de una población o una región geográfica.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 3' },
  { content: 'El desarrollo sostenible es un enfoque para satisfacer las necesidades del presente sin comprometer la capacidad de las generaciones futuras para satisfacer sus propias necesidades.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 3' },
  { content: 'La justicia social es la idea de que todas las personas deben tener acceso igualitario a los derechos, oportunidades y recursos dentro de una sociedad.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 3' },
  { content: 'Los movimientos sociales son grupos organizados de individuos que trabajan juntos para lograr un cambio social o político en una sociedad.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 3' },
  { content: 'El cambio climático es el cambio a largo plazo en los patrones climáticos de la Tierra, generalmente causado por actividades humanas como la quema de combustibles fósiles y la deforestación.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 3' },
  { content: 'Los recursos naturales son los materiales y sustancias que se encuentran en la naturaleza y que son valiosos para los seres humanos, como el aire, el agua, los minerales y los bosques.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 3' },
  { content: 'La gestión de recursos naturales es el proceso de administrar y conservar los recursos naturales para garantizar su uso sostenible y equitativo.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 3' },
  { content: 'La agricultura de subsistencia es un tipo de agricultura en el que las personas cultivan alimentos principalmente para alimentar a sus propias familias, con poco o ningún excedente para la venta.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 3' },
  #Nivel 4
  { content: 'La agricultura comercial es un tipo de agricultura en el que los productos agrícolas se cultivan principalmente para la venta en el mercado, en lugar de para el consumo personal.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 4' },
  { content: 'La desertificación es el proceso por el cual las tierras fértiles se vuelven desérticas debido a la sobreexplotación, la deforestación y otros factores ambientales.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 4' },
  { content: 'La deforestación es la eliminación de árboles y bosques para dar paso a otros usos de la tierra, como la agricultura, la ganadería y la urbanización.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 4' },
  { content: 'La contaminación del agua es la introducción de sustancias nocivas en cuerpos de agua como ríos, lagos y océanos, generalmente causada por actividades humanas como la industria y la agricultura.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 4' },
  { content: 'Los derechos de agua son los derechos legales o de propiedad sobre el uso de agua, que pueden ser otorgados o regulados por los gobiernos para garantizar su uso equitativo y sostenible.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 4' },
  { content: 'La seguridad alimentaria es la situación en la que todas las personas tienen acceso físico, social y económico a suficientes alimentos nutritivos para satisfacer sus necesidades dietéticas y preferencias alimentarias para una vida activa y saludable.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 4' },
  { content: 'La tierra cultivable es tierra apta y disponible para la agricultura, que puede ser utilizada para cultivar cultivos y criar ganado.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 4' },
  { content: 'La urbanización descontrolada es el crecimiento no planificado y no regulado de áreas urbanas, que puede llevar a problemas como la falta de vivienda, la congestión del tráfico y la contaminación ambiental.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 4' },
  #Nivel 5
  { content: 'La gestión de desastres naturales es el proceso de planificación, organización y coordinación de recursos para prepararse y responder a desastres naturales como terremotos, huracanes e inundaciones.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 5' },
  { content: 'La economía informal es el sector de la economía que está compuesto por actividades económicas no reguladas o no declaradas, como el trabajo informal y la venta ambulante.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 5' },
  { content: 'La migración interna es el movimiento de personas dentro de un país, generalmente desde áreas rurales a áreas urbanas en busca de empleo y oportunidades económicas.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 5' },
  { content: 'El desarrollo económico es el proceso de mejora de las condiciones económicas de un país o región, que puede medirse mediante indicadores como el crecimiento del PIB, la reducción de la pobreza y el aumento del empleo.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 5' },
  { content: 'La brecha de desarrollo es la diferencia en el desarrollo económico, social y humano entre países o regiones, que puede manifestarse en desigualdades en ingresos, acceso a servicios básicos y calidad de vida.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 5' },
  { content: 'Las remesas son el dinero que los trabajadores migrantes envían a sus familias en sus países de origen, generalmente para ayudar con los gastos de subsistencia y el desarrollo económico.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 5' },
  { content: 'La planificación urbana es el proceso de diseño y regulación del uso del suelo, la infraestructura y el desarrollo de las áreas urbanas para promover un crecimiento urbano sostenible y equitativo.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 5' },
  { content: 'La gentrificación inversa es el proceso por el cual áreas urbanas previamente gentrificadas experimentan una reversión demográfica y socioeconómica, atrayendo de nuevo a residentes de bajos ingresos y minorías étnicas.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 5' },
  #Nivel 6
  { content: 'La gobernanza urbana es el sistema de toma de decisiones y administración de recursos en áreas urbanas, que involucra a gobiernos locales, organizaciones comunitarias y sectores privados para abordar los desafíos urbanos.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 6' },
  { content: 'La desigualdad de género es la disparidad en el acceso, el control y los beneficios de los recursos y oportunidades entre hombres y mujeres, que puede manifestarse en áreas como la educación, el empleo y la representación política.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 6' },
  { content: 'La geografía electoral es el estudio de la distribución espacial de los votantes y los resultados electorales, así como los factores geográficos que influyen en el comportamiento político y la participación electoral.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 6' },
  { content: 'La gentrificación cultural es el proceso por el cual áreas urbanas experimentan un cambio en su composición étnica y cultural, a menudo resultando en la pérdida de identidad cultural y la expulsión de residentes de bajos ingresos y minorías étnicas.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 6' },
  { content: 'La gestión de residuos es el proceso de recolección, tratamiento y disposición final de los desechos sólidos y líquidos, con el objetivo de minimizar el impacto ambiental y promover el reciclaje y la reutilización.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 6' },
  { content: 'La migración forzada es el desplazamiento de personas de sus hogares debido a conflictos armados, persecución, desastres naturales u otras condiciones que ponen en peligro su seguridad y bienestar.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 6' },
  { content: 'La gestión del crecimiento urbano es el proceso de planificación y regulación del desarrollo físico y socioeconómico de las áreas urbanas, con el fin de garantizar un crecimiento equitativo y sostenible.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 6' },
  { content: 'La densidad de población es la medida de cuántas personas viven en un área determinada, generalmente expresada como el número de personas por kilómetro cuadrado o milla cuadrada.', topic: 'Geografía Física', level: 'Nivel Geografía Humana 6' },
  #Continentes
  #Nivel 1
  { content: 'El continente de África se encuentra mayormente en el hemisferio sur, extendiéndose desde el océano Atlántico en el oeste hasta el océano Índico en el este.', topic: 'Continentes', level: 'Nivel Continentes 1' },
  { content: 'El continente de América se extiende desde el océano Ártico en el norte hasta el océano Antártico en el sur, y desde el océano Atlántico en el este hasta el océano Pacífico en el oeste.', topic: 'Continentes', level: 'Nivel Continentes 1' },
  { content: 'El continente de Asia es el más grande y se encuentra en el hemisferio este, limitando al oeste con Europa y África, al sur con el océano Índico, al este con el océano Pacífico y al norte con el océano Ártico.', topic: 'Continentes', level: 'Nivel Continentes 1' },
  { content: 'El continente de Europa se encuentra principalmente en el hemisferio norte, limitada al norte por el océano Ártico, al oeste por el océano Atlántico, al sur por el mar Mediterráneo y al este por Asia.', topic: 'Continentes', level: 'Nivel Continentes 1' },
  { content: 'El continente de Oceanía se encuentra en el hemisferio sur, comprendiendo miles de islas dispersas por el océano Pacífico, incluyendo Australia y Nueva Zelanda.', topic: 'Continentes', level: 'Nivel Continentes 1' },
  { content: 'La Antártida se encuentra en el polo sur de la Tierra y está rodeada por el océano Austral.', topic: 'Continentes', level: 'Nivel Continentes 1' },
  { content: 'El continente de Australia se encuentra en el hemisferio sur, entre los océanos Índico y Pacífico, al sureste de Asia.', topic: 'Continentes', level: 'Nivel Continentes 1' },
  { content: 'El continente de América del Norte se encuentra en el hemisferio norte, limitando al norte con el océano Ártico, al este con el océano Atlántico, al oeste con el océano Pacífico y al sur con América Central.', topic: 'Continentes', level: 'Nivel Continentes 1' },
  #Nivel 2
  { content: 'El continente de Sudamérica se ubica en el hemisferio sur, limitando al oeste con el océano Pacífico, al este con el océano Atlántico, al norte con América Central y al sur con la Antártida.', topic: 'Continentes', level: 'Nivel Continentes 2' },
  { content: 'El continente de América Central se sitúa entre América del Norte y América del Sur, conectando los dos continentes y limitando al norte con el golfo de México y al sur con Colombia.', topic: 'Continentes', level: 'Nivel Continentes 2' },
  { content: 'Las islas del continente de América Central se encuentran principalmente en el mar Caribe y el océano Pacífico, formando un arco entre América del Norte y América del Sur.', topic: 'Continentes', level: 'Nivel Continentes 2' },
  { content: 'El continente de África del Norte se encuentra en el extremo norte del continente africano, limitando con el mar Mediterráneo al norte y con el Sáhara al sur.', topic: 'Continentes', level: 'Nivel Continentes 2' },
  { content: 'El continente de África del Sur se encuentra en el extremo sur del continente africano, comprendiendo países como Sudáfrica, Namibia y Botsuana.', topic: 'Continentes', level: 'Nivel Continentes 2' },
  { content: 'El continente de Asia Central se sitúa en la parte central de Asia, rodeada por Rusia al norte, China al este, Irán al sur y Asia del Sur al oeste.', topic: 'Continentes', level: 'Nivel Continentes 2' },
  { content: 'El continente de Asia del Sur se encuentra en el sur del continente asiático, limitando con el océano Índico al sur y con Asia Central y Asia del Este al norte.', topic: 'Continentes', level: 'Nivel Continentes 2' },
  { content: 'El continente de Asia del Este se sitúa en el este de Asia, limitando con el océano Pacífico al este y con Asia Central y Asia del Sur al oeste.', topic: 'Continentes', level: 'Nivel Continentes 2' },
  #Oceanos y Mares
  #Nivel 1
  { content: 'El Mar Mediterráneo se encuentra entre Europa, África y Asia, conectando con el océano Atlántico a través del estrecho de Gibraltar.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 1' },
  { content: 'El Mar de China Meridional se encuentra al sur de China, entre China continental, Taiwán, Vietnam, Malasia, Filipinas e Indonesia.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 1' },
  { content: 'El Mar Caribe está ubicado en el marco del océano Atlántico, al sureste del golfo de México y al norte de América del Sur.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 1' },
  { content: 'El Mar de Bering se sitúa entre Alaska y el extremo oriental de Rusia, conectando el océano Pacífico y el océano Ártico.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 1' },
  { content: 'El Mar de Tasmania se encuentra al sur de Australia, entre la isla de Tasmania y el continente australiano.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 1' },
  { content: 'El Mar del Norte se sitúa entre Gran Bretaña y Escandinavia, conectando el océano Atlántico con otros mares del norte de Europa.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 1' },
  { content: 'El Mar de Coral se encuentra al este de Australia, entre la Gran Barrera de Coral y la costa noreste de Queensland.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 1' },
  { content: 'El Mar de Java se sitúa entre las islas de Java y Sumatra, en Indonesia, conectando el océano Índico con el mar de China Meridional.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 1' },
  #Nivel 2
  { content: 'El Mar de Arabia se encuentra en el noroeste del océano Índico, entre la península arábiga y el subcontinente indio.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 2' },
  { content: 'El Mar de Filipinas se sitúa entre Filipinas y Taiwán, al este del mar de China Meridional.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 2' },
  { content: 'El Mar de Andamán se encuentra en el extremo oriental del océano Índico, entre la costa occidental de Tailandia, la península de Malasia y la isla de Andamán.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 2' },
  { content: 'El Mar de Ross se ubica en la Antártida, al sur del océano Pacífico y al este del mar de Weddell.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 2' },
  { content: 'El Mar de Weddell se encuentra en la Antártida, entre la península Antártica y el continente.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 2' },
  { content: 'El Mar de Amundsen se sitúa en la Antártida occidental, al sur del océano Pacífico y al oeste del mar de Ross.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 2' },
  { content: 'El Mar de Scotia se encuentra en el océano Atlántico sur, entre América del Sur y la península Antártica.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 2' },
  { content: 'El Mar de Irlanda se sitúa entre Irlanda y Gran Bretaña, conectando el océano Atlántico con el mar Céltico.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 2' },
  #Nivel 3
  { content: 'El Mar de Labrador se encuentra en la costa este de Canadá, entre la isla de Terranova y la región continental de Labrador.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 3' },
  { content: 'El Océano Pacífico es el océano más grande, extendiéndose desde el Ártico en el norte hasta el Antártico en el sur, y desde Asia y Australia en el este hasta América en el oeste.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 3' },
  { content: 'El Océano Atlántico se encuentra entre las Américas al oeste y Europa y África al este.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 3' },
  { content: 'El Mar Mediterráneo se encuentra entre Europa, África y Asia, conectando con el océano Atlántico a través del estrecho de Gibraltar.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 3' },
  { content: 'El Mar de China Meridional se encuentra al sur de China, entre China continental, Taiwán, Vietnam, Malasia, Filipinas e Indonesia.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 3' },
  { content: 'El Mar Caribe está ubicado en el marco del océano Atlántico, al sureste del golfo de México y al norte de América del Sur.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 3' },
  { content: 'El Mar de Bering se sitúa entre Alaska y el extremo oriental de Rusia, conectando el océano Pacífico y el océano Ártico.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 3' },
  { content: 'El Mar de Tasmania se encuentra al sur de Australia, entre la isla de Tasmania y el continente australiano.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 3' },
  #Nivel 4
  { content: 'El Mar del Norte se sitúa entre Gran Bretaña y Escandinavia, conectando el océano Atlántico con otros mares del norte de Europa.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 4' },
  { content: 'El Mar de Coral se encuentra al este de Australia, entre la Gran Barrera de Coral y la costa noreste de Queensland.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 4' },
  { content: 'El Mar de Java se sitúa entre las islas de Java y Sumatra, en Indonesia, conectando el océano Índico con el mar de China Meridional.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 4' },
  { content: 'El Mar de Arabia se encuentra en el noroeste del océano Índico, entre la península arábiga y el subcontinente indio.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 4' },
  { content: 'El Mar de Filipinas se sitúa entre Filipinas y Taiwán, al este del mar de China Meridional.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 4' },
  { content: 'El Mar de Andamán se encuentra en el extremo oriental del océano Índico, entre la costa occidental de Tailandia, la península de Malasia y la isla de Andamán.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 4' },
  { content: 'El Mar de Ross se ubica en la Antártida, al sur del océano Pacífico y al este del mar de Weddell.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 4' },
  { content: 'El Océano Atlántico se encuentra entre las Américas al oeste y Europa y África al este.', topic: 'Océanos y Mares', level: 'Nivel Océanos y Mares 4' },
  #Capitales
  #Nivel 1
  { content: 'Washington D.C. es la capital de Estados Unidos.', topic: 'Capitales', level: 'Nivel Capitales 1' },
  { content: 'Pekin es la capital de China.', topic: 'Capitales', level: 'Nivel Capitales 1' },
  { content: 'Nueva Delhi es la capital de India.', topic: 'Capitales', level: 'Nivel Capitales 1' },
  { content: 'Moscú es la capital de Rusia.', topic: 'Capitales', level: 'Nivel Capitales 1' },
  { content: 'Brasilia es la capital de Brasil.', topic: 'Capitales', level: 'Nivel Capitales 1' },
  { content: 'Tokio es la capital de Japón.', topic: 'Capitales', level: 'Nivel Capitales 1' },
  { content: 'Berlín es la capital de Alemania.', topic: 'Capitales', level: 'Nivel Capitales 1' },
  { content: 'Londres es la capital de Reino Unido.', topic: 'Capitales', level: 'Nivel Capitales 1' },
  #Nivel 2
  { content: 'París es la capital de Francia.', topic: 'Capitales', level: 'Nivel Capitales 2' },
  { content: 'Ciudad de México es la capital de México.', topic: 'Capitales', level: 'Nivel Capitales 2' },
  { content: 'Roma es la capital de Italia.', topic: 'Capitales', level: 'Nivel Capitales 2' },
  { content: 'Ottawa es la capital de Canadá.', topic: 'Capitales', level: 'Nivel Capitales 2' },
  { content: 'Seúl es la capital de Corea del Sur.', topic: 'Capitales', level: 'Nivel Capitales 2' },
  { content: 'Madrid es la capital de España.', topic: 'Capitales', level: 'Nivel Capitales 2' },
  { content: 'Camberra es la capital de Australia.', topic: 'Capitales', level: 'Nivel Capitales 2' },
  { content: 'Yakarta es la capital de Indonesia.', topic: 'Capitales', level: 'Nivel Capitales 2' },
  #Nivel 3
  { content: 'Ámsterdam es la capital de Países Bajos.', topic: 'Capitales', level: 'Nivel Capitales 3' },
  { content: 'Riad es la capital de Arabia Saudita.', topic: 'Capitales', level: 'Nivel Capitales 3' },
  { content: 'Ankara es la capital de Turquía.', topic: 'Capitales', level: 'Nivel Capitales 3' },
  { content: 'Buenos Aires es la capital de Argentina.', topic: 'Capitales', level: 'Nivel Capitales 3' },
  { content: 'Pretoria es la capital de Sudáfrica.', topic: 'Capitales', level: 'Nivel Capitales 3' },
  { content: 'Abuja es la capital de Nigeria.', topic: 'Capitales', level: 'Nivel Capitales 3' },
  { content: 'El Cairo es la capital de Egipto.', topic: 'Capitales', level: 'Nivel Capitales 3' },
  { content: 'Islamabad es la capital de Pakistán.', topic: 'Capitales', level: 'Nivel Capitales 3' },
  #Nivel 4
  { content: 'Teherán es la capital de Irán.', topic: 'Capitales', level: 'Nivel Capitales 4' },
  { content: 'Hanói es la capital de Vietnam.', topic: 'Capitales', level: 'Nivel Capitales 4' },
  { content: 'Bangkok es la capital de Tailandia.', topic: 'Capitales', level: 'Nivel Capitales 4' },
  { content: 'Varsovia es la capital de Polonia.', topic: 'Capitales', level: 'Nivel Capitales 4' },
  { content: 'Bogotá es la capital de Colombia.', topic: 'Capitales', level: 'Nivel Capitales 4' },
  { content: 'Caracas es la capital de Venezuela.', topic: 'Capitales', level: 'Nivel Capitales 4' },
  { content: 'Kuala Lumpur es la capital de Malasia.', topic: 'Capitales', level: 'Nivel Capitales 4' },
  { content: 'Manila es la capital de Filipinas.', topic: 'Capitales', level: 'Nivel Capitales 4' },
  #Nivel 5
  { content: 'Daca es la capital de Bangladesh.', topic: 'Capitales', level: 'Nivel Capitales 5' },
  { content: 'Kiev es la capital de Ucrania.', topic: 'Capitales', level: 'Nivel Capitales 5' },
  { content: 'Jartum es la capital de Sudán.', topic: 'Capitales', level: 'Nivel Capitales 5' },
  { content: 'Rabat es la capital de Marruecos.', topic: 'Capitales', level: 'Nivel Capitales 5' },
  { content: 'Nairobi es la capital de Kenia.', topic: 'Capitales', level: 'Nivel Capitales 5' },
  { content: 'Lima es la capital de Perú.', topic: 'Capitales', level: 'Nivel Capitales 5' },
  { content: 'Santiago es la capital de Chile.', topic: 'Capitales', level: 'Nivel Capitales 5' },
  { content: 'Estocolmo es la capital de Suecia.', topic: 'Capitales', level: 'Nivel Capitales 5' },
  #Nivel 6
  { content: 'Berna es la capital de Suiza.', topic: 'Capitales', level: 'Nivel Capitales 6' },
  { content: 'Bruselas es la capital de Bélgica.', topic: 'Capitales', level: 'Nivel Capitales 6' },
  { content: 'Viena es la capital de Austria.', topic: 'Capitales', level: 'Nivel Capitales 6' },
  { content: 'Oslo es la capital de Noruega.', topic: 'Capitales', level: 'Nivel Capitales 6' },
  { content: 'Jerusalén es la capital de Israel.', topic: 'Capitales', level: 'Nivel Capitales 6' },
  { content: 'Acra es la capital de Ghana.', topic: 'Capitales', level: 'Nivel Capitales 6' },
  { content: 'Dublín es la capital de Irlanda.', topic: 'Capitales', level: 'Nivel Capitales 6' },
  { content: 'Helsinki es la capital de Finlandia.', topic: 'Capitales', level: 'Nivel Capitales 6' },
  #Geografia Politica
  #Nivel 1
  { content: 'Un país es una entidad política soberana con un territorio definido y un gobierno.', topic: 'Geografía Política', level: 'Nivel Geografía Política 1' },
  { content: 'Una frontera es una línea imaginaria que separa dos países.', topic: 'Geografía Política', level: 'Nivel Geografía Política 1' },
  { content: 'La diplomacia es el proceso de manejar las relaciones internacionales entre países mediante la negociación y el diálogo.', topic: 'Geografía Política', level: 'Nivel Geografía Política 1' },
  { content: 'Una monarquía es un sistema de gobierno en el que un monarca es la cabeza de estado.', topic: 'Geografía Política', level: 'Nivel Geografía Política 1' },
  { content: 'La función de un tratado es regular las relaciones entre países.', topic: 'Geografía Política', level: 'Nivel Geografía Política 1' },
  { content: 'La independencia es el estado de libertad y autonomía política de un país o territorio.', topic: 'Geografía Política', level: 'Nivel Geografía Política 1' },
  { content: 'Una alianza es una asociación entre dos o más países con el objetivo de cooperar en áreas específicas de interés común.', topic: 'Geografía Política', level: 'Nivel Geografía Política 1' },
  { content: 'La colonización es el proceso de establecer y controlar territorios por parte de una potencia extranjera.', topic: 'Geografía Política', level: 'Nivel Geografía Política 1' },
  #Nivel 2
  { content: 'Una organización internacional es una entidad formada por países soberanos que trabajan juntos para abordar problemas globales y promover la cooperación internacional.', topic: 'Geografía Política', level: 'Nivel Geografía Política 2' },
  { content: 'El nacionalismo es la ideología que promueve la identidad y los intereses de una nación, a menudo asociada con la aspiración de autodeterminación y soberanía.', topic: 'Geografía Política', level: 'Nivel Geografía Política 2' },
  { content: 'Un gobierno democrático es un sistema de gobierno en el que el poder político es ejercido por el pueblo a través de elecciones libres y justas.', topic: 'Geografía Política', level: 'Nivel Geografía Política 2' },
  { content: 'La descolonización es el proceso de liberación de los territorios coloniales y la adquisición de la independencia política.', topic: 'Geografía Política', level: 'Nivel Geografía Política 2' },
  { content: 'Un embargo es una prohibición oficial impuesta por un país para detener el comercio con otro país como medida de presión política o económica.', topic: 'Geografía Política', level: 'Nivel Geografía Política 2' },
  { content: 'El derecho internacional es el conjunto de normas y principios que regulan las relaciones entre países y otras entidades internacionales.', topic: 'Geografía Política', level: 'Nivel Geografía Política 2' },
  { content: 'La soberanía es el principio de autoridad política y territorial de un estado independiente.', topic: 'Geografía Política', level: 'Nivel Geografía Política 2' },
  { content: 'Un gobierno totalitario es un sistema político en el que el gobierno tiene control absoluto sobre todos los aspectos de la vida pública y privada de los ciudadanos.', topic: 'Geografía Política', level: 'Nivel Geografía Política 2' },
  #Nivel 3
  { content: 'Un refugiado es una persona que ha sido obligada a abandonar su país de origen debido a conflictos, persecución o violaciones de los derechos humanos.', topic: 'Geografía Política', level: 'Nivel Geografía Política 3' },
  { content: 'La autodeterminación es el derecho de los pueblos a decidir su propio estatus político y a determinar libremente su propia forma de gobierno.', topic: 'Geografía Política', level: 'Nivel Geografía Política 3' },
  { content: 'La diplomacia pública son los esfuerzos de un gobierno para comunicarse y promover sus políticas y valores en el extranjero, dirigidos a la opinión pública internacional.', topic: 'Geografía Política', level: 'Nivel Geografía Política 3' },
  { content: 'Un golpe de Estado es la toma violenta o ilegal del poder político por parte de un grupo dentro del gobierno.', topic: 'Geografía Política', level: 'Nivel Geografía Política 3' },
  { content: 'La asamblea general de las Naciones Unidas es el principal órgano deliberativo y representativo de las Naciones Unidas, compuesto por todos los estados miembros.', topic: 'Geografía Política', level: 'Nivel Geografía Política 3' },
  { content: 'El sistema de partido único es un sistema político en el que solo un partido político está legalmente autorizado para gobernar y monopoliza el poder político.', topic: 'Geografía Política', level: 'Nivel Geografía Política 3' },
  { content: 'La geopolítica es el estudio de la influencia de factores geográficos en la política internacional y las relaciones internacionales.', topic: 'Geografía Política', level: 'Nivel Geografía Política 3' },
  { content: 'El tratado de libre comercio es un acuerdo entre dos o más países para eliminar barreras comerciales y promover el intercambio de bienes y servicios sin aranceles ni cuotas.', topic: 'Geografía Política', level: 'Nivel Geografía Política 3' },
  #Nivel 4
  { content: 'La democracia representativa es un sistema político en el que los ciudadanos eligen representantes para que tomen decisiones en su nombre en el gobierno.', topic: 'Geografía Política', level: 'Nivel Geografía Política 4' },
  { content: 'Una cumbre internacional es una reunión de líderes y representantes de varios países para discutir y tomar decisiones sobre temas de interés común.', topic: 'Geografía Política', level: 'Nivel Geografía Política 4' },
  { content: 'Una asamblea constituyente es un cuerpo legislativo especial encargado de redactar o revisar una constitución para un país o territorio.', topic: 'Geografía Política', level: 'Nivel Geografía Política 4' },
  { content: 'El gobierno de coalición es un gobierno formado por dos o más partidos políticos que trabajan juntos para formar una mayoría en el parlamento y gobernar el país.', topic: 'Geografía Política', level: 'Nivel Geografía Política 4' },
  { content: 'La neutralidad es la política de un país de no tomar partido en conflictos internacionales y mantenerse imparcial.', topic: 'Geografía Política', level: 'Nivel Geografía Política 4' },
  { content: 'El federalismo es un sistema de gobierno en el que el poder está dividido entre un gobierno central y unidades políticas más pequeñas, como estados o provincias.', topic: 'Geografía Política', level: 'Nivel Geografía Política 4' },
  { content: 'El imperialismo es la política de extender el control o la influencia de una nación sobre territorios extranjeros mediante la colonización, la conquista o la dominación económica.', topic: 'Geografía Política', level: 'Nivel Geografía Política 4' },
  { content: 'Un bloque regional es una asociación de países en una región geográfica que se unen para promover la cooperación económica y política.', topic: 'Geografía Política', level: 'Nivel Geografía Política 4' },
  #Nivel 5
  { content: 'La insurgencia es la rebelión armada de un grupo contra un gobierno establecido, a menudo por motivos políticos o sociales.', topic: 'Geografía Política', level: 'Nivel Geografía Política 5' },
  { content: 'Un estado fallido es un país que ha perdido el control efectivo sobre su territorio y no puede mantener el orden interno ni brindar servicios básicos a su población.', topic: 'Geografía Política', level: 'Nivel Geografía Política 5' },
  { content: 'La anexión territorial es el acto de agregar un territorio a otro país mediante la conquista, el tratado o la ocupación militar.', topic: 'Geografía Política', level: 'Nivel Geografía Política 5' },
  { content: 'El sufragio universal es el derecho de todos los ciudadanos adultos a votar en elecciones políticas.', topic: 'Geografía Política', level: 'Nivel Geografía Política 5' },
  { content: 'La constitución es un conjunto de principios y leyes fundamentales que establecen la estructura del gobierno y los derechos de los ciudadanos en un país.', topic: 'Geografía Política', level: 'Nivel Geografía Política 5' },
  { content: 'La geopolítica energética es el estudio de las relaciones entre el poder político y los recursos energéticos, como el petróleo y el gas natural, a nivel nacional e internacional.', topic: 'Geografía Política', level: 'Nivel Geografía Política 5' },
  { content: 'La guerra fría fue el período de tensión política y confrontación ideológica entre los Estados Unidos y la Unión Soviética después de la Segunda Guerra Mundial, sin un conflicto militar directo.', topic: 'Geografía Política', level: 'Nivel Geografía Política 5' },
  { content: 'Un bloqueo económico es una medida coercitiva en la que un país restringe o prohíbe el comercio con otro país como forma de presión política o económica.', topic: 'Geografía Política', level: 'Nivel Geografía Política 5' },
  #Nivel 6
  { content: 'La soberanía nacional es el principio de autoridad política y autonomía de un estado en su territorio, sin interferencia externa.', topic: 'Geografía Política', level: 'Nivel Geografía Política 6' },
  { content: 'La legislatura es el cuerpo legislativo encargado de hacer leyes en un país o estado.', topic: 'Geografía Política', level: 'Nivel Geografía Política 6' },
  { content: 'La economía de mercado es un sistema económico en el que los precios de los bienes y servicios son determinados por la oferta y la demanda en el mercado, con una mínima interferencia del gobierno.', topic: 'Geografía Política', level: 'Nivel Geografía Política 6' },
  { content: 'El apartheid fue el sistema de segregación racial y discriminación institucionalizada que existió en Sudáfrica entre 1948 y 1994.', topic: 'Geografía Política', level: 'Nivel Geografía Política 6' },
  { content: 'La globalización es el proceso de interconexión e interdependencia creciente entre las economías, las sociedades y las culturas a nivel mundial.', topic: 'Geografía Política', level: 'Nivel Geografía Política 6' },
  { content: 'El nacionalismo étnico es la identificación y lealtad hacia un grupo étnico particular como base de la identidad nacional y política.', topic: 'Geografía Política', level: 'Nivel Geografía Política 6' },
  { content: 'La diplomacia multilateral es el proceso de negociación y cooperación entre tres o más países para abordar problemas y desafíos comunes.', topic: 'Geografía Política', level: 'Nivel Geografía Política 6' },
  { content: 'Un referéndum es una votación en la que los ciudadanos expresan su opinión sobre una cuestión específica, generalmente de importancia nacional.', topic: 'Geografía Política', level: 'Nivel Geografía Política 6' },
  #Banderas
  #Nivel 1
  { content: 'Esta bandera le pertenece a Argentina', topic: 'Banderas', level: 'Nivel Banderas 1', imagepath: 'images/flags/ar.svg' },
  { content: 'Esta bandera le pertenece a Bolivia', topic: 'Banderas', level: 'Nivel Banderas 1', imagepath: 'images/flags/bo.svg' },
  { content: 'Esta bandera le pertenece a Brasil', topic: 'Banderas', level: 'Nivel Banderas 1', imagepath: 'images/flags/br.svg' },
  { content: 'Esta bandera le pertenece a Canadá', topic: 'Banderas', level: 'Nivel Banderas 1', imagepath: 'images/flags/ca.svg' },
  { content: 'Esta bandera le pertenece a Chile', topic: 'Banderas', level: 'Nivel Banderas 1', imagepath: 'images/flags/cl.svg' },
  { content: 'Esta bandera le pertenece a China', topic: 'Banderas', level: 'Nivel Banderas 1', imagepath: 'images/flags/cn.svg' },
  { content: 'Esta bandera le pertenece a Colombia', topic: 'Banderas', level: 'Nivel Banderas 1', imagepath: 'images/flags/co.svg' },
  { content: 'Esta bandera le pertenece a Costa Rica', topic: 'Banderas', level: 'Nivel Banderas 1', imagepath: 'images/flags/cr.svg' },
  #Nivel 2
  { content: 'Esta bandera le pertenece a Croacia', topic: 'Banderas', level: 'Nivel Banderas 2', imagepath: 'images/flags/hr.svg' },
  { content: 'Esta bandera le pertenece a Cuba', topic: 'Banderas', level: 'Nivel Banderas 2', imagepath: 'images/flags/cu.svg' },
  { content: 'Esta bandera le pertenece a Ecuador', topic: 'Banderas', level: 'Nivel Banderas 2', imagepath: 'images/flags/ec.svg' },
  { content: 'Esta bandera le pertenece a Francia', topic: 'Banderas', level: 'Nivel Banderas 2', imagepath: 'images/flags/fr.svg' },
  { content: 'Esta bandera le pertenece a Alemania', topic: 'Banderas', level: 'Nivel Banderas 2', imagepath: 'images/flags/de.svg' },
  { content: 'Esta bandera le pertenece a Italia', topic: 'Banderas', level: 'Nivel Banderas 2', imagepath: 'images/flags/it.svg' },
  { content: 'Esta bandera le pertenece a Japón', topic: 'Banderas', level: 'Nivel Banderas 2', imagepath: 'images/flags/jp.svg' },
  { content: 'Esta bandera le pertenece a México', topic: 'Banderas', level: 'Nivel Banderas 2', imagepath: 'images/flags/mx.svg' },
  #Nivel 3
  { content: 'Esta bandera le pertenece a Portugal', topic: 'Banderas', level: 'Nivel Banderas 3', imagepath: 'images/flags/pt.svg' },
  { content: 'Esta bandera le pertenece a Perú', topic: 'Banderas', level: 'Nivel Banderas 3', imagepath: 'images/flags/pe.svg' },
  { content: 'Esta bandera le pertenece a España', topic: 'Banderas', level: 'Nivel Banderas 3', imagepath: 'images/flags/es.svg' },
  { content: 'Esta bandera le pertenece a Uruguay', topic: 'Banderas', level: 'Nivel Banderas 3', imagepath: 'images/flags/uy.svg' },
  { content: 'Esta bandera le pertenece a Reino Unido', topic: 'Banderas', level: 'Nivel Banderas 3', imagepath: 'images/flags/gb.svg' },
  { content: 'Esta bandera le pertenece a Estados Unidos de América', topic: 'Banderas', level: 'Nivel Banderas 3', imagepath: 'images/flags/us.svg' },
  { content: 'Esta bandera le pertenece a Venezuela', topic: 'Banderas', level: 'Nivel Banderas 3', imagepath: 'images/flags/ve.svg' },
  { content: 'Esta bandera le pertenece a Paraguay', topic: 'Banderas', level: 'Nivel Banderas 3', imagepath: 'images/flags/py.svg' },
  #Nivel 4
  { content: 'Esta bandera le pertenece a Puerto Rico', topic: 'Banderas', level: 'Nivel Banderas 4', imagepath: 'images/flags/pr.svg' },
  { content: 'Esta bandera le pertenece a Honduras', topic: 'Banderas', level: 'Nivel Banderas 4', imagepath: 'images/flags/hn.svg' },
  { content: 'Esta bandera le pertenece a Argelia', topic: 'Banderas', level: 'Nivel Banderas 4', imagepath: 'images/flags/dz.svg' },
  { content: 'Esta bandera le pertenece a Bélgica', topic: 'Banderas', level: 'Nivel Banderas 4', imagepath: 'images/flags/be.svg' },
  { content: 'Esta bandera le pertenece a Bosnia y Herzegovina', topic: 'Banderas', level: 'Nivel Banderas 4', imagepath: 'images/flags/ba.svg' },
  { content: 'Esta bandera le pertenece a Camerún', topic: 'Banderas', level: 'Nivel Banderas 4', imagepath: 'images/flags/cm.svg' },
  { content: 'Esta bandera le pertenece a Dominica', topic: 'Banderas', level: 'Nivel Banderas 4', imagepath: 'images/flags/dm.svg' },
  { content: 'Esta bandera le pertenece a República Dominicana', topic: 'Banderas', level: 'Nivel Banderas 4', imagepath: 'images/flags/do.svg' },
  #Nivel 5
  { content: 'Esta bandera le pertenece a El Salvador', topic: 'Banderas', level: 'Nivel Banderas 5', imagepath: 'images/flags/sv.svg' },
  { content: 'Esta bandera le pertenece a Finlandia', topic: 'Banderas', level: 'Nivel Banderas 5', imagepath: 'images/flags/fi.svg' },
  { content: 'Esta bandera le pertenece a Ghana', topic: 'Banderas', level: 'Nivel Banderas 5', imagepath: 'images/flags/gh.svg' },
  { content: 'Esta bandera le pertenece a Grecia', topic: 'Banderas', level: 'Nivel Banderas 5', imagepath: 'images/flags/gr.svg' },
  { content: 'Esta bandera le pertenece a Guatemala', topic: 'Banderas', level: 'Nivel Banderas 5', imagepath: 'images/flags/gt.svg' },
  { content: 'Esta bandera le pertenece a India', topic: 'Banderas', level: 'Nivel Banderas 5', imagepath: 'images/flags/in.svg' },
  { content: 'Esta bandera le pertenece a Irán', topic: 'Banderas', level: 'Nivel Banderas 5', imagepath: 'images/flags/ir.svg' },
  { content: 'Esta bandera le pertenece a Israel', topic: 'Banderas', level: 'Nivel Banderas 5', imagepath: 'images/flags/il.svg' },
  #Nivel 
  { content: 'Esta bandera le pertenece a Jamaica', topic: 'Banderas', level: 'Nivel Banderas 6', imagepath: 'images/flags/jm.svg' },
  { content: 'Esta bandera le pertenece a Países Bajos', topic: 'Banderas', level: 'Nivel Banderas 6', imagepath: 'images/flags/nl.svg' },
  { content: 'Esta bandera le pertenece a Nueva Zelanda', topic: 'Banderas', level: 'Nivel Banderas 6', imagepath: 'images/flags/nz.svg' },
  { content: 'Esta bandera le pertenece a Nicaragua', topic: 'Banderas', level: 'Nivel Banderas 6', imagepath: 'images/flags/ni.svg' },
  { content: 'Esta bandera le pertenece a Nigeria', topic: 'Banderas', level: 'Nivel Banderas 6', imagepath: 'images/flags/ng.svg' },
  { content: 'Esta bandera le pertenece a Polonia', topic: 'Banderas', level: 'Nivel Banderas 6', imagepath: 'images/flags/pl.svg' },
  { content: 'Esta bandera le pertenece a Rusia', topic: 'Banderas', level: 'Nivel Banderas 6', imagepath: 'images/flags/ru.svg' },
  { content: 'Esta bandera le pertenece a Arabia Saudita', topic: 'Banderas', level: 'Nivel Banderas 6', imagepath: 'images/flags/sa.svg' }
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

materials_data.each do |m_data|
  topic = Topic.find_or_create_by(topic: m_data[:topic])
  level = Level.find_or_create_by(name: m_data[:level])

  material_attributes = {
    content: m_data[:content],
    level_id: level.id,
    topic_id: topic.id
  }

  material_attributes[:imagepath] = m_data[:imagepath] if m_data[:imagepath]

  Material.find_or_create_by(material_attributes)
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