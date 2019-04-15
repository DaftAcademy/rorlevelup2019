# frozen_string_literal: true

class CreateHussarMages < ActiveRecord::Migration[5.2]
  def change
    create_table :hussar_mages, &:timestamps
  end
end
