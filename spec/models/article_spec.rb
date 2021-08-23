# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should have_many(:comments).dependent(:restrict_with_error) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it { should validate_length_of(:body).is_at_least(10) }
end
