json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :user_id, :text, :email, :name, :token
  json.url invitation_url(invitation, format: :json)
end
