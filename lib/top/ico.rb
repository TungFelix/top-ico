require "top/ico/version"
require "nokogiri"
require "open-uri"

module Top
  module Ico
    URL = "https://topicolist.com/".freeze

    def self.active
      active_coins = "div.section div.container-8 div.w-dyn-items div.w-dyn-item"
      get_info(active_coins)
    end

    def self.upcoming
      upcoming_coins = "div.section div.container-9 div.w-dyn-items div.w-dyn-item"
      get_info(upcoming_coins)
    end

    def self.get_info(coins)
      doc = Nokogiri::HTML(open(URL))
      res = []
      doc.search(coins).each do |item|
        coin = {}
        coin[:name] = item.search("h3.job-title").first.content
        coin[:description] = item.search("p.paragraph-3").first.content
        coin[:nation] = item.search("div.div-block div.text-block-4").first.content
        coin[:code] = item.search("div.div-block div.text-block-4")[2].content
        coin[:rank] = item.search("div.jobs-client div.job-time").first.content
        coin[:url] = "https://topicolist.com/".concat(item.search("a.jobs-wrapper").first.values.first)
        res << coin
      end
      res
    end
  end
end
