json.exercises @exercises  do |exercise|
  json.id exercise.id
  json.name exercise.name
  json.description exercise.description
  json.summary exercise.summary
  json.upvotes exercise.get_upvotes.size
  json.downvotes exercise.get_downvotes.size
end