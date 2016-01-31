require "rails_helper"

describe ArticlesController do
  describe "GET #index" do
    it "populates an array of articles" do
      article = FactoryGirl.create(:article)
      get :index
      assigns(:articles).should eql?([article])
    end
  end
    describe "GET #index" do
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested article to @article" do
      article = FactoryGirl.create(:article)
      get :show, id: article
      assigns(:article).should eql? (article)
    end
  end

    describe "GET #show" do
      it "renders the #show view" do
        get :show, id: FactoryGirl.create(:article)
        response.should render_template :show
      end
    end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new article" do
        expect{
          post :create, article: FactoryGirl.attributes_for(:article)
        }.to change(Article,:count).by(1)
      end
    end

    describe "POST create" do
      it "redirects to the new article" do
        post :create, article: FactoryGirl.attributes_for(:article)
        response.should redirect_to Article.last
      end
    end
  end

  context "with invalid attributes" do
    it "does not save the new article" do
      expect{
        post :create, article: FactoryGirl.attributes_for(:invalid_article)
      }.to_not change(Article,:count)
    end

    it "re-renders the new method" do
      post :create, article: FactoryGirl.attributes_for(:invalid_article)
      response.should render_template :new
    end

  end

  describe 'DELETE destroy' do
    before :each do
      @article = FactoryGirl(:article)
    end

    it "deletes the article" do
      expect{
        delete :destroy, id: @article
      }.to change(Article,:count).by(-1)
    end

    it "redirects to articles#index" do
      delete :destroy, id: @article
      response.should redirect_to articles_url
    end
  end


end