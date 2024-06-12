config = {
  host: ENV['ELASTICSEARCH_HOST'],
  transport_options: {
    request: { timeout: 200 }
  }
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
