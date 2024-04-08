
import SwiftUI
import ComposableArchitecture
import DesignKit
import Shared

public struct MainView: View {
    
    @Bindable var store: StoreOf<Search>
    
    public var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("readMe")
                    .padding()
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField(
                        "NewYork, San Francisco, ...", text: $store.searchQuery.sending(\.searchQueryChange)
                    )
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                }
                .padding(.horizontal, 16)
                
                List {
                    ForEach(store.result) { location in
                        VStack(alignment: .leading) {
                            Button {
                                store.send(.searchResultTapped(location))
                            } label : {
                                HStack {
                                    Text(location.name)
                                    
                                    if store.resultForecastRequestInFlight?.id == location.id {
                                        ProgressView()
                                    }
                                }
                            }
                            
                            if location.id == store.weather?.id {
                                
                            }
                        }
                    }
                }
                
                Button("Weather API provided by Open-Meteo") {
                    UIApplication.shared.open(URL(string: "https://open-meteo.com/en")!)
                }
                .foregroundColor(.gray)
                .padding(.all, 16)
            }
            .navigationTitle("Search")
        }
        .task(id: store.searchQuery) {
            do {
                try await Task.sleep(for: .milliseconds(300))
                await store.send(.searchQueryCangeDebounced).finish()
            } catch {}
        }
        .ignoresSafeArea(.all)
    }
    
    @ViewBuilder
    func weatherView(locationWeather: Search.State.Weather?) -> some View {
        if let locationWeather {
            let days = locationWeather.days
                .enumerated()
                .map { idx, weather in formattedWeather(day: weather, isToday: idx == 0) }
            
            VStack(alignment: .leading) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                }
            }
            .padding(.leading, 16)
        }
    }
    
    private func formattedWeather(day: Search.State.Weather.Day, isToday: Bool) -> String {
        let date =
        isToday
        ? "Today"
        : dateFormatter.string(from: day.date).capitalized
        let min = "\(day.temperatureMin)\(day.temperatureMinUnit)"
        let max = "\(day.temperatureMax)\(day.temperatureMaxUnit)"
        
        return "\(date), \(min) – \(max)"
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
}


#Preview {
    return MainView(
        store: Store(initialState: Search.State()) {
            Search()
        }
    )
}
