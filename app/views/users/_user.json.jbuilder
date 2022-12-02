json.extract! user, :id, :full_name, :department, :summary, :ignition_id, :rank, :created_at, :updated_at
json.url user_url(user, format: :json)
