module Scraping::ExtractArticle
  require 'open-uri'
  require 'json'

  extend ActiveSupport::Concern

  def fetch_rakuten_articles
    # Rakuten Magazineの全ての雑誌カテゴリーから取得
    url = 'https://magazine.rakuten.co.jp/json/v1.0/latestIssues'
    file_name = 'articles_rakuten.json'

    json = request_json(url)
    res_json = json[:latestIssues].to_json
    create_json_file(file_name, res_json)
  end

  private

  def request_json(url)
    target_json = URI.open(url).read
    JSON.parse(target_json, symbolize_names: true)
  end

  def create_json_file(file_name, json)
    File.write(file_name, json)
  end
end
