import SwiftUI

struct SettingsView: View {
    @State private var selection: SettingsSection? = .general

    var body: some View {
        NavigationSplitView {
            List(SettingsSection.allCases, selection: $selection) { section in
                Label(section.title, systemImage: section.icon)
                    .tag(section)
            }
            .navigationTitle("Settings")
        } detail: {
            Group {
                switch selection {
                case .general:
                    GeneralSettingsView()

                case .helpmellow:
                    HelpMellowSettingsView()

                case .none:
                    ContentUnavailableView(
                        "Select a setting page",
                        systemImage: "gear"
                    )
                }
            }
        }
    }
}

enum SettingsSection: String, CaseIterable, Identifiable {
    case general
    case helpmellow

    var id: String { rawValue }

    var title: String {
        switch self {
        case .general: return "General"
        case .helpmellow: return "Help Mellow"
        }
    }

    var icon: String {
        switch self {
        case .general: return "gear"
        case .helpmellow: return "hand.thumbsup"
        }
    }
}

#Preview {
    SettingsView()
}
