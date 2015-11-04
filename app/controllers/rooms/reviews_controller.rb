class Rooms::ReviewsController < Rooms::BaseController

  def create
    review = room.reviews.find_or_initialize_by(user_id: current_user.id)
    review.update_attributes!(review_params)

    head :ok
  end

  def update
    create
  end

  def review_params
    params.require(:review).permit(:user_id, :room_id, :points)
  end
end