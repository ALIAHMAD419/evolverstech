require 'rails_helper'

RSpec.describe Bed, type: :model do
  describe 'associations' do
    it {is_expected.to belong_to(:ward).optional}
  end
  describe 'validations' do
    it { should validate_presence_of(:ward_id) }
    it { should validate_presence_of(:beds) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:ward_id).of_type(:integer) }
    it { is_expected.to have_db_column(:beds).of_type(:integer) }

  end
end
