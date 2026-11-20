import SwiftUI

@main
struct UmrahCompanionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

private enum UmrahStyle {
    static let background = Color(red: 0.035, green: 0.035, blue: 0.035)
    static let panel = Color(red: 0.095, green: 0.088, blue: 0.070)
    static let gold = Color(red: 0.83, green: 0.67, blue: 0.34)
    static let muted = Color.white.opacity(0.65)
}

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            GuideView()
                .tabItem { Label("Umrah", systemImage: "book.closed.fill") }
            DuasView()
                .tabItem { Label("Duas", systemImage: "hands.sparkles.fill") }
            PlannerView()
                .tabItem { Label("Planner", systemImage: "checklist") }
            TravelView()
                .tabItem { Label("Travel", systemImage: "airplane") }
        }
        .tint(UmrahStyle.gold)
        .background(UmrahStyle.background)
    }
}

struct ScreenTitle: View {
    let eyebrow: String
    let title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(eyebrow.uppercased())
                .font(.system(size: 10, weight: .semibold, design: .rounded))
                .tracking(2.2)
                .foregroundStyle(UmrahStyle.gold)
            Text(title)
                .font(.system(size: 30, weight: .semibold, design: .serif))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GoldCard<Content: View>: View {
    @ViewBuilder var content: Content
    var body: some View {
        VStack(alignment: .leading, spacing: 12) { content }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(UmrahStyle.panel)
            .overlay(RoundedRectangle(cornerRadius: 18).stroke(UmrahStyle.gold.opacity(0.28), lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("ASSALAMU ALAIKUM")
                                .font(.system(size: 10, weight: .bold)).tracking(2).foregroundStyle(UmrahStyle.gold)
                            Text("Your Umrah journey")
                                .font(.system(size: 29, weight: .semibold, design: .serif))
                        }
                        Spacer()
                        Image(systemName: "moon.stars.fill")
                            .font(.system(size: 25)).foregroundStyle(UmrahStyle.gold)
                    }
                    ZStack(alignment: .bottomLeading) {
                        LinearGradient(colors: [Color(red: 0.25, green: 0.19, blue: 0.09), .black], startPoint: .topTrailing, endPoint: .bottomLeading)
                        VStack(alignment: .leading, spacing: 9) {
                            Text("A JOURNEY OF A LIFETIME")
                                .font(.system(size: 10, weight: .bold)).tracking(2).foregroundStyle(UmrahStyle.gold)
                            Text("Prepare your heart.\nPlan your journey.")
                                .font(.system(size: 27, weight: .medium, design: .serif))
                            Text("Practical guidance for pilgrims travelling from the UK.")
                                .font(.subheadline).foregroundStyle(.white.opacity(0.75))
                        }.padding(22)
                    }
                    .frame(height: 190)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    ScreenTitle(eyebrow: "Start here", title: "Your essentials")
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        HomeTile(icon: "book.closed", title: "Umrah guide", subtitle: "Step-by-step rituals")
                        HomeTile(icon: "hands.sparkles", title: "Duas", subtitle: "Arabic & translation")
                        HomeTile(icon: "map", title: "Makkah & Madinah", subtitle: "Places to visit")
                        HomeTile(icon: "suitcase", title: "Packing list", subtitle: "Get travel-ready")
                    }
                    GoldCard {
                        Label("A note for UK travellers", systemImage: "info.circle")
                            .foregroundStyle(UmrahStyle.gold).font(.headline)
                        Text("Check the latest entry requirements, visa conditions, health advice and booking rules before you travel. Requirements can change.")
                            .font(.subheadline).foregroundStyle(UmrahStyle.muted)
                    }
                }
                .padding(20)
            }
            .background(UmrahStyle.background)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct HomeTile: View {
    let icon: String; let title: String; let subtitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon).font(.title2).foregroundStyle(UmrahStyle.gold)
            Text(title).font(.headline).foregroundStyle(.white)
            Text(subtitle).font(.caption).foregroundStyle(UmrahStyle.muted)
        }
        .frame(maxWidth: .infinity, minHeight: 105, alignment: .leading)
        .padding(14)
        .background(UmrahStyle.panel)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(UmrahStyle.gold.opacity(0.2), lineWidth: 1))
    }
}

struct GuideStep: Identifiable {
    let id: Int; let title: String; let detail: String
}

