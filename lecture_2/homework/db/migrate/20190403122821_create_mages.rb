# frozen_string_literal: true

class CreateMages < ActiveRecord::Migration[5.2]
  def change
    create_table :mages, &:timestamps
  end
end
