xml.instruct!
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  entries.each do |entry|
    xml.url do
      xml.loc polymorphic_url(entry[:object], entry[:params])
      entry[:search].each do |type, value|
        xml.tag! SEARCH_ATTRIBUTES[type], get_data(entry[:object], value).to_s
      end
    end
  end

end

