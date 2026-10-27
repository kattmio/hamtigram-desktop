# Repository guidance

## Project shape

- This is a small Tauri 2 desktop shell for the existing HamtiGram web messenger.
- The app loads `https://messenger-hamtigram.hamtik26k.workers.dev/`; the web client and message service are not implemented in this repository.
- Keep changes focused on the desktop shell. Do not add a second messaging backend or copy web-client behavior into this repository unless the task explicitly calls for it.
- The main Tauri configuration is in `src-tauri/tauri.conf.json`; Rust startup code is in `src-tauri/src/main.rs`; Tauri permissions are in `src-tauri/capabilities/`.

## Product behavior

- Preserve the existing web messenger, account flow, and service as the source of conversations and messages.
- Web Notifications API requests should be delivered as native OS notifications through the Tauri notification plugin: Windows toast notifications on Windows 10 and newer, and the Linux desktop notification service (libnotify-compatible) on Linux.
- A message notification is expected to carry the sender name, message text, sender avatar when provided by the web client, and its arrival time. Keep the web notification payload intact where the native platform supports it; do not invent message contents locally.
- Windows installers use NSIS and include the offline WebView2 installer. Linux packages are `.deb` and `.rpm` and require WebKitGTK 4.1 at runtime.

## Development

- Install JavaScript dependencies with `npm ci`.
- Run the desktop app with `npm run tauri dev`.
- Build Linux packages with `npm run tauri build -- --bundles deb,rpm`.
- Build the Windows installer with `npm run tauri build -- --bundles nsis`.
- Keep `package-lock.json` and `src-tauri/Cargo.lock` in sync with dependency changes. Do not hand-edit generated lockfile data; regenerate it with the relevant package manager when network access is available.
- Linux CI uses Node.js 22, stable Rust, and Tauri's WebKitGTK 4.1 system dependencies. Windows CI uses Windows Server 2022.

## Change guidance

- Follow the existing Russian-language user-facing copy and keep code identifiers and comments clear and conventional.
- Keep Tauri capabilities narrow and scoped to the `main` window. Add permissions only when required by the feature.
- Do not commit build output, `node_modules`, secrets, local machine configuration, or downloaded installers.
- Update `README.md` when changing user-visible behavior, supported platforms, dependencies, or build instructions.
