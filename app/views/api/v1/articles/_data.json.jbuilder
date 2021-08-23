# frozen_string_literal: true

json.id article.id
json.title article.title
json.body article.body
json.status article.status

json.comments do
  json.partial! partial: 'api/v1/comments/data', collection: article.comments, as: :comment
end
