# iOS problem solving

### Instructions
- Goal is to fetch weather data from this endpoint `https://api.weatherbit.io/v2.0/forecast/daily?city=San Francisco,CA&key=6dc3e6ea55434f429be5692e383a6f6f` and display the results.
    https://www.weatherbit.io/api/weather-forecast-16-day
- Show: Date, Max and Min temp and the icon (optional) for a day in the 16 day forecast
- To get the weather icon, call the following endpoint, where <icon> is a part of the API response: `https://www.weatherbit.io/static/img/icons/<icon>.png`


### example 
"""
{
  "city_name": "San Francisco",
  "country_code": "US",
  "data": [
    {
      "app_max_temp": 19.2,
      "app_min_temp": 13.5,
      "datetime": "2024-07-29",
      "sunrise_ts": 1722258648,
      "sunset_ts": 1722309696,
      "uv": 6,
      "valid_date": "2024-07-29",
      "vis": 3.8,
      "aqi": 37,
      "weather": {
        "code": 803,
        "icon": "c03d",
        "description": "Broken clouds"
      },
      "wind_cdir_full": "west-southwest",
      "wind_gust_spd": 6.8,
      "wind_spd": 3.9
    }
  ],
  "lat": "37.77493",
  "lon": "-122.41942",
  "state_code": "CA",
  "timezone": "America/Los_Angeles"
}
"""

