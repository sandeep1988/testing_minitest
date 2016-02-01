require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: {title: 'Hello', text: 'This is my first article.'}
    end
    assert_redirected_to article_path(assigns(:article))
  end

  test "index should render current page"  do
    get :index
    assert_template :index
    assert_template layout: "application"
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    patch :update, id: @article, article: { title: @article.title, text: @article.text }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

  assert_redirected_to articles_path
  end

end