struct GuideView: View {
    private let steps = [
        GuideStep(id: 1, title: "Enter Ihram", detail: "Prepare for Ihram before crossing the relevant Miqat. Make your intention for Umrah and begin reciting the Talbiyah. Follow qualified guidance for your circumstances."),
        GuideStep(id: 2, title: "Perform Tawaf", detail: "When you reach Al-Masjid al-Haram, perform seven circuits around the Ka'bah, beginning in line with the Black Stone. Keep the area safe and avoid pushing."),
        GuideStep(id: 3, title: "Pray two rak'ahs", detail: "After Tawaf, pray two rak'ahs where it is safe and permitted. Follow mosque staff instructions and do not obstruct other worshippers."),
        GuideStep(id: 4, title: "Perform Sa'i", detail: "Walk between Safa and Marwah seven times, beginning at Safa and finishing at Marwah. Use the designated accessible routes if needed."),
        GuideStep(id: 5, title: "Complete your Umrah", detail: "Men shave or shorten the hair; women trim a small portion of hair. This completes Umrah and exits Ihram. Ask a trusted scholar if you are unsure about the rulings.")
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    ScreenTitle(eyebrow: "The rites", title: "Umrah, step by step")
                    Text("A simple overview to help you understand the main stages. For detailed rulings, consult a trusted scholar.")
                        .font(.subheadline).foregroundStyle(UmrahStyle.muted)
                    ForEach(steps) { step in
                        GoldCard {
                            HStack(alignment: .top, spacing: 13) {
                                Text("\(step.id)")
                                    .font(.system(size: 17, weight: .bold, design: .serif))
                                    .foregroundStyle(.black)
                                    .frame(width: 34, height: 34)
                                    .background(UmrahStyle.gold, in: Circle())
                                VStack(alignment: .leading, spacing: 7) {
                                    Text(step.title).font(.headline)
                                    Text(step.detail).font(.subheadline).foregroundStyle(UmrahStyle.muted)
                                }
                            }
                        }
                    }
                }.padding(20)
            }
            .background(UmrahStyle.background)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct Dua: Identifiable {
    let id: Int; let title: String; let arabic: String; let transliteration: String; let meaning: String
}

