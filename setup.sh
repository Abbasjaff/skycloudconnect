#!/bin/bash

# Automated setup script for Abbasjaff/skycloudconnect

REPO_URL="https://github.com/Abbasjaff/skycloudconnect.git"
REPO_NAME="skycloudconnect"

echo "== Step 1: Clone the repo =="
if [ -d "$REPO_NAME" ]; then
  echo "Repo already cloned."
else
  git clone "$REPO_URL"
fi

cd "$REPO_NAME" || exit 1

echo "== Step 2: Install dependencies =="
npm install

echo "== Step 3: Initialize Capacitor (if not already) =="
if [ ! -d "ios" ] && [ ! -d "android" ]; then
  npx cap init
else
  echo "Capacitor already initialized or platforms exist."i

echo "== Step 4: Add iOS and Android platforms =="
if [ ! -d "ios" ]; then
  npx cap add ios
fi
if [ ! -d "android" ]; then
  npx cap add android
fi

echo "== Step 5: Build web assets =="
npm run build

echo "== Step 6: Sync to native projects =="
npx cap sync

echo "== All done! =="
echo "To open iOS project: npx cap open ios (Mac + Xcode required)"
echo "To open Android project: npx cap open android (Android Studio required)"