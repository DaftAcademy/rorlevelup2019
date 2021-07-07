# frozen_string_literal: true

class CreateArchers < ActiveRecord::Migration[5.2]
  def change
    create_table :archers, &:timestamps
  end
end
