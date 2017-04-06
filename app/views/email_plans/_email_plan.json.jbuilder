json.extract! email_plan, :id, :name, :expiration, :created_at, :updated_at
json.url email_plan_url(email_plan, format: :json)
