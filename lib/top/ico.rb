require "top/ico/version"
require "nokogiri"
require "open-uri"

module Top
  module Ico
    # Your code goes here...
    URL = "https://topicolist.com/".freeze

    def self.active
      doc = Nokogiri::HTML(open(URL))
      res = []
      doc.search("div.section div.container-8 div.w-dyn-items div.w-dyn-item").each do |item|
        coin = {}
        coin[:name] = item.search("h3.job-title").first.content
        res << coin
      end
      res
    end

    def self.upcoming
      doc = Nokogiri::HTML(open(URL))
    end
  end
end
