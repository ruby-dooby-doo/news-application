class Api::SpotifyController < ApplicationController
  def authorize
      redirect_to "https://accounts.spotify.com/authorize/?client_id=&response_type=code&redirect_uri=http://localhost:3000/api/callback&scope=user-read-private%20user-read-email"
  end

  def callback
    response = Unirest.post("https://accounts.spotify.com/api/token",
      parameters: {
        grant_type: "authorization_code",
        redirect_uri: "http://localhost:3000/api/callback",
        code: params[:code],
        client_id: '',
        client_secret: ''

      }
    )

    access_token = response.body['access_token']

    response = Unirest.get(
      "https://api.spotify.com/v1/me",
      headers: {"Authorization" => "Bearer #{access_token}"}
    )

    render json: response.body
  end
end
