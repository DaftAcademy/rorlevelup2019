module DidYouMean
  class MethodNameChecker
    attr_reader :method_name, :receiver

    def initialize(exception)
      @method_name = exception.name
      @receiver    = exception.receiver
      @has_args    = !exception.args&.empty?
    end

    def corrections
      @corrections ||= SpellChecker.new(dictionary: method_names).correct(method_name)
    end

    def method_names
      method_names = receiver.methods + receiver.singleton_methods
      method_names += receiver.private_methods if @has_args
      method_names.uniq!
      method_names
    end
  end
end
