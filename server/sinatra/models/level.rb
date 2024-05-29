class Level < ActiveRecord::Base
    has_one :exam
    belongs_to :lesson
    has_many :materials, dependent: :destroy
end
