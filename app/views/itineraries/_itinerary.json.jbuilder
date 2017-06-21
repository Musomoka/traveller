json.extract! itinerary, :id, :tour_id, :place_id, :created_at, :updated_at
json.url itinerary_url(itinerary, format: :json)