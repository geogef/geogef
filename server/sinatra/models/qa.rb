class Qa < ActiveRecord::Base
    belongs_to :option
    belongs_to :question
    belongs_to :exam
end
