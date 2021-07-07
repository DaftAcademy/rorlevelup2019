# frozen_string_literal: true

class CreateWizards < ActiveRecord::Migration[5.2]
  def change
    create_table :wizards, &:timestamps
  end
end
