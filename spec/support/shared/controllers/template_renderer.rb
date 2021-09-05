RSpec.shared_examples 'a template renderer' do |template|
  it 'renders the correct template' do
    expect(response).to render_template(template)
  end
end
