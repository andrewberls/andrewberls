# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)      default(""), not null
#  created_at   :datetime
#  updated_at   :datetime
#  body         :text
#  status       :integer
#  user_id      :integer
#  url_alias    :string(255)
#  published_at :datetime
#

require 'rails_helper'

describe Post do
  it 'has a valid factory' do
    expect(FactoryBot.create(:post)).to be_valid
  end

  it 'is invalid without a title' do
    expect(FactoryBot.build(:post, title: nil)).to_not be_valid
  end

  it 'is invalid without a body' do
    expect(FactoryBot.build(:post, body: nil)).to_not be_valid
  end

  context 'url alias' do
    it 'should not be valid without a url alias' do
      expect(FactoryBot.build(:post, url_alias: '')).to_not be_valid
    end

    it 'should be valid with a url alias' do
      expect(FactoryBot.build(:post, url_alias: 'test-alias')).to be_valid
    end
  end

  context 'post with pagebreak' do
    let(:post) { FactoryBot.build(:post_with_pagebreak) }

    it 'has a valid factory' do
      expect(post).to be_valid
    end

    it 'should render the teaser correctly' do
      expect(post.teaser).to eql('<p>This is before the break.</p>')
    end

    it 'should render the full post without a break tag' do
      expect(post.full_text).to_not include(Post::BREAK_TAG)
    end
  end

  context 'url aliases' do
    let(:post) { FactoryBot.build(:post) }

    it 'should lowercase all urls' do
      post.url_alias = 'TEST'
      expect(post.url_alias).to eql('test')
    end

    it 'should strip trailing whitespace' do
      post.url_alias = "  test  \t"
      expect(post.url_alias).to eql('test')
    end

    it "should chomp the alias" do
      post.url_alias = "test\r\n"
      expect(post.url_alias).to eql('test')
    end

    it 'should replace spaces with hyphens correctly' do
      post.url_alias = 'this  is the title'
      expect(post.url_alias).to eql('this-is-the-title')
    end

    it 'should not replace numbers' do
      post.url_alias = '1234-ways-to-be-cool'
      expect(post.url_alias).to eql('1234-ways-to-be-cool')
    end

    it 'should handle malformed urls correctly' do
      post.url_alias = "This is   the  !   \t TITLE@\#$%^&*("
      expect(post.url_alias).to eql('this-is-the-title')
    end

    it 'should not change correct urls' do
      post.url_alias = 'this-is-the-title'
      expect(post.url_alias).to eql('this-is-the-title')
    end

    it 'should handle completely average use cases' do
      post.url_alias = 'Suggesting URL aliases with Coffeescript'
      expect(post.url_alias).to eql('suggesting-url-aliases-with-coffeescript')
    end
  end
end
