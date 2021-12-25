namespace :import_data do
  namespace :draft_article do
    desc 'DBにデータを投入'
    task :input_json_file => :environment do
      articles = nil
      File.open('articles_rakuten.json') do |f|
        articles = JSON.load(f)
      end

      import_target_data = []
      articles.each do |content|
        import_target_data << { title: content["titleName"], description: content["description"] }
      end

      ActiveRecord::Base.transaction do
        DraftArticle.import(import_target_data)
      end
    end
  end
end
