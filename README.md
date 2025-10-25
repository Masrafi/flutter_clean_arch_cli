🧾 README.md
# 🧱 flutter_clean_arch_cli

A powerful and developer-friendly **Flutter CLI tool** to generate Clean Architecture folder structures automatically.  
No more repetitive setup — focus on building features, not folders!

---

## 🚀 Features

✅ Automatically creates:
- `config/`, `core/`, and `feature/` directories (if missing)
- Complete **Clean Architecture** folder tree for your feature
- Dart files with feature-prefixed names and class templates
- Smart “recovery” mode — only missing files/folders are created
- `--force` option to rebuild a feature completely
- Beautiful CLI output with emojis and clean messages

---

## 🧩 Folder Structure Example

Command:
```bash
flutter_clean_arch create login


Output:

lib/
 ├── config/
 ├── core/
 └── feature/
      └── login/
           ├── data/
           │    ├── data_source/login_api_service.dart
           │    ├── model/login_model.dart
           │    └── repository/login_repository_impl.dart
           ├── domain/
           │    ├── entities/login_entity.dart
           │    ├── repository/login_repository.dart
           │    └── usecases/login_usecase.dart
           └── presentation/
                ├── bloc/
                │    ├── login_bloc.dart
                │    ├── login_event.dart
                │    └── login_state.dart
                ├── screen/login_screen.dart
                └── widgets/login_widget.dart
```

---

## ⚙️ Installation
1️⃣ Activate globally
- dart pub global activate flutter_clean_arch_cli

2️⃣ Verify installation
- flutter_clean_arch


You should see:

🧱 Flutter Clean Architecture CLI
Usage:
- flutter_clean_arch init
- flutter_clean_arch create <feature>
- flutter_clean_arch create <feature> -f

## 🧠 Usage
🏗️ Initialize project
- flutter_clean_arch init


Creates config/, core/, and feature/ directories if missing.

✨ Create a feature
- flutter_clean_arch create login

🔁 Repair missing files

If you delete any files, running the same command will recreate missing ones only.

♻️ Force recreate feature
- flutter_clean_arch create login --force


Deletes and rebuilds the feature from scratch.

🧰 Example Output
⚙️  Checking base folders...
📁 Created missing base folder: lib/config
📁 Created missing base folder: lib/core
📁 Created missing base folder: lib/feature
📁 Created: lib/feature/login/data/model
📝 Created: lib/feature/login/data/model/login_model.dart
✅ Feature "login" created/updated successfully!