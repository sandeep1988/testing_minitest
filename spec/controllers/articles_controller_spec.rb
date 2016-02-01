require "rails_helper"

describe ArticlesController do

  ####index articles
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

  ###show articles

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

  ## create articles

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

  ### delete articles

  describe 'DELETE destroy' do
    before :each do
      @article = FactoryGirl.create(:article)
    end

    it "deletes the article" do
      expect{
        delete :destroy, id: @article}.to change(Article,:count).by(-1)
    end

    it "redirects to articles#index" do
      delete :destroy, id: @article
      response.should redirect_to articles_url
    end
  end

  # updates articles ##

  describe 'PUT update' do
    before :each do
      @article = FactoryGirl.create(:article, title: "Title", text: "sadsads")
    end

    context "valid attributes" do
      it "located the requested @article" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article)
        assigns(:article).should eq(@article)
      end

      it "changes @article's attributes" do
        put :update, id: @article,
            article: FactoryGirl.attributes_for(:article, title: "Title", text: "sadsads")
        @article.reload
        @article.title.should eq("Title")
        @article.text.should eq("sadsads")
      end

      it "redirects to the updated article" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article)
        response.should redirect_to @article
      end
    end

    context "invalid attributes" do
      it "locates the requested @article" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article)
        assigns(:article).should eq(@article)
      end

      it "does not change @article's attributes" do
        put :update, id: @article,
            article: FactoryGirl.attributes_for(:article, title: "Title", text: nil)
        @article.reload
        @article.title.should eq("Title")
        @article.text.should eq("sadsads")
      end

      it "re-renders the edit method" do
        put :update, id: @article, article: FactoryGirl.attributes_for(:article)
        response.should redirect_to @article
      end
    end
  end


end