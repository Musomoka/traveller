json.extract! tour, :id, :tour_name, :description, :created_at, :updated_at
json.url tour_url(tour, format: :json)