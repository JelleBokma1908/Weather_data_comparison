import pandas as pd
from dash import Dash, html, dcc, callback, Output, Input
import plotly.graph_objects as go

#  HISTORICAL
# Read the first dataset (Weather data)
df1 = pd.read_excel('data_set_5.xlsx')

# Assume the year is 2025 and combine with the 'date' column to form a full date
df1['date'] = pd.to_datetime(df1['date'].astype(str) + '-2025', format='%d-%Y')  # 'date' is the column with dates

# Ensure columns are correctly formatted
df1['Time'] = pd.to_datetime(df1['Time'], errors='coerce')  # 'Time' is the column with time values

# Extract unique dates and weatherdata
dates1 = df1['date'].dropna().unique()  # Drop any NaT values
weatherdata1 = df1['weatherdata'].dropna().unique()  # Drop any NaN values ('weatherdata' is the column name)

# Prepare dropdown options for dates, using a full date format
date_options1 = [{'label': date.strftime('%Y-%m-%d'), 'value': date} for date in dates1]
weatherdata_options1 = [{'label': weather, 'value': weather} for weather in weatherdata1]

#  PREDICTIONS
# Read the third dataset 
df3 = pd.read_excel('data_set_3.xlsx')

df3['date'] = pd.to_datetime(df3['date'].astype(str) + '-2025', format='%d-%Y')  # 'date' is the column with dates

df3['Time'] = pd.to_datetime(df3['Time'], errors='coerce')  # 'Time' is the column with time values

dates3 = df3['date'].dropna().unique()  # Drop any NaT values
weatherdata3 = df3['weatherdata'].dropna().unique()  # Drop any NaN values ('weatherdata' is the column name)

date_options3 = [{'label': date.strftime('%Y-%m-%d'), 'value': date} for date in dates3]
weatherdata_options3 = [{'label': weather, 'value': weather} for weather in weatherdata3]

# SNOW
# Read the second dataset 
df2 = pd.read_excel('data_set_2.xlsx')

# Prepare dropdown options for the second dataset
dropdown_options = [{'label': weather, 'value': weather} for weather in df2['weatherdata'].unique()]

# Descriptions for each weather data
weather_data_descriptions = {
    'MSP Weather Station': 'Provides historical data for the past 24h. It is located at the Faculty of Science and Engineering in Maastricht.',
    'Meteostat': 'Composes a historical weather dataset from various members of the World Meteorological Organization (WMO), which can be used for free. Data for the Maastricht area comes from the Royal Netherlands Meteorological Institute (KNMI) and is free to use.',
    'Open Meteo': 'Compiles historical weather data from weather stations, aircrafts, buoys, radars, and satellite observations, which can be used for free. This platform also uses mathematical models to fill in the gaps in the information in order to create a complete dataset, which can be downloaded for free.',
    'Visual Crossing': 'Uses information from over 100,000 weather observation stations (both satellite and maritime sources). For Maastricht weather, data is taken from 5 weather stations in the surrounding areas, this information is combined into one dataset that can be downloaded for free for any location.',
    'WeatherAPI': 'Data is taken from various data providers, government and meteorological agencies. It can be accessed in a JSON format depending on the paid plan chosen. A Pro Plus plan has been used. ',
    'World Weather Online': 'Takes raw data from multiple sources including European Centre for Medium-Range Weather Forecasts and the World Meteorological Organization to train a model that predicts the weather. The data from this source is not actual recorded data, but predictions made by their model. It is a paid resource.'
}

app = Dash()

app.layout = html.Div([
    html.H1(children='Climate Data Analysis', className='header'),
    
    # HISTORICAL
    html.Div([
        html.H3(children='Historical Data', className='section-title'),
        dcc.Dropdown(
            options=date_options1,
            value=dates1[0] if len(dates1) > 0 else None,
            id='date-dropdown',
            className='custom-dropdown', 
            ),
        dcc.Dropdown(
            options=weatherdata_options1,
            value=weatherdata1[0] if len(weatherdata1) > 0 else None,
            id='weatherdata-dropdown',
            className='custom-dropdown',
            ),
        html.Div(id='weatherdata-description', className='description-area'),  # New description area
        dcc.RadioItems(
            options=[
                {'label': 'Temperature', 'value': 'Temperature(°C)'},
                {'label': 'Feels Like Temperature', 'value': 'Feels like Temperature(°C)'},
                {'label': 'Humidity', 'value': 'Humidity(%)'},
                {'label': 'Wind speed', 'value': 'Wind speed(m/s)'},
                {'label': 'Rain', 'value': 'Rain (mm)'},
                {'label': 'Barometric Pressure', 'value': 'Barometric pressure(hPa)'}
                ],
            value='Temperature(°C)',
            id='data-type-selection',
            className='radio-items-container'  
        ),
        dcc.Graph(id='weather-graph')  # First graph placeholder for weather data
    ], className='section-container'),

    # PREDICTED
    html.Div([
        html.H3(children='Predicted Data', className='section-title'),
        dcc.Dropdown(
            options=date_options3,
            value=dates3[0] if len(dates3) > 0 else None,
            id='date-dropdown2',
            className='custom-dropdown', 
            ),
        dcc.Dropdown(
            options=weatherdata_options3,
            value=weatherdata3[0] if len(weatherdata3) > 0 else None,
            id='weatherdata-dropdown2',
            className='custom-dropdown',

            ),
        dcc.RadioItems(
            options=[
                {'label': 'Temperature', 'value': 'Temperature(°C)'},
                {'label': 'Feels Like Temperature', 'value': 'Feels like Temperature(°C)'},
                {'label': 'Humidity', 'value': 'Humidity(%)'},
                {'label': 'Wind speed', 'value': 'Wind speed(m/s)'},
                {'label': 'Rain', 'value': 'Rain (mm)'},
                {'label': 'Barometric Pressure', 'value': 'Barometric pressure(hPa)'}
                ],
            value='Temperature(°C)',
            id='data-type-selection2',
            className='radio-items-container'  
        ),
        dcc.Graph(id='weather-graph2')  # second graph placeholder for weather data
    ], className='section-container'),
    
    # SNOW
    html.Div([
        html.H3(children='Snow day!!!', className='section-title'),
        dcc.RadioItems(
            options=[
                {'label': 'Temperature', 'value': 'temperature'},
                {'label': 'Precipitation and Snow', 'value': 'precipitation'}
            ],
            value='temperature',
            id='climate-data-type-selection',
            className='radio-items-container'  
        ),
        dcc.Dropdown(
            options=dropdown_options,
            value='Observed temperature',  # default value
            id='climate-dropdown-selection',
            className='custom-dropdown'
        ),
        dcc.Graph(id='climate-graph')  # third graph placeholder for climate data
    ], className='section-container')
])

# First callback for Weather Data graph
@app.callback(
    Output('weather-graph', 'figure'),
    Input('data-type-selection', 'value'),
    Input('date-dropdown', 'value'),
    Input('weatherdata-dropdown', 'value')
)
def update_weather_graph(data_type, selected_date, selected_weatherdata):
    try:
        selected_date = pd.to_datetime(selected_date)
        df_observed = df1[(df1['date'] == selected_date) & (df1['weatherdata'] == 'MSP Weather Station')]
        df_selected = df1[(df1['date'] == selected_date) & (df1['weatherdata'] == selected_weatherdata)]
        
        figure = go.Figure()
        figure.add_trace(
            go.Scatter(
                x=df_observed['Time'],
                y=df_observed[data_type],
                mode='lines',
                name=f'MSP Weather Station ({data_type})',
                line=dict(color='blue')
            )
        )
        figure.add_trace(
            go.Scatter(
                x=df_selected['Time'],
                y=df_selected[data_type],
                mode='lines',
                name=f'{selected_weatherdata} ({data_type})',
                line=dict(color='red')
            )
        )
        figure.update_layout(
            title=f"{data_type} on {selected_date.strftime('%Y-%m-%d')}",
            xaxis_title="Time",
            yaxis_title=data_type,
            showlegend=True
        )
        return figure
    except Exception as e:
        print(f"Error in callback: {e}")
        return go.Figure()
    
