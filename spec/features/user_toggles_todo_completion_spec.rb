require 'spec_helper'

feature	'User toggles todo completion' do
	scenario 'marks as complete' do
		todo = create :todo, title: 'To be completed', owner_email: 'person@example.com'
		sign_in_as 'person@example.com'

		expect(todo_on_page(todo)).not_to have_css 'a', text: 'Incomplete'
		todo_on_page(todo).click_on 'Complete'

		expect(todo_on_page(todo)['data-state']).to eq 'complete'
		expect(todo_on_page(todo)).not_to have_css 'a', text: 'Complete'
	end

	scenario 'marks as incomplete' do
		todo = create :todo, title: 'To be completed', owner_email: 'person@example.com'
		sign_in_as 'person@example.com'
		todo_on_page(todo).click_on 'Complete'
		todo_on_page(todo).click_on 'Incomplete'

		expect(todo_on_page(todo)['data-state']).to eq 'incomplete'
	end

	def todo_on_page(todo)
		find("[data-id='#{todo.id}']")
	end
end