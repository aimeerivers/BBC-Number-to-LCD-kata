class LCD
  DIGITS = {
    '1' => [:space, :right, :space, :right, :space],
    '2' => [:middle, :right, :middle, :left, :middle]
  }

  def initialize(number)
    @number = number
  end

  def to_s
    @number.to_s.split('').map {|c| DIGITS[c] }.transpose.map do |line|
      line.map do |digit_line|
        expand_line(digit_line)
      end.join('')
    end.join("\n")
  end

  private

  def expand_line(symbol)
    symbol_to_line = {
      :space  => '   ',
      :right  => '  |',
      :left   => '|  ',
      :both   => '| |',
      :middle => ' - '
    }
    symbol_to_line[symbol]
  end
end

describe "LCD" do

  it "converts the number 1" do
     expected = <<-result
   
  |
   
  |
   
    result
    LCD.new(1).to_s.should == expected.chomp
  end

  it "converts the number 2" do
    expected = <<-result
 - 
  |
 - 
|  
 - 
result
    LCD.new(2).to_s.should == expected.chomp
  end

  it "converts the number 11" do
     expected = <<-result
      
  |  |
      
  |  |
      
     result
    LCD.new(11).to_s.should == expected.chomp
  end
end
