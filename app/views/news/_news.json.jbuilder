json.extract! news, :id, :title, :content, :moral_category, :result, :created_at, :updated_at
json.url news_url(news, format: :json)
