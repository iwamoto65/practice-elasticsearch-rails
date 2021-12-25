namespace :scraping do
  namespace :article do
    desc '雑誌を取得'
    task :extract_data => :environment do
      include ::Scraping::ExtractArticle
      fetch_articles
    end
  end
end
