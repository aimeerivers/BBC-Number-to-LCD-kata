def lcd(number)
  number
end


describe "LCD" do

  it "Rspec test - delete me!" do
    lcd(1).should == 1
  end

  xit "converts the number 1" do
    lcd(1).should == <<-result
   
  |
   
  |
   
result
  end

  xit "converts the number 2" do
    lcd(2).should == <<result
 - 
  |
 - 
|  
 - 
result
  end

end
