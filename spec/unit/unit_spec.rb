# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', author: 'J.K. Rowling', price: '2.5', published: '2022-09-12')
  end

  #valid case
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  #name unit tests
  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  #author unit tests
  it 'is not valid without a author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  #price unit tests
  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid when price is non-numeric' do
    subject.price = 'a'
    expect(subject).not_to be_valid
  end

  it 'is not valid when price is non-numeric and numeric' do
    subject.price = 'a1'
    expect(subject).not_to be_valid
  end

  it 'is valid when price is one numeric char' do
    subject.price = '1'
    expect(subject).to be_valid
  end

  it 'is not valid when price is one non-numeric char' do
    subject.price = 'a1'
    expect(subject).not_to be_valid
  end

  #published date unit tests
  it 'is not valid without a date' do
    subject.published = nil
    expect(subject).not_to be_valid
  end

  it 'is valid with valid date' do
    subject.published = '2022-09-12'
    expect(subject).to be_valid
  end

  it 'is not valid with non-numical date' do
    subject.published = '20a2-09-12'
    expect(subject).to be_valid
  end

  it 'is not valid with no dash in date' do
    subject.published = '20220912'
    expect(subject).to be_valid
  end

  it 'is not valid with invalid/short date' do
    subject.published = '202-09-12'
    expect(subject).to be_valid
  end

  it 'is not valid with invalid day in date' do
    subject.published = '2022-09-55'
    expect(subject).not_to be_valid
  end

  it 'is not valid with invalid month in date' do
    subject.published = '2022-60-12'
    expect(subject).not_to be_valid
  end
end