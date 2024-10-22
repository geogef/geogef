# frozen_string_literal: true

module DataSetup
  def setup_user
    @user = User.create(username: 'testuser', email: 'test@example.com', password: 'password')
  end

  def setup_topic
    @topic = Topic.create(topic: 'Geography')
  end

  def setup_lesson
    @lesson = Lesson.create(title: 'Lesson 1', description: 'A test lesson', num_levels: 2, topic: @topic)
  end

  def setup_levels
    @level1 = Level.create(number: 1, name: 'Level 1', lesson: @lesson)
    @level2 = Level.create(number: 2, name: 'Level 2', lesson: @lesson)
  end

  def setup_exams
    @exam1 = Exam.create(duration: 60, name: 'Exam 1', lesson: @lesson, level: @level1)
    @exam2 = Exam.create(duration: 60, name: 'Exam 2', lesson: @lesson, level: @level2)
  end

  def setup_questions_and_options
    @question1 = Question.create(question: 'What is the capital of France?', topic: @topic)
    @question2 = Question.create(question: 'What is the capital of Germany?', topic: @topic)
    @option1 = Option.create(response: 'Paris', topics_id: @topic.id)
    @option2 = Option.create(response: 'Berlin', topics_id: @topic.id)
    @qa1 = Qa.create(questions_id: @question1.id, options_id: @option1.id, exam: @exam1)
    @qa2 = Qa.create(questions_id: @question2.id, options_id: @option2.id, exam: @exam2)
  end

  def setup_progress
    ProgressLesson.create(user: @user, lesson: @lesson, level: @level1)
  end

  def setup_test_data
    setup_user
    setup_topic
    setup_lesson
    setup_levels
    setup_exams
    setup_questions_and_options
    setup_progress

    post '/signup', username: @user.username, email: @user.email, password: 'password',
                    'password-confirmation': 'password'
    post '/login', email: @user.email, password: 'password'
  end
end
