defmodule AmbiWeb.ApiControllerTest do
  use AmbiWeb.ConnCase, async: true
  alias AmbiWeb.ApiController

  describe "add_reading/2" do
    test "responds to a valid request with an :ok response" do
      valid_request = %{
        "air_purity" => "High Pollution",
        "dust_concentration" => "589",
        "humidity" => "58.4",
        "pressure" => "1021",
        "temperature" => "24.8"
      }

      assert {status: 200} = ApiController.add_reading(conn, valid_request)
    end

    test "responds to invalid request with a :bad_request response", %{conn: conn} do
      assert {status: 400} = ApiController.add_reading(conn, %{})
    end
  end
end
