class Material < ActiveRecord::Base
    belongs_to :level
    belongs_to :topic
end
