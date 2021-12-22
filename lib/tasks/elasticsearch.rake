namespace :elasticsearch do
  namespace :article do
    desc 'ESのindex作成'
    task :create_index => :environment do
      Article.__elasticsearch__.create_index! force: true
    end

    desc 'ESのドキュメント登録'
    task :import_data => :environment do
      Article.import
    end

    desc 'indexのマッピングを確認'
    task :mapping_status => :environment do
      puts Article.mappings.to_hash
    end
  end
end
