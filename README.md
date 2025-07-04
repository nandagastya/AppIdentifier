# AppIdentifier

**AppIdentifier** is an iOS app built using Swift and SwiftUI that checks for the presence of popular apps installed on a user's device using known URL schemes. It displays the available apps along with their categories in a simple, user-friendly interface.

## 📱 Features

- Detects if popular apps (like Instagram, WhatsApp, YouTube, etc.) are installed.
- Displays the app name and category (e.g., Social, Productivity).
- Lightweight and privacy-friendly — no data is collected or sent.
- Built entirely using Swift and SwiftUI.

## 🛠️ Tech Stack

- **Swift**
- **SwiftUI**
- **Xcode**
- **URL Schemes (LSApplicationQueriesSchemes)**

## 🚀 Getting Started

### Prerequisites

- macOS with Xcode installed
- iOS Simulator or physical iPhone (real device preferred for checking actual installed apps)

## 🚀 Get Started in 60 Seconds

git clone https://github.com/nandagastya/AppIdentifier.git
cd AppIdentifier
open AppIdentifier.xcodeproj

1. Plug in your iPhone (yep, real device needed)
2. Hit ▶️ in Xcode
3. Watch the app work its magic 🧙‍♂️


🔍 How It Works (No Voodoo)
Under the hood, the app loops through a list of popular URL schemes (like instagram://, spotify://, etc.) and asks:

“Yo, iOS — can I open this?”

If the answer’s yes — boom, that app is on your phone.
If no — we skip it.

Simple. Slick. Safe. ✅

🧑‍💻 Author
Agastya Nand
🎓 B.Tech, Mathematics and Computing
📍 Delhi Technological University
