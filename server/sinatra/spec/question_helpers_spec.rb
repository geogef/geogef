# frozen_string_literal: true

require_relative '../helpers/question_helpers'
require 'rspec'

RSpec.describe QuestionHelpers do
  include QuestionHelpers

  describe '#save_image' do
    let(:params) { { 'image' => { filename: 'flag.svg', tempfile: double('file', read: 'file_content') } } }

    it 'saves the image if topic is "Banderas" and file is .svg' do
      allow(Topic).to receive(:find).with(1).and_return(double('Topic', topic: 'Banderas'))
      expect(File).to receive(:open).with('./public/images/flags/flag.svg', 'wb')
      save_image(params, 1)
    end

    it 'does not save the image if topic is not "Banderas"' do
      allow(Topic).to receive(:find).with(1).and_return(double('Topic', topic: 'Geografía'))
      expect(File).not_to receive(:open)
      save_image(params, 1)
    end

    it 'does not save the image if file is not .svg' do
      params['image'][:filename] = 'flag.png'
      allow(Topic).to receive(:find).with(1).and_return(double('Topic', topic: 'Banderas'))
      expect(File).not_to receive(:open)
      save_image(params, 1)
    end
  end
end

RSpec.describe QuestionHelpers do
  include QuestionHelpers
  describe '#create_question_and_option' do
    let(:question) { double('Question', id: 1, save: true) }
    let(:correct_option) { double('Option', id: 1, save: true) }

    it 'does not create a question if it fails to save' do
      allow(Question).to receive(:new).and_return(double('Question', save: false))
      expect(Option).not_to receive(:create)
      expect(Qa).not_to receive(:create)

      create_question_and_option('Invalid question', 1, 'Answer', 1, nil)
    end

    it 'does not create an option if it fails to save' do
      allow(Question).to receive(:new).and_return(double('Question', save: true))
      allow(Option).to receive(:create).and_return(double('Option', save: false))
      expect(Qa).not_to receive(:create)

      create_question_and_option('Valid question', 1, 'Invalid Option', 1, nil)
    end
  end
end

RSpec.describe QuestionHelpers do
  include QuestionHelpers
  describe '#create_question_and_option' do
    let(:question) { double('Question', id: 1, save: true) }
    let(:correct_option) { double('Option', id: 1, save: true) }
    it 'creates a question, option, and Qa relation when valid inputs are provided' do
      allow(Question).to receive(:new).and_return(question)
      allow(Option).to receive(:create).and_return(correct_option)
      allow(Qa).to receive(:create).and_return(true)

      expect(Question).to receive(:new).with(question: 'What is this?', topic_id: 1)
      expect(Option).to receive(:create).with(response: 'Correct Answer', topics_id: 1)
      expect(Qa).to receive(:create).with(questions_id: question.id, options_id: correct_option.id, exam_id: 1,
                                          imagepath: 'path/to/image')

      create_question_and_option('What is this?', 1, 'Correct Answer', 1, 'path/to/image')
    end
  end
end
