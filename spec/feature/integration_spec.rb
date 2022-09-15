# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book: ', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '12.22'
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

# title integration tests
  scenario 'blank title' do
    visit new_book_path
    fill_in 'Title', with: ''
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '12.22'
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end

# author integration tests
  scenario 'blank author' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: ''
    fill_in 'Price', with: '12.22'
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('J.K. Rowling')
  end

# price integration tests
  scenario 'blank price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: ''
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('J.K. Rowling')
  end

  scenario 'non-numeric price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 'abc'
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('J.K. Rowling')
  end

  scenario 'numeric and non-numeric price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 'a1'
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('J.K. Rowling')
  end

  scenario 'valid one char price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '1'
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('J.K. Rowling')
  end

  scenario 'invalid one char price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 'a'
    fill_in "Published", with: '2022-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('J.K. Rowling')
  end

# date integration tests
  scenario 'blank date' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '1'
    fill_in "Published", with: ''
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end

  scenario 'non-numerical date' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '1'
    fill_in "Published", with: '20a2-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid date: no dash' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '1'
    fill_in "Published", with: '20020912'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid date: not enough chars' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '1'
    fill_in "Published", with: '202-09-12'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid day' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '1'
    fill_in "Published", with: '2022-09-55'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end

  scenario 'invalid month' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '1'
    fill_in "Published", with: '2022-60-12'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end
end