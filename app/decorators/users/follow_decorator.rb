class Users::FollowDecorator < Draper::Decorator
  delegate_all

  def following?(other_user)
    object.following.include?(other_user)
  end
end
