require 'rails_helper'

RSpec.describe Clerk, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:age) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:time).of_type(:datetime) }
    it { is_expected.to have_db_column(:age).of_type(:integer) }
  end
end
