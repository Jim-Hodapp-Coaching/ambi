defmodule AmbiWeb.ApiController do
  use AmbiWeb, :controller

  def add_reading(conn, params) do
    status = case Ambi.add_reading(params) do
      {:ok, _} -> %{code: :ok, desc: "Reading inserted successfully into DB"}
      {:error, _} -> %{code: :bad_request, desc: "Error inserting params into DB"}
    end
    conn
    |> put_status(status.code)
    |> render("api_response.json", status: status)
  end

  def set_metadata(conn, params) do
    Ambi.set_reading_metadata(params)

    status = %{code: "ok", desc: "Reading metadata set successfully"}
    render(conn, "api_response.json", status: status)
  end

  def reset(conn, _params) do
    Ambi.reset_readings()

    html(conn, """
      <html>
        <head>
           <title>Reset Readings</title>
        </head>
        <body>
          <h2>Readings table data reset successfully.</h2>
        </body>
      </html>
    """)
  end
end
