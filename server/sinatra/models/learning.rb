class Learning < ActiveRecord::Base
    has_many :materials
    belongs_to :level
end