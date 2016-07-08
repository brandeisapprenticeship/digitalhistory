json.array!(@path_comments) do |path_comment|
  json.extract! path_comment, :id, :submission_id, :text, :user_id, :present
  json.url path_comment_url(path_comment, format: :json)
end
