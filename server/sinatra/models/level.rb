class Level < ActiveRecord::Base
    has_one :exam
    belongs_to :lesson
end
