defmodule AmbiWeb.ApiView do
  use AmbiWeb, :view

  # Renders a JSON response to the IoT device doing a POST
  def render("api_response.json", %{status: status}) do
    IO.puts("render/2 ApiView")
    %{code: status.code, desc: status.desc}
  end
end
