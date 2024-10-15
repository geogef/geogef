# frozen_string_literal: true

helpers do
  def redirect_if_logged_in
    redirect '/dashboard' if session[:user_id]
  end

  def authenticate_user
    redirect '/login' unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def level_completed?(lesson, level_number)
    Level.find_by(number: level_number, lesson: lesson)
    progress = ProgressLesson.find_by(user: current_user, lesson: lesson)
    progress.is_completed || progress && progress.level.number > level_number
  end

  def level_unlocked?(lesson, level_number)
    Level.find_by(number: level_number, lesson: lesson)
    progress = ProgressLesson.find_by(user: current_user, lesson: lesson)
    progress && progress.level.number >= level_number
  end

  def current_level?(lesson, level_number)
    Level.find_by(number: level_number, lesson: lesson)
    progress = ProgressLesson.find_by(user: current_user, lesson: lesson)
    progress && progress.level.number == level_number
  end

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
