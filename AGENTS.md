
# AGENTS.md — (BZAN2165, Boston College)
Updated: Week 8 (after Mid-Term I)

## About this project and me
A beginner SwiftUI app. I am new to programming. I must be able to explain every line you write.

## How to work with me
- Begin every response with 😎 so I can see that you read this file.
- Make only the change I ask for. Do not rename, reorganize, or "improve" code I did not mention. If you notice a real bug in code I did not mention, tell me in one sentence, but do not fix it unless I ask.
- Plan first when a change is bigger than a few lines: if it adds a new import, adds a new @State variable, or touches more than one place in my code, first give me a short numbered plan in plain English (what you will add and why, one line each) and wait for me to say "go" before you write code. For a small change, just make the change.
- After you change code, list every line you added or changed and explain each one in one sentence a beginner can understand.
- After you add a feature, tell me one way to test it, including what should happen when the user cancels or something fails.
- If a feature cannot run in the Simulator (for example the camera, or a haptic vibration), say so before the code so I know to test it on my iPhone.
- If a feature needs a privacy permission description (for example the camera, microphone, or location), tell me the exact key name and where to add it in Xcode (the target's Info tab). Never skip it. (PhotosPicker does not need one.)

## What I have learned so far (updated every week)
- Views: Text, Image, Image(systemName:), Button, VStack, HStack, ZStack, Spacer, Circle, VStack(spacing:), Button { } label: { } when the label is only an Image, RoundedRectangle, and the controls that need a $ in front of a @State variable (a two-way binding): Toggle, TextField, ColorPicker, DatePicker, Stepper(_:value:in:), Slider(value:in:), Picker with a .tag on each row
- Modifiers: .font, .fontWeight, .bold, .foregroundStyle, .tint, .padding, .frame, .resizable, .scaledToFit, .buttonStyle(.glassProminent), .border, .background, .offset, .multilineTextAlignment, .minimumScaleFactor, .animation(_:value:), .clipShape, .shadow, .font(.system(size:)), Font.custom(_:size:), .lineLimit, .disabled, .textFieldStyle(.roundedBorder), .overlay, .stroke, .fill, .keyboardType(.numberPad), .focused($isFocused) with a @FocusState variable, .ignoresSafeArea() so a background color bleeds into the safe area, .labelsHidden() on a Toggle, .onChange(of:) (a first look — given on Mid-Term I), .onAppear (a first look — in the Mid-Term I solution)
- App setup: an app icon (AppIcon in the Assets catalog), a launch screen image (set in the target's Info tab), images and sounds added to the Assets catalog
- Swift: var, let, @State, String, Int, Double, Bool, arrays and [index], .count, .isEmpty, .randomElement(), Int.random(in:), ??, string interpolation "\( )", print, if / else if / else, && (and) and || (or) with parentheses to group, switch / case / default (cases with commas, cases with ranges), the ternary operator ? :, ! (not), % (remainder), Int division (27 / 13 is 2), type conversion Double( ) String( ) Int( ), for-in loops over a closed range 0...n, a half-open range 0..<n, or an array, .joined(separator:), .removeLast(n), .append, forEach with $0, functions with parameters, argument labels and return values, while, repeat…while, optionals (a type ending in ?), nil, optional chaining ?. (as in audioPlayer?.play()), if let, guard let, guard, throws and do / try / catch, error.localizedDescription, AVAudioPlayer and NSDataAsset for playing a sound, if inside a VStack to show or leave out a view (a first look — Mid-Term I), String(repeating:count:), for _ in when the loop variable is not needed, += to add on to a number or a String, a Color kept in a @State variable (Color.black, .green, .red) and used in .foregroundStyle
- This week I am learning these with your help — explain each one in a sentence the first time you use it: .onTapGesture, .scaleEffect, withAnimation and .spring, PhotosPicker and PhotosPickerItem, loadTransferable, Task and await
- Use only what is on this list when you can. If you must use something that is not on this list, say so before the code and explain it in one sentence a beginner can understand.

## Code rules for this course (current iOS only — no old APIs)
- SwiftUI only. Never UIKit. The one exception: when SwiftUI truly has no way to do something (for example, taking a photo with the camera), say "This needs UIKit because…" before the code, keep the UIKit part as small as possible in its own file named for what it does (for example CameraPicker.swift), and explain in one sentence what UIViewControllerRepresentable does.
- Buttons: Button("Title", systemImage: "symbol.name") { } when there is a symbol; otherwise Button("Title") { }. Style buttons with .buttonStyle(.glassProminent) and color them with .tint(...).
- Use .foregroundStyle(...). Never use .foregroundColor(...) — it is deprecated.
- Images live in the Assets catalog. Sounds live in the Assets catalog as data assets — load them with NSDataAsset, not Bundle.main.url.
- If my project already has a playSound(soundName:) function, call it as it is. Do not rewrite it.
- Keep all code in ContentView.swift unless I ask for a new file (or the UIKit exception above applies).
- Functions go below the closing curly brace of `var body`, never above it.
- To wait before doing something (a delay), use Task { } with try await Task.sleep(for: .seconds(0.75)) inside do / catch. Do not use DispatchQueue.main.asyncAfter.
- When something can fail (a value that might be nil, a file that might not load, a conversion that might not work), check it at the top of the function with `guard let` or `guard` and `return` early. Never let a failure do nothing silently.
- For a statement that can throw an error, use do / try / catch and print the error in the catch block. Do not use `try?` to hide the error, and never use `try!`.
- Every failed check or caught error prints one line to the console that begins with "😡 ERROR: " followed by what went wrong and the value involved. Examples: print("😡 ERROR: Could not read file named \(soundName)") and print("😡 ERROR: \(error.localizedDescription) creating AVAudioPlayer")
- Do not use force unwrapping (!) on optionals.
