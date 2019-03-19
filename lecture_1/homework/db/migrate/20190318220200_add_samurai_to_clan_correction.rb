class AddSamuraiToClanCorrection < ActiveRecord::Migration[5.2]
  def change
    remove_reference :clans, :samurai
    add_reference :samurais, :clan
  end
end
