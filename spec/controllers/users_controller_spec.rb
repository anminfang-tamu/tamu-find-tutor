require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    describe "GET index" do
        
        it "assign @users" do
            user = create(:user)
            get :index
            expect(assigns(:users)).to eq([user])
        end
        
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end
        
        it "has a 200 status code" do
            get :index
            expect(response.status).to eq(200)
        end
        
    end
    
    context 'GET # new' do
        it 'has a 200 status code' do
          get :new
          expect(response.status).to eq(200)
        end
    
        it 'Renders :new template' do
          get :new
          expect(response).to render_template(:new)
        end
    
        it 'Assigns new User to @User' do
          get :new
          expect(assigns(:user)).to be_a_new(User)
        end
    end
    
    describe "POST create" do
        
        it "should create an user" do
            create(:user)
            expect(User.last.username).to eq "brady555"
        end
        
        it "should not create an new user since email format is not correct" do
            expect {post :create, params: { user: FactoryGirl.attributes_for(:user,  {username: 'brady555' ,email: 'bradyfang', password: '123456'})}}.not_to change(User, :count)
        end
    end
    
    context 'POST # create' do
        it 'responds to HTML by default' do
          post :create, params: {:user => { username: 'Pato', email: 'pato@gmail.com', password: '123456' } }
          expect(response.content_type).to eq 'text/html; charset=utf-8'
        end
    end
end
