defmodule ReceiverPlug do
  import Plug.Conn
  require Logger

  def init(options) do
    options
  end

  def call(conn, _opts) do
    response = build_response(conn)

    Logger.info(response)

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, response)
  end

  def build_response(conn) do
    #Logger.info(inspect(conn.req_headers))
    shard_header = get_shard(conn)
    {:ok, body, _} = read_body(conn)
    response = "Shard: #{elem(shard_header, 1)}, Body: #{body}"
    response
  end

  def get_shard(conn) do
    shard_header_name = String.downcase(Application.get_env(:receiver, :shard_header))
    Enum.find conn.req_headers, fn(x) -> elem(x, 0) == shard_header_name end
  end
end
