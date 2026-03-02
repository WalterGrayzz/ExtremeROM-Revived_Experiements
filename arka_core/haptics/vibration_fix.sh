#!/bin/bash
# ============================================================
# ARKA CORE - HAPTIC MODULE
# ------------------------------------------------------------
# CREATED AND DEVELOPED BY: GhasemzadehFard-Dev
# ============================================================

TARGET="./out/target/r8s/apktool/system/framework/framework.jar/smali_classes6/com/samsung/android/vibrator/VibRune.smali"

if [ -f "$TARGET" ]; then
    if grep -q "GhasemzadehFard-Dev" "$TARGET"; then
        echo ">> [ARKA_CORE] Haptic: Already patched."
    else
        echo ">> [ARKA_CORE] Applying Haptic Patch..."
        sed -i '82s/^\(.*\)$/# \1\n    const\/4 v0, 0x1 # CREATED AND DEVELOPED BY: GhasemzadehFard-Dev/' "$TARGET"
    fi
else
    echo ">> [ARKA_CORE] [ERROR] VibRune.smali NOT FOUND!"
fi
