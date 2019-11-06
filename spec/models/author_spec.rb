require 'rails_helper'

RSpec.describe Author, type: :model do
    it "should have attributes first_name, last_name, homepage" do
        author = Author.new("Alan", "Turing", "http://wikipedia.de/Alan_Turing")
        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.homepage).to eq("http://wikipedia.de/Alan_Turing")
    end
end
