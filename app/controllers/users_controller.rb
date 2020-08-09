class UsersController < ApplicationController

  layout false
     
  def index    
    render json: {status_code: 200, message: "User records fetched", users: User.all}, status: :ok
  end  

  def create
    user = User.new(params.permit(:first_name, :last_name, :age, :email, :password, :rating))

    if user.save
      render json: {status_code: 201, message: "User created.", user: user}, status: :ok
    else
      render json: {status_code: 422, message: "User creation failed.", user: user, error: user.errors}, status: :unprocessable_entity
    end        
  end

  def show
    user = find_user(params)
    return unless user
    
    render json: {status_code: 200, message: "User found.", user: user}, status: :ok        
  end

  def update
    user = find_user(params)
    return unless user

    if user.update_attributes(params.permit(:first_name, :last_name, :age, :email, :password))
      render json: {status_code: 200, message: "User updated.", user: user}, status: :ok
    else
      render json: {status_code: 422, message: "User not updated.", user: user, error:user.errors}, status: :unprocessable_entity
    end               
  end

  def destroy
    user = find_user(params)
    return unless user

    if user.destroy
      render json: {status_code: 200, message: "User deleted.", user: user}, status: :ok
    else
      render json: {status_code: 501, message: "User not deleted.", user: user, error:user.errors}, status: :error
    end                         
  end

  # this method is an example of setting up a named route other than default CRUD routes
  def rating
    user = find_user(params)
    return unless user

    if user.update_attributes(params.permit(:rating))
      render json: {status_code: 200, message: "Rating updated.", user: user}, status: :ok
    else
      render json: {status_code: 422, message: "Rating not updated.", user: user, error:user.errors}, status: :unprocessable_entity
    end  
  end

  def find_user(params)
    user = User.find_by_id(params[:id])

    render json: {status_code: 404, message: "User not found.", user: user, 
      error: "User does not exist for id: #{params[:id]}"}, status: :not_found and return unless user

    user 
  end
end
