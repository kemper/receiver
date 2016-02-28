defmodule ReceiverPlugTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts ReceiverPlug.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/hello", "2")
    conn = put_req_header(conn, "content-type", "application/json")
    conn = put_req_header(conn, "jmsxgroupid", "5")

    # Invoke the plug
    conn = ReceiverPlug.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Shard: 5, Body: 2"
  end
end

