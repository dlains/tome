RSpec.shared_examples 'a successful response' do
  it 'has http status 200' do
    expect(response).to have_http_status(:ok)
  end
end
