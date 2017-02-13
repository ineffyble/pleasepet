json.extract! page, :id, :pet_id, :url, :name, :created_at, :updated_at
json.url page_url(page, format: :json)