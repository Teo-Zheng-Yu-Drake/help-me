import SwiftUI

struct Event {
    var name: String
    var date: String
    var location: String
}

struct ContentView: View {
    @State var events: [Event] = []
    @State var eventName = ""
    @State var eventDate = ""
    @State var eventLocation = ""
    @State var sheetShown = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("ching chong")
                
                List(events, id: \.name) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        Text(event.name)
                    }
                }
                
                TextField("Event Name", text: $eventName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Event Date", text: $eventDate) 
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Event Location", text: $eventLocation)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button("Add Event") {
                    events.append(Event(name: eventName, date: eventDate, location: eventLocation))
                    eventName = ""
                    eventDate = ""
                    eventLocation = ""
                }
                
                Button(action: {
                    sheetShown.toggle()
                }) {
                    Text("Show Event Details")
                }
            }
            .sheet(isPresented: $sheetShown) {
                if let selectedEvent = events.first {
                    EventDetailSheet(event: selectedEvent)
                }
            }
            .navigationTitle("Event Department")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct EventDetailView: View {
    var event: Event
    
    var body: some View {
        VStack {
            Text("Event: \(event.name)")
                .navigationTitle("Event Details")
            Text("Date: \(event.date)")
            Text("Location: \(event.location)")
        }
    }
}

struct EventDetailSheet: View {
    var event: Event
    
    var body: some View {
        VStack {
            Text("Event: \(event.name)")
            Text("Date: \(event.date)")
            Text("Location: \(event.location)")
        }
        .padding()
    }
}
