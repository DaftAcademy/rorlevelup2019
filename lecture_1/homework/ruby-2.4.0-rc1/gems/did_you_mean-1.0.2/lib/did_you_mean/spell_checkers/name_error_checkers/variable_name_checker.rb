# -*- frozen-string-literal: true -*-

module DidYouMean
  class VariableNameChecker
    attr_reader :name, :method_names, :lvar_names, :ivar_names, :cvar_names

    def initialize(exception)
      @name       = exception.name.to_s.tr("@", "")
      @lvar_names = RUBY_ENGINE == 'jruby' ? [] : exception.local_variables
      receiver    = exception.receiver

      @method_names = receiver.methods + receiver.private_methods
      @ivar_names   = receiver.instance_variables
      @cvar_names   = receiver.class.class_variables
      @cvar_names  += receiver.class_variables if receiver.kind_of?(Module)
    end

    def corrections
      @corrections ||= SpellChecker
                     .new(dictionary: (lvar_names + method_names + ivar_names + cvar_names))
                     .correct(name)
    end
  end
end
