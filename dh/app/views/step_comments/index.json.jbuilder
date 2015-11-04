json.array!(@step_comments) do |step_comment|
  json.extract! step_comment, :id, :step_id, :text, :user_id
  json.url step_comment_url(step_comment, format: :json)
end