@app.callback(
    Output('weather-graph2', 'figure'),
    Input('data-type-selection2', 'value'),
    Input('date-dropdown2', 'value'),
    Input('weatherdata-dropdown2', 'value')
)
def update_prediction_graph(data_type, selected_date, selected_weatherdata):
    try:
        selected_date = pd.to_datetime(selected_date)
        df_observed = df3[(df3['date'] == selected_date) & (df3['weatherdata'] == 'MSP Weather Station')]
        df_selected = df3[(df3['date'] == selected_date) & (df3['weatherdata'] == selected_weatherdata)]
        
        figure = go.Figure()
        figure.add_trace(
            go.Scatter(
                x=df_observed['Time'],
                y=df_observed[data_type],
                mode='lines',
                name=f'MSP Weather Station ({data_type})',
                line=dict(color='blue')
            )
        )
        figure.add_trace(
            go.Scatter(
                x=df_selected['Time'],
                y=df_selected[data_type],
                mode='lines',
                name=f'{selected_weatherdata} ({data_type})',
                line=dict(color='red')
            )
        )
        figure.update_layout(
            title=f"{data_type} on {selected_date.strftime('%Y-%m-%d')}",
            xaxis_title="Time",
            yaxis_title=data_type,
            showlegend=True
        )
        return figure
    except Exception as e:
        print(f"Error in callback: {e}")
        return go.Figure()

#third app callback
@app.callback(
    Output('climate-graph', 'figure'),
    Input('climate-data-type-selection', 'value'),
    Input('climate-dropdown-selection', 'value')
)
def update_climate_graph(data_type, dropdown_value):
    try:
        # Filter observed and selected datasets
        df_observed = df2[df2['weatherdata'] == 'Observed temperature']
        df_selected = df2[df2['weatherdata'] == dropdown_value]

        figure = go.Figure()

        # Add trace for precipitation if selected
        if data_type in ['precipitation', 'snow']:
            figure.add_trace(
                go.Scatter(
                    x=df_observed['Time'],
                    y=df_observed['precipitation'],
                    mode='lines',
                    name='Observed Precipitation',
                    line=dict(color='blue')  # Dashed blue line
                )
            )
            figure.add_trace(
                go.Scatter(
                    x=df_selected['Time'],
                    y=df_selected['precipitation'],
                    mode='lines',
                    name=f'{dropdown_value} Precipitation',
                    line=dict(color='green')  # Solid green line
                )
            )
            figure.add_trace(
                go.Scatter(
                    x=df_observed['Time'],
                    y=df_observed['snow'],
                    mode='lines',
                    name='Observed Snow',
                    line=dict(color='red')  # Dashed purple line
                )
            )
            figure.add_trace(
                go.Scatter(
                    x=df_selected['Time'],
                    y=df_selected['snow'],
                    mode='lines',
                    name=f'{dropdown_value} Snow',
                    line=dict(color='orange')  # Solid orange line
                )
            )
        else:
            # Add trace 
            figure.add_trace(
                go.Scatter(
                    x=df_observed['Time'],
                    y=df_observed[data_type],
                    mode='lines',
                    name=f'Observed {data_type.capitalize()}',
                    line=dict(color='blue')
                )
            )
            figure.add_trace(
                go.Scatter(
                    x=df_selected['Time'],
                    y=df_selected[data_type],
                    mode='lines',
                    name=f'{dropdown_value} {data_type.capitalize()}',
                    line=dict(color='red')
                )
            )

        # Update layout
        figure.update_layout(
            title=f"{data_type.capitalize()} and Snow/Precipitation over Time",
            xaxis_title="Time",
            yaxis_title="Value",
            showlegend=True
        )

        return figure
    except Exception as e:
        print(f"Error in callback: {e}")
        return go.Figure()

@app.callback(
    Output('weatherdata-description', 'children'),
    Input('weatherdata-dropdown', 'value')
)
def update_weatherdata_description(selected_weatherdata):
    if selected_weatherdata in weather_data_descriptions:
        return f"{weather_data_descriptions[selected_weatherdata]}"
    return "No information available for the selected weather data."

if __name__ == '__main__':
    app.run(debug=True)