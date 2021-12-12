namespace :elasticsearch do
  namespace :article do
    desc 'Elasticsearchのindex作成'
    task :create_index => :environment do
      Article.__elasticsearch__.create_index! force: true
    end

    desc 'Elasticsearchに登録'
    task :import_data => :environment do
      Article.import
    end
  end
end
