#!/bin/bash
# ============================================================
# ARKA CORE - DISPLAY & BRIGHTNESS MODULE
# ------------------------------------------------------------
# CREATED AND DEVELOPED BY: GhasemzadehFard-Dev
# ============================================================

TARGET_SMALI="./out/target/r8s/apktool/system_ext/priv-app/SystemUI/SystemUI.apk/smali_classes3/com/android/systemui/settings/brightness/BrightnessDetailAdapter.smali"

CUSTOM_SMALI="./arka_core/display/systemui/BrightnessDetailAdapter_Bypass.smali"

echo "----------------------------------------------------"
echo ">> [ARKA_CORE] RUNNING DISPLAY MODULE"
echo ">> DEVELOPED BY: GhasemzadehFard-Dev"
echo "----------------------------------------------------"

echo ">> Injecting SystemUI Brightness Bypass Patch..."

if [ -f "$CUSTOM_SMALI" ]; then
    cp -f "$CUSTOM_SMALI" "$TARGET_SMALI"
    echo ">> Display: SystemUI Patch Applied Successfully!"
else
    echo ">> [ERROR] Custom patch file NOT FOUND: $CUSTOM_SMALI"
    echo ">> Display: Skipping SystemUI Patch..."
fi
