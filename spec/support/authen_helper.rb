module AuthenHelper
  def json_response
    case body = JSON.parse(response.body)
    when Hash
      body.with_indifferent_access
    when Array
      body
    end
  end

  def stub_authenticate!(user)
    Grape::Endpoint.before_each do |endpoint|
      endpoint.stub(:authenticated_user).and_return(true)
      endpoint.stub(:current_user).and_return(user)
    end
  end
end
