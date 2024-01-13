json.extract! qr_link, :id, :name, :destination_url, :created_at, :updated_at
json.url qr_link_url(qr_link, format: :json)
