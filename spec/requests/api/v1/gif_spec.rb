require 'rails_helper'

describe 'Weather API', :vcr do
  it 'Can get weather by location' do
    location = "denver,co"

    get "/api/v1/gifs?location=#{location}"

    gif_json = JSON.parse(response.body)

    expect(response).to be_successful
    expect(gif_json["data"]["images"].count).to eq(5)
  end
end

# You will be building an API that will use weather data from the Dark Sky API in order to provide animated GIFs using the Giphy API.
# Your endpoint should accept GET requests like this:  `/api/v1/gifs?location=denver,co`
# And it should respond like this:
# ```
# {
#   data: {
#     images: [
#       {
#         time: "1541487600",
#         summary: "Mostly sunny in the morning.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541127600",
#         summary: "Partly cloudy in the evening.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "2381487600",
#         summary: "Snowy.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541487600",
#         summary: "Firenado",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1541487600",
#         summary: "Corgis because I cant think of other weather",
#         url: "<GIPHY_URL_GOES_HERE>"
#       }
#     ]
#   }
#   copyright: "2019"
# }
# ```
# Note: Each <GIPHY_URL_GOES_HERE>  is a link to a different gif that is dependent on the weather. The time should also be different. The above example is provided for guidance about what the general structure of the data you are providing should look like.
