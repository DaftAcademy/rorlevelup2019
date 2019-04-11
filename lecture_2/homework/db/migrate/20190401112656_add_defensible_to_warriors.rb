# frozen_string_literal: true

class AddDefensibleToWarriors < ActiveRecord::Migration[5.2]
  def change
    add_reference :warriors, :defensible, polymorphic: true, index: true
  end
end
