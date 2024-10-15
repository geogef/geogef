# frozen_string_literal: true

module QuestionHelpers
  def render_new_question
    @topics = Topic.all
    erb :new_question, locals: { error: 'Failed to create question.' }
  end

  def save_image(params, topic_id)
    return nil unless Topic.find(topic_id).topic == 'Banderas' && params['image'][:filename].end_with?('.svg')

    filename = params['image'][:filename]
    file = params['image'][:tempfile]
    image_folder = './public/images/flags'
    filepath = "#{image_folder}/#{filename}"

    File.open(filepath, 'wb') do |f|
      f.write(file.read)
    end

    "images/flags/#{filename}"
  end

  def create_question_and_option(question_text, topic_id, correct_answer_text, exam_id, imagepath)
    question = Question.new(question: question_text, topic_id: topic_id)

    return unless question.save

    correct_option = Option.create(response: correct_answer_text, topics_id: topic_id)
    return unless correct_option.save

    Qa.create(questions_id: question.id, options_id: correct_option.id, exam_id: exam_id, imagepath: imagepath)
  end
end
