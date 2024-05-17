require './app'
require './models/topic'
require './models/question'
require './models/option'
require './models/qa'

Qa.destroy_all
Question.destroy_all
Option.destroy_all
Topic.destroy_all   

topics_data = [
  { topic: 'Flags' },
  { topic: 'Physical Geography' },
  { topic: 'Human Geography' },
  { topic: 'Continents and Oceans' },
  { topic: 'Capitals' },
  { topic: 'Political Geography' }
]


topics_data.each { |data| Topic.find_or_create_by(topic: data[:topic]) }

questions_data = [
  { question: '¿Qué caracteriza a un país?', correct_option: 'Una entidad territorial y política', topic: 'Physical Geography' },
  { question: '¿Qué es un volcán?', correct_option: 'Una montaña o colina formada por la acumulación de materiales expulsados desde el interior de la Tierra', topic: 'Physical Geography' },
  { question: '¿Cuál es la función de una capital?', correct_option: 'Servir como centro administrativo y político de un país o estado', topic: 'Physical Geography' },
  { question: '¿Qué caracteriza a un desierto?', correct_option: 'Una región árida y seca con poca o ninguna vegetación y poca precipitación', topic: 'Physical Geography' },
  { question: '¿Qué es un istmo?', correct_option: 'Una franja estrecha de tierra que conecta dos áreas de tierra más grandes y está rodeada por agua en ambos lados', topic: 'Physical Geography' },
  { question: '¿Cuál es la característica principal de un archipiélago?', correct_option: 'Un grupo o conjunto de islas cercanas entre sí en un cuerpo de agua', topic: 'Physical Geography' },
  { question: '¿Qué es un golfo?', correct_option: 'Una porción de océano o mar parcialmente rodeada por tierra', topic: 'Physical Geography' },
  { question: '¿Cuál es la definición de una isla?', correct_option: 'Una masa de tierra rodeada completamente por agua', topic: 'Physical Geography' },
  { question: '¿Qué es un río?', correct_option: 'Una corriente natural de agua que fluye en una dirección específica a través de la superficie terrestre', topic: 'Physical Geography' },
  { question: '¿Cuál de los siguientes es un ejemplo de continente?', correct_option: 'Asia', topic: 'Physical Geography' },
  { question: '¿Qué es la población de un área geográfica?', correct_option: 'El número total de personas que viven en esa área', topic: 'Human Geography' },
  { question: '¿Qué es la cultura en geografía humana?', correct_option: 'Las tradiciones y creencias compartidas por un grupo de personas', topic: 'Human Geography' },
  { question: '¿Qué es la urbanización?', correct_option: 'El proceso de crecimiento y expansión de áreas urbanas', topic: 'Human Geography' },
  { question: '¿Qué es la globalización?', correct_option: 'La integración de las economías, las culturas y las sociedades a nivel mundial', topic: 'Human Geography' },
  { question: '¿Qué estudia la demografía?', correct_option: 'El estudio de las características poblacionales, como el tamaño y la distribución de la población', topic: 'Human Geography' },
  { question: '¿Qué es la industrialización?', correct_option: 'El proceso de transformar una sociedad basada en la agricultura en una sociedad basada en la industria', topic: 'Human Geography' },
  { question: '¿Qué es la pobreza?', correct_option: 'La falta de acceso a recursos básicos como alimentos, vivienda y educación', topic: 'Human Geography' },
  { question: '¿Qué es la diversidad cultural?', correct_option: 'La variedad de grupos étnicos, religiosos y culturales que coexisten en una sociedad', topic: 'Human Geography' },
  { question: '¿Qué es la gentrificación?', correct_option: 'El proceso de renovación urbana que a menudo resulta en el desplazamiento de residentes de bajos ingresos', topic: 'Human Geography' },
  { question: '¿Qué es la migración?', correct_option: 'El movimiento de personas de un lugar a otro con el propósito de establecerse temporal o permanentemente en un nuevo lugar', topic: 'Human Geography' },
  { question: '¿Dónde se encuentra principalmente el continente de África?', correct_option: 'Mayormente en el hemisferio sur, extendiéndose desde el océano Atlántico en el oeste hasta el océano Índico en el este.', topic: 'Continents and Oceans' },
  { question: '¿Cuál es la ubicación del continente de América?', correct_option: 'Se extiende desde el océano Ártico en el norte hasta el océano Antártico en el sur, y desde el océano Atlántico en el este hasta el océano Pacífico en el oeste.', topic: 'Continents and Oceans' },
  { question: '¿Dónde se encuentra el continente de Asia?', correct_option: 'Es el continente más grande y se encuentra en el hemisferio este, limitando al oeste con Europa y África, al sur con el océano Índico, al este con el océano Pacífico y al norte con el océano Ártico.', topic: 'Continents and Oceans' },
  { question: '¿Qué caracteriza la ubicación del continente de Europa?', correct_option: 'Principalmente en el hemisferio norte, limitada al norte por el océano Ártico, al oeste por el océano Atlántico, al sur por el mar Mediterráneo y al este por Asia.', topic: 'Continents and Oceans' },
  { question: '¿Dónde se ubica el continente de Oceanía?', correct_option: 'En el hemisferio sur, comprendiendo miles de islas dispersas por el océano Pacífico, incluyendo Australia y Nueva Zelanda.', topic: 'Continents and Oceans' },
  { question: '¿Cuál es la ubicación de la Antártida?', correct_option: 'Se encuentra en el polo sur de la Tierra y está rodeada por el océano Austral.', topic: 'Continents and Oceans' },
  { question: '¿Cuál es la ubicación geográfica del Océano Pacífico?', correct_option: 'Es el océano más grande, extendiéndose desde el Ártico en el norte hasta el Antártico en el sur, y desde Asia y Australia en el este hasta América en el oeste.', topic: 'Continents and Oceans' },
  { question: '¿Dónde se encuentra el Océano Atlántico?', correct_option: 'Entre las Américas al oeste y Europa y África al este.', topic: 'Continents and Oceans' },
  { question: '¿Qué caracteriza la ubicación del Océano Índico?', correct_option: 'Está ubicado entre África, Asia, Australia y la Antártida, siendo el tercer océano más grande del mundo.', topic: 'Continents and Oceans' },
  { question: '¿Cuál es la ubicación del Océano Ártico?', correct_option: 'Es el océano más pequeño y se encuentra en la región polar del norte, rodeado por América del Norte, Asia y Europa.', topic: 'Continents and Oceans' },
  { question: '¿Dónde está ubicado el Océano Antártico?', correct_option: 'Rodea la Antártida en el polo sur de la Tierra.', topic: 'Continents and Oceans' },
  { question: '¿Cuál es la capital de Estados Unidos?', correct_option: 'Washington D.C.', topic: 'Capitals' },
  { question: '¿Cuál es la capital de China?', correct_option: 'Pekín', topic: 'Capitals' },
  { question: '¿Cuál es la capital de India?', correct_option: 'Nueva Delhi', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Rusia?', correct_option: 'Moscú', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Brasil?', correct_option: 'Brasilia', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Japón?', correct_option: 'Tokio', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Alemania?', correct_option: 'Berlín', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Reino Unido?', correct_option: 'Londres', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Francia?', correct_option: 'París', topic: 'Capitals' },
  { question: '¿Cuál es la capital de México?', correct_option: 'Ciudad de México', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Italia?', correct_option: 'Roma', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Canadá?', correct_option: 'Ottawa', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Corea del Sur?', correct_option: 'Seúl', topic: 'Capitals' },
  { question: '¿Cuál es la capital de España?', correct_option: 'Madrid', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Australia?', correct_option: 'Camberra', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Indonesia?', correct_option: 'Yakarta', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Países Bajos?', correct_option: 'Ámsterdam', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Arabia Saudita?', correct_option: 'Riad', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Turquía?', correct_option: 'Ankara', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Argentina?', correct_option: 'Buenos Aires', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Sudáfrica?', correct_option: 'Pretoria', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Nigeria?', correct_option: 'Abuja', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Egipto?', correct_option: 'El Cairo', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Pakistán?', correct_option: 'Islamabad', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Irán?', correct_option: 'Teherán', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Vietnam?', correct_option: 'Hanói', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Tailandia?', correct_option: 'Bangkok', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Polonia?', correct_option: 'Varsovia', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Colombia?', correct_option: 'Bogotá', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Venezuela?', correct_option: 'Caracas', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Malasia?', correct_option: 'Kuala Lumpur', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Filipinas?', correct_option: 'Manila', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Bangladesh?', correct_option: 'Daca', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Ucrania?', correct_option: 'Kiev', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Sudán?', correct_option: 'Jartum', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Marruecos?', correct_option: 'Rabat', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Kenia?', correct_option: 'Nairobi', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Perú?', correct_option: 'Lima', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Chile?', correct_option: 'Santiago', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Suecia?', correct_option: 'Estocolmo', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Suiza?', correct_option: 'Berna', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Bélgica?', correct_option: 'Bruselas', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Austria?', correct_option: 'Viena', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Noruega?', correct_option: 'Oslo', topic: 'Capitals' },
  { question: '¿Cuál es la capital de Israel?', correct_option: 'Jerusalén', topic: 'Capitals' },
  { question: '¿Qué es un país?', correct_option: 'Una entidad política soberana con un territorio definido y un gobierno', topic: 'Political Geography' },
  { question: '¿Qué es una frontera?', correct_option: 'Una línea imaginaria que separa dos países', topic: 'Political Geography' },
  { question: '¿Qué es la diplomacia?', correct_option: 'El proceso de manejar las relaciones internacionales entre países mediante la negociación y el diálogo', topic: 'Political Geography' },
  { question: '¿Qué es una monarquía?', correct_option: 'Un sistema de gobierno en el que un monarca es la cabeza de estado', topic: 'Political Geography' },
  { question: '¿Cuál es la función de un tratado?', correct_option: 'Regular las relaciones entre países', topic: 'Political Geography' },
  { question: '¿Qué es la independencia?', correct_option: 'El estado de libertad y autonomía política de un país o territorio', topic: 'Political Geography' },
  { question: '¿Qué es una alianza?', correct_option: 'Una asociación entre dos o más países con el objetivo de cooperar en áreas específicas de interés común', topic: 'Political Geography' },
  { question: '¿Qué es la colonización?', correct_option: 'El proceso de establecer y controlar territorios por parte de una potencia extranjera', topic: 'Political Geography' },
  { question: '¿Qué es una organización internacional?', correct_option: 'Una entidad formada por países soberanos que trabajan juntos para abordar problemas globales y promover la cooperación internacional', topic: 'Political Geography' }
]

options_data = [
  { response: 'Blue', topic: 'Flags' },
  { response: 'Green', topic: 'Flags' },
  { response: 'White', topic: 'Flags' },
  { response: 'Atlantic Ocean', topics: 'Continents and Oceans' },
]

options_data.each do |o_data| 
  topic = Topic.find_by(topic: o_data[:topic])
  next unless topic

  Option.find_or_create_by(response: o_data[:response], topics_id: topic.id)
end

questions_data.each do |q_data|
  topic = Topic.find_by(topic: q_data[:topic])
  next unless topic

  question = Question.create!(question: q_data[:question], topics_id: topic.id)

  correct_option = Option.find_or_create_by(response: q_data[:correct_option], topics_id: topic.id)
  Qa.create!(questions_id: question.id, options_id: correct_option.id)
end