struct DuasView: View {
    private let duas = [
        Dua(id: 1, title: "Talbiyah", arabic: "لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ", transliteration: "Labbayka Allahumma labbayk, labbayka la sharika laka labbayk.", meaning: "Here I am, O Allah, here I am. You have no partner; here I am.") ,
        Dua(id: 2, title: "A well-known supplication", arabic: "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ", transliteration: "Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan wa qina adhaban-nar.", meaning: "Our Lord, grant us good in this world and good in the Hereafter, and protect us from the punishment of the Fire.")
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    ScreenTitle(eyebrow: "Words of remembrance", title: "Duas & supplications")
                    Text("There is no single required supplication for every circuit of Tawaf. Make sincere dua in your own words too.")
                        .font(.subheadline).foregroundStyle(UmrahStyle.muted)
                    ForEach(duas) { dua in
                        GoldCard {
                            Text(dua.title.uppercased()).font(.caption.weight(.bold)).tracking(1.4).foregroundStyle(UmrahStyle.gold)
                            Text(dua.arabic).font(.system(size: 25)).multilineTextAlignment(.trailing).frame(maxWidth: .infinity, alignment: .trailing).padding(.vertical, 8)
                            Text(dua.transliteration).font(.subheadline).italic().foregroundStyle(UmrahStyle.muted)
                            Divider().overlay(UmrahStyle.gold.opacity(0.3))
                            Text(dua.meaning).font(.subheadline)
                        }
                    }
                    Text("Translations and transliterations are provided as learning aids. Check Arabic wording with a reliable source.")
                        .font(.caption).foregroundStyle(UmrahStyle.muted)
                }.padding(20)
            }
            .background(UmrahStyle.background)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct PlannerView: View {
    @State private var checkedItems: Set<String> = []
    @State private var flightBudget = ""
    @State private var hotelBudget = ""
    @State private var transportBudget = ""
    @State private var otherBudget = ""
    private let items = ["Passport and required travel documents", "Visa / entry requirements checked", "Flights and accommodation confirmed", "Travel insurance arranged", "Ihram clothing and comfortable footwear", "Medication and personal essentials", "Nusuk app and relevant bookings checked", "Emergency contacts saved"]
    private var total: Double { [flightBudget, hotelBudget, transportBudget, otherBudget].compactMap(Double.init).reduce(0, +) }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    ScreenTitle(eyebrow: "Get organised", title: "Your trip planner")
                    GoldCard {
                        HStack {
                            Text("Packing & preparation").font(.headline)
                            Spacer()
                            Text("\(checkedItems.count)/\(items.count)").foregroundStyle(UmrahStyle.gold).font(.subheadline.monospacedDigit())
                        }
                        ProgressView(value: Double(checkedItems.count), total: Double(items.count)).tint(UmrahStyle.gold)
                        ForEach(items, id: \.self) { item in
                            Button {
                                if checkedItems.contains(item) { checkedItems.remove(item) } else { checkedItems.insert(item) }
                            } label: {
                                HStack(spacing: 10) {
                                    Image(systemName: checkedItems.contains(item) ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(checkedItems.contains(item) ? UmrahStyle.gold : UmrahStyle.muted)
                                    Text(item).foregroundStyle(.white).font(.subheadline)
                                    Spacer(minLength: 0)
                                }
                            }.buttonStyle(.plain)
                        }
                    }
                    GoldCard {
                        Text("Budget calculator").font(.headline)
                        Text("Enter estimates in pounds (£)").font(.caption).foregroundStyle(UmrahStyle.muted)
                        BudgetField(title: "Flights", value: $flightBudget)
                        BudgetField(title: "Hotels", value: $hotelBudget)
                        BudgetField(title: "Transport", value: $transportBudget)
                        BudgetField(title: "Food & other", value: $otherBudget)
                        Divider().overlay(UmrahStyle.gold.opacity(0.3))
                        HStack { Text("Estimated total").font(.headline); Spacer(); Text(total, format: .currency(code: "GBP")).font(.title3.bold()).foregroundStyle(UmrahStyle.gold) }
                    }
                }.padding(20)
            }
            .background(UmrahStyle.background)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct BudgetField: View {
    let title: String
    @Binding var value: String
    var body: some View {
        HStack {
            Text(title).font(.subheadline)
            Spacer()
            TextField("£0", text: $value)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .frame(width: 110)
                .padding(9)
                .background(Color.white.opacity(0.07), in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct TravelView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    ScreenTitle(eyebrow: "Before you go", title: "Travel from the UK")
                    TravelInfoCard(icon: "doc.text", title: "Visas & entry", detail: "Check which Saudi entry route applies to your nationality, passport and trip. Confirm current fees, validity, insurance requirements and Umrah eligibility through official Saudi channels before paying.")
                    TravelInfoCard(icon: "train.side.front.car", title: "Getting between the holy cities", detail: "Compare the Haramain High Speed Railway, private transfers and other transport options between Makkah, Madinah and the airports. Check current timetables and baggage rules.")
                    TravelInfoCard(icon: "building.2", title: "Choosing a hotel", detail: "Compare walking distance, shuttle services, room occupancy, cancellation terms and whether the hotel is closer to the Haram entrances you expect to use.")
                    TravelInfoCard(icon: "heart.text.square", title: "Health & safety", detail: "Review current UK government travel advice and health guidance. Keep prescribed medicines in original packaging and carry relevant documentation.")
                    GoldCard {
                        Text("Useful official resources").font(.headline).foregroundStyle(UmrahStyle.gold)
                        Link(destination: URL(string: "https://www.gov.uk/foreign-travel-advice/saudi-arabia")!) { Label("UK FCDO travel advice", systemImage: "arrow.up.right.square") }
                        Link(destination: URL(string: "https://www.nusuk.sa/")!) { Label("Nusuk official platform", systemImage: "arrow.up.right.square") }
                        Link(destination: URL(string: "https://visa.visitsaudi.com/")!) { Label("Saudi eVisa portal", systemImage: "arrow.up.right.square") }
                    }
                }.padding(20)
            }
            .background(UmrahStyle.background)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct TravelInfoCard: View {
    let icon: String; let title: String; let detail: String
    var body: some View {
        GoldCard {
            Label(title, systemImage: icon).font(.headline).foregroundStyle(UmrahStyle.gold)
            Text(detail).font(.subheadline).foregroundStyle(UmrahStyle.muted)
        }
    }
}

#Preview {
    ContentView()
}
