require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'associations' do
    it {is_expected.to have_many(:appointments)}
  end  
  describe 'validations' do
    it { should validate_presence_of(:room) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
  describe 'columns' do
    it { is_expected.to have_db_column(:room).of_type(:string) }
  end

end
