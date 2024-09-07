defmodule Weather do
  @moduledoc """
  Weather app that display Weather feeds data from
  weatherapi.com designed by developer for developer,
  which give access to real-time or current XML weather
  API that provides access to near real-time weather
  information for millions of locations
  """
  require Logger

  import SweetXml

  # use a module attribute to fetch the value at compile time
  @url Application.get_env(:weather, :url)

  def main(argv) do
    OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])
    |> elem(1)
    |> fetch()
    |> decode_res
    |> print()
  end

  def fetch([city]) do
    Logger.info("Fetching weather info for #{city}")

    HTTPoison.get("#{@url}/v1/current.xml?key=087987632e2d49e4aa7182829240709&q=#{city}")
    |> handle_res
  end

  def decode_res({:ok, body}), do: deserialize(body)

  def decode_res({:error, error}) do
    raise("Error fetching from weatherapi.com: #{error}")
  end

  def handle_res({_, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status code=#{status_code}")
    Logger.debug(fn -> inspect(body) end)

    {
      status_code |> check_for_error,
      body
    }
  end

  def deserialize(xml) do
    location = xml |> xpath(~x"//location/name/text()")
    datetime = xml |> xpath(~x"//location/localtime/text()") |> to_string()
    [date, time] = String.split(datetime, " ", trim: true)
    temp = xml |> xpath(~x"//current/temp_f/text()")
    condition = xml |> xpath(~x"//condition/text/text()")
    wind_dir = xml |> xpath(~x"//wind_dir/text()")
    wind_mph = xml |> xpath(~x"//wind_mph/text()")

    %{
      location: location,
      date: date,
      time: time,
      temp: temp,
      condition: condition,
      wind_dir: wind_dir,
      wind_mph: wind_mph
    }
  end

  def print(data) do
    header = "Weather at #{data.location}"
    IO.puts(header)
    IO.puts(String.duplicate("-", String.length(header)))
    IO.puts("Date: #{data.date}")
    IO.puts("Time: #{data.time}")
    IO.puts("Conidition: #{data.condition}")
    IO.puts("Temperature: #{data.temp}° F")
    IO.puts("Winds: #{data.wind_mph} MPH to the #{data.wind_dir}")
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error
end
