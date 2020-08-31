json.extract! student, :id, :nom, :prenom, :cni, :telephone, :numtable, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
