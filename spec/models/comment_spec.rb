# frozen_string_literal: true

require 'rails_helper'
require 'visible'

RSpec.describe Comment, type: :model do
  it { should belong_to(:article) }

  it { should validate_presence_of(:commenter) }
  it { should validate_presence_of(:body) }

  it {
    should validate_inclusion_of(:status)
      .in_array(Visible::VALID_STATUSES)
  }
end
