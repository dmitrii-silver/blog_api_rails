require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user) }
  end

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe "set_published_at" do

    it "send published_at nil" do
      time_now =  Time.new(2022, 02, 24, 12, 0, 0, "+09:00")
      allow(Time).to receive(:now).and_return(time_now)
      comment  = Comment.create(body: "Body", published_at: nil)

      expect(comment.published_at).to eq time_now
    end

    it "send published_at" do
      time_now = Time.now.strftime("%d-%m-%Y %H:%M:%S")
      comment  = Comment.create(body: "Body", published_at: time_now)

      expect(comment.published_at).to eq time_now
    end
  end
end
