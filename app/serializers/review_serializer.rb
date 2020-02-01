class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :description, :rating, :created_at,
             :reviewer_email
  # belongs_to :reviewer

  def reviewer_email
    object.reviewer&.email
  end
end
