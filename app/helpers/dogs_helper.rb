module DogsHelper

  def dog_has_owner?
    !!@dog.user
  end

  def dog_owner
    @dog.user
  end

  # Ensure a logged in user and that the dog has an owner
  # Determine if the owner is the logged in user
  # before allowing them to edit/delete the dog's profile
  def owner_of_dog?
    dog_has_owner? && current_user ? dog_owner.id == current_user.id : false
  end

  # Ensure a logged in user and that the
  # logged in user is not the owner of the dog
  def likable?
    if current_user
      !dog_has_owner? || dog_owner.id != current_user.id ? true : false
    else
      false
    end
  end

  def already_liked?
    current_user.likes.pluck(:dog_id).include?(@dog.id) if current_user
  end

  def user_like
    Like.find_by(user_id: current_user.id, dog_id: @dog.id)
  end
end
