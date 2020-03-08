module CommentsHelper
  
  def current_micropost
    Micropost.find(params[:micropost_id])
  end
  
end
