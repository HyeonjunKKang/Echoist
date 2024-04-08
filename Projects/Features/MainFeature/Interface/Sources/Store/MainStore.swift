import ComposableArchitecture
import SwiftUI
import Core

@Reducer
public struct Search {
    
    @ObservableState
    public struct State: Equatable {
        var result: [GeocodingSearch.Result] = []
        var resultForecastRequestInFlight: GeocodingSearch.Result?
        var searchQuery = ""
        var weather: Weather?
        
        struct Weather: Equatable {
            var id: GeocodingSearch.Result.ID
            var days: [Day]
            
            struct Day: Equatable {
                var date: Date
                var temperatureMax: Double
                var temperatureMaxUnit: String
                var temperatureMin: Double
                var temperatureMinUnit: String
            }
        }
    }
    
    public enum Action {
        case forecaseResponse(GeocodingSearch.Result.ID, Result<Forecast, Error>)
        case searchQueryChange(String)
        case searchQueryCangeDebounced
        case searchResponse(Result<GeocodingSearch, Error>)
        case searchResultTapped(GeocodingSearch.Result)
    }
    
    @Dependency(\.weatherClient) var weatherClient
    private enum CancelID { case location, weather }
    
    public var body: some Reducer<State, Action> {
        Reduce {
            state,
            action in
            
            switch action {
            case .forecaseResponse(_, .failure):
                state.weather = nil
                state.resultForecastRequestInFlight = nil
                return .none
                
            case let .forecaseResponse(id, .success(forecast)):
                state.weather = State.Weather(
                    id: id,
                    days: forecast.daily.time.indices.map {
                        State.Weather.Day(
                            date: forecast.daily.time[$0],
                            temperatureMax: forecast.daily.temperatureMax[$0],
                            temperatureMaxUnit: forecast.dailyUnits.temperatureMax,
                            temperatureMin: forecast.daily.temperatureMin[$0],
                            temperatureMinUnit: forecast.dailyUnits.temperatureMin
                        )
                    }
                )
                state.resultForecastRequestInFlight = nil
                return .none
                
            case let .searchQueryChange(query):
                state.searchQuery = query
                
                guard !state.searchQuery.isEmpty else {
                    state.result = []
                    state.weather = nil
                    return .cancel(id: CancelID.location)
                }
                
                return .none
                
            case .searchQueryCangeDebounced:
                guard !state.searchQuery.isEmpty else {
                    return .none
                }
                
                return .run { [query = state.searchQuery] send in
                    await send(.searchResponse(Result { try await self.weatherClient.search(query) }))
                }
                .cancellable(id: CancelID.location)
                
            case .searchResponse(.failure):
                state.result = []
                return .none
                
            case let .searchResponse(.success(response)):
                state.result = response.results
                return .none
                
            case let .searchResultTapped(location):
                state.resultForecastRequestInFlight = location
                
                return .run {
                    send in
                    await send(
                        .forecaseResponse(
                            location.id,
                            Result { try await self.weatherClient.forecast(location: location) }
                        )
                    )
                }
                .cancellable(id: CancelID.weather, cancelInFlight: true)
                
            }
        }
        
    }
}
