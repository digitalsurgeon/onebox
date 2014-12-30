require "spec_helper"

describe Onebox::Engine::GooglePlayMovieOnebox do
  before(:all) do
    @link = "https://play.google.com/store/movies/details/The_Rise_and_Rise_of_Bitcoin?id=rkoXmwvREmk"
  end

  include_context "engines"
  it_behaves_like "an engine"

  describe "#to_html" do
    it "has publish date" do
      expect(html).to include("2014")
    end

    it "has image" do
      expect(html).to include("1yO5dljZoaAkIJExs=w300")
    end

    it "has synopsis" do
      expect(html).to include("is a 35 year old computer programmer")
    end

    it "has buy price" do
      expect(html).to include("Buy")
    end

    it "has rent price" do
      expect(html).to include ("Rent")
    end

  end
end
