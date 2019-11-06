describe "Author Attributes", type: :model do
    it "should have Attributes first_name, last_name, website" do
        author = new Author("Alan", "Turing", "http://wikipedia.de/Alan_Turing")
        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.website).to eq("http://wikipedia.de/Alan_Turing")
    end
end