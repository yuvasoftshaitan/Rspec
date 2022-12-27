require 'rails_helper'

RSpec.describe UsersController, type: :controller do
 let(:devise_user){create :devise_user}
 before(:each) do
  sign_in(devise_user)
end

describe "GET index" do
 let(:user){create :user}
 let(:devise_user){create :devise_user}
 before(:each) do
  sign_in(devise_user)
  get :index
end
it "assigns @user" do 
  expect(assigns(:users)).to eq([user])
end
it "assigns @user" do 
  expect(response).to render_template('index')
end
it "assigns @user" do 
  expect(response).to have_http_status(:ok)
end
end

  # describe "GET / Show" do
  #  it "responds to GET" do
  #     # debugger
  #     user = create :user
  #     get :show, :params => { :id => user.id}
  #     expect(response.body).to eq (200)
  #   end
  # end

  describe "GET /new" do
    it "get details for create new user" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:devise_user){create :devise_user}
    before(:each) do
      sign_in(devise_user)
    end
    it "create new user " do
      post :create, params:{
        user:user_parmas
      } 
      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end

    it "should accepts the params with show paga  " do
      post :create, params:{
        user:user_parmas
      } 
      expect(subject).to redirect_to(assigns(:user))
    end

     it "should render validation errors " do
       post :create, params:{
        user: { name: "", phone_no: nil }
           }
        expect(assigns(:user).valid?).to_not eq(true)
    end

  end

  # describe "GET /edit" do
  #   it "get details for update" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "PATCH /update" do
      let(:user){create :user}
      let(:user1){create :user}
      let(:user2){create :user}
    it "should accepts the params with html format" do
      patch :update, params: {
        user: user_parmas,
        id: user1.id
      }
      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end

    it "should accepts the params with show paga  " do
      post :create, params:{
        user:user_parmas,
        id: user2.id
      } 
      expect(subject).to redirect_to(assigns(:user))
    end

     it "should render validation errors " do
       post :create, params:{
        user: { name: "", phone_no: nil, id: user2.id}
           }
        expect(assigns(:user).valid?).to_not eq(true)
    end

  end

  describe "DELETE /destroy" do
    let(:user){create :user}
    let(:user1){create :user}
    it "should reduce the user count by one " do
      delete :destroy , params:{
        id: user1.id
      }
      expect(User.count).to eq(0)
    end
  end

  def user_parmas
    {
      name: Faker::Name.name,
      phone_no: Faker::PhoneNumber.phone_number
    }
  end

end
