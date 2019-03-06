require "./price.rb"
require "./converter.rb"

test_set = Price.currencies + [:test, :lmao]

begin
  test_set.each do |test|
    begin
      puts "\n--------------------------------"
      puts "Testing Price with currency: " + test.to_s.upcase
      pri_test = Price.new(1.11, test)
      con_test = Converter.new(pri_test)
      
      (test_set - [test]).each do |assert|
        amnt = pri_test.amount
        camnt = con_test.convert_to(assert.to_sym)
        puts "\tTesting conversion of " + test.to_s.upcase + " to " + assert.to_s.upcase
        puts "\t #{amnt} --> #{camnt}"

      end
      
    rescue
      puts "\tExpected fail on invalid currency"
      $stderr.print "\tFAIL: ", $!
    end

  end
end
