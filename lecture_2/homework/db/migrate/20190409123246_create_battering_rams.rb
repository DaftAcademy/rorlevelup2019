# frozen_string_literal: true

class CreateBatteringRams < ActiveRecord::Migration[5.2]
  def change
    create_table :battering_rams, &:timestamps
  end
end
