module Onebox
  module Engine
    class GooglePlayMovieOnebox
      include Engine
      include LayoutSupport
      include HTML

      DEFAULTS = {
        MAX_DESCRIPTION_CHARS: 500
      }


      matches_regexp Regexp.new("^http(?:s)?://play\\.(?:(?:\\w)+\\.)?(google)\\.com(?:/)?/store/movies/details/")

      private

      def data
        result = {
          link: link,
          title: raw.css(".document-title div").inner_text,
          publish_date: raw.css("div[itemprop=datePublished]").inner_text,
          genre: raw.css("span[itemprop=genre]").inner_text,
          image: raw.css(".cover-image").first["src"],
          synopsis: raw.css("meta[name=Description]").first["content"]
        }
        result
      end
    end
  end
end
