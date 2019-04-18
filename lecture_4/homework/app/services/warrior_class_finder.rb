# frozen_string_literal: true

class WarriorClassFinder
  def initialize(class_name, clan)
    @class_name = class_name || 'null'
    @clan = clan
  end

  def call
    find_class
  end

  private

  attr_reader :class_name, :clan

  def find_class
    case @class_name.downcase
    when 'samurai'
      Warriors::Samurai
    when 'hussar'
      Warriors::Hussar
    else
      WarriorsQuery.find_class(relation: @clan.warriors) || Warriors::Samurai
    end
  end
end
