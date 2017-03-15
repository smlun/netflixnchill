require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe 'GET #index' do
    describe 'should get correct routes' do
      it { should route(:get, '/movies').to(action: :index) }
    end

    it 'Should show all movies' do
      Movie.create(title: "test", starring: "test", price: 1, description: "test")
      get :index
      expect(assigns(:movies)).to match_array(Movie.all)
    end
  end


  describe 'GET #show' do

    describe 'should get correct routes' do
      it { should route(:get, '/movies/1').to(action: :show, id: 1) }
    end

    let (:movie) { Movie.create(title: "test", starring: "test", price: 1, description: "test") }
    it 'Should show the correct movie' do
      get :show, params: { id: movie.id }
      expect(assigns(:movie)).to eq(Movie.find(movie.id))
    end

  end

end
