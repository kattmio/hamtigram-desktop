# HamtiGram Desktop

An open source desktop wrapper for the existing HamtiGram Messenger web app. It opens the same service used by the Android client in a resizable native window and uses the Android app icon and dark indigo palette (`#1A1A2E`, accent `#4F46E5`). Sign in with the same account; messages stay on the existing HamtiGram service.

The Android folder supplied with this project is a decompiled APK resource dump rather than Android source code. Its `website_url`, app name, icon, and colors identify the app as a WebView client of the same site, so this desktop client keeps that behavior instead of inventing a separate messaging backend.

## Requirements

- Rust and the platform prerequisites for [Tauri 2](https://v2.tauri.app/start/prerequisites/)
- Node.js and npm

## Run

```sh
npm install
npm run tauri dev
```

## Build packages

```sh
npm run tauri build -- --bundles deb,rpm
```

For Windows, run `npm run tauri build -- --bundles nsis` from Windows with the Tauri build prerequisites installed. This produces the NSIS `*-setup.exe` installer. GitHub Actions builds `.deb`, `.rpm`, and the Windows setup executable on every push.

The packages are written to `src-tauri/target/release/bundle/`.

### Windows requirements

The setup file checks for Windows 10 build 10240 or newer and bundles Microsoft's offline WebView2 installer, so installation does not need to download the runtime. Tauri documents this bundle as adding about 127 MB to the installer. Windows 10 (April 2018 / version 1803) and later already include WebView2, so the bundled installer can skip installation when the runtime is present.

## Publish

This folder is intended to become a public GitHub repository. After creating a public repository under your GitHub account, push this folder's Git history to it. The build is a desktop shell around the hosted HamtiGram site, so it needs an internet connection to load chats and sign in.
