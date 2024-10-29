# frozen_string_literal: true

# Helper methods for tracking user progress in lessons and levels.
module ProgressHelpers
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
end
