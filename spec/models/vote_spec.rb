describe Vote do
  describe "validations" do
    
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( (Vote.value).to eq(-1) || (Vote.value).to eq(1) )
      end
    end
  end
end