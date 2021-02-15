json.extract! lead, :id, :name, :phone_number, :date_texted, :created_at, :updated_at
json.url lead_url(lead, format: :json)
