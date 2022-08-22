require 'rails_helper'

describe 'Post API', type: :request do
  describe 'GET/posts' do
    it 'returns all posts' do
      FactoryBot.create(:post, title: 'Title of the first post', body: 'Body of the first post')
      FactoryBot.create(:post, title: 'Title of the second post', body: 'Body of the second post')
      get '/api/v1/posts'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST/posts' do
    it 'create a new post' do
      expect {
        post '/api/v1/posts', params: { post: { title: 'Title of the first post', body: 'Body of the first post' },
          user: { nickname: 'Wiki', email: 'wiki@mail.com', password: '12345678' }
        }
      }.to change { Post.count}.from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(User.count).to eq(1)
    end
  end
end
