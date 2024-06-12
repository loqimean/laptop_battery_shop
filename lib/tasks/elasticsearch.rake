# https://github.com/elastic/elasticsearch-rails/blob/master/elasticsearch-rails/README.md#rake-tasks

# require 'elasticsearch/rails/tasks/import'

namespace :elasticsearch do
  desc "Slightly Custom ES Full Import"
  task import: :environment do
    [Product].each do |es_model|
      begin
        es_model.__elasticsearch__.delete_index!
      rescue Elasticsearch::Transport::Transport::Errors::NotFound
        # that's okay
      end

      es_model.__elasticsearch__.create_index!

      es_model.in_batches do |batch|
        batch.import
      end
    end
  end
end
