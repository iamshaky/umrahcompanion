# Umrah Companion – iOS starter

A SwiftUI starter app for UK travellers planning Umrah. It includes a luxury black-and-gold interface, home dashboard, introductory Umrah guide, dua cards, preparation checklist, GBP budget calculator and UK-focused travel guidance.

## Cloud build (Windows/iPhone friendly)

This repository includes `codemagic.yaml` and `project.yml`. Codemagic uses a macOS build machine; XcodeGen creates the Xcode project from `project.yml`, then the workflow performs an unsigned compile check.

1. Upload all files in this folder to the root of the GitHub repository.
2. In Codemagic, refresh/select the `umrahcompanion` repository.
3. Start the `Umrah Companion - iOS build check` workflow.
4. This first workflow checks compilation only. It does not create an installable signed app or submit to TestFlight/App Store.

## Before device testing or App Store release

- Replace `com.example.umrahcompanion` in `project.yml` with a unique bundle identifier.
- Configure Apple Developer signing and App Store Connect integration in Codemagic when ready.
- Add app icon, launch experience, privacy policy, privacy disclosures, accessibility review and App Store screenshots.
- Verify religious guidance with qualified sources. Visa rules, fees, insurance, health requirements, opening times and booking availability change; use current official sources.

The checklist is currently held in view state and resets when the app relaunches. Persistent storage and further testing are still needed for a production release.
