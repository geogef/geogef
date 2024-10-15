# frozen_string_literal: true

class AddTopicToMaterial < ActiveRecord::Migration[7.1]
  def change
    add_reference :materials, :topic, foreign_key: true
  end
end
