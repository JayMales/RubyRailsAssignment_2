json.extract! post, :id, :user_id, :post_type, :time, :text, :url, :title, :created_at, :updated_at
json.url post_url(post, format: :json)
