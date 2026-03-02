#!/bin/bash
# ============================================================
# ARKA CORE - MASTER COMMANDER
# ------------------------------------------------------------
# CREATED AND DEVELOPED BY: GhasemzadehFard-Dev
# ============================================================

BASE_DIR="./arka_core"

echo ">> [ARKA_CORE] Master Patcher found! Executing..."

# 1. Haptic Module
if [ -f "$BASE_DIR/haptics/vibration_fix.sh" ]; then
    bash "$BASE_DIR/haptics/vibration_fix.sh"
fi

# 2. Display Module
if [ -f "$BASE_DIR/display/brightness_fix.sh" ]; then
    bash "$BASE_DIR/display/brightness_fix.sh"
fi

# 3. Smart Call (CSC) Module
if [ -f "$BASE_DIR/csc/smartcall_fix.sh" ]; then
    bash "$BASE_DIR/csc/smartcall_fix.sh"
fi

# 4. ODEX & VDEX Cleanup (Force System to use Patched Smali)
echo ">> [ARKA_CORE] Executing ODEX/VDEX Cleanup..."
find "./out/target/r8s/system" -type f \( -name "services.odex" -o -name "services.vdex" -o -name "framework.odex" -o -name "framework.vdex" -o -name "SecSettings.odex" -o -name "SecSettings.vdex" \) -delete 2>/dev/null
echo ">> [ARKA_CORE] ODEX Cleanup Complete!"
