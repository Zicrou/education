json.extract! etablissement, :id, :name, :adresse, :departement_id, :created_at, :updated_at
json.url etablissement_url(etablissement, format: :json)
