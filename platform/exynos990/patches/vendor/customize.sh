LOG_STEP_IN "- Updating Vibrator/RIL/Face/WPA HALs"
# Delete hermes to get rid of weaver encryption blobs
BLOBS_LIST="
bin/hw/vendor.samsung.hardware.vibrator@2.2-service
etc/init/vendor.samsung.hardware.vibrator@2.2-service.rc
lib64/vendor.samsung.hardware.vibrator@2.0.so
lib64/vendor.samsung.hardware.vibrator@2.1.so
lib64/vendor.samsung.hardware.vibrator@2.2.so
bin/hw/vendor.samsung.hardware.biometrics.face@2.0-service
etc/init/vendor.samsung.hardware.biometrics.face@2.0-service.rc
bin/hermesd
etc/init/hermesd.rc
lib/liboemcrypto.so
"
for blob in $BLOBS_LIST
do
    DELETE_FROM_WORK_DIR "vendor" "$blob"
done

# ==========================================
# 1. RESTORE ALL VENDOR FEATURES
# These are the files that make Face Recognition and Vibration work
# ==========================================
ADD_TO_WORK_DIR "p3sxxx" "vendor" "bin/hw/vendor.samsung.hardware.biometrics.face@3.0-service"
ADD_TO_WORK_DIR "p3sxxx" "vendor" "bin/hw/vendor.samsung.hardware.vibrator-service"
ADD_TO_WORK_DIR "p3sxxx" "vendor" "lib64"
ADD_TO_WORK_DIR "p3sxxx" "vendor" "etc/init"
ADD_TO_WORK_DIR "p3sxxx" "vendor" "etc/vintf"

# ==========================================
# 2. TERMUX STABILITY FIX (The Exclusion)
# We exclude ONLY wpa_supplicant for r8s to fix Issue #70 (Kernel Panic)
# ==========================================
if [[ "$TARGET_CODENAME" != "r8s" ]]; then
    # This binary from p3sxxx is unstable on S20 FE (r8s)
    ADD_TO_WORK_DIR "p3sxxx" "vendor" "bin/hw/wpa_supplicant"
fi

# ==========================================
# 3. Light HAL (Blocked for r8s to ensure stability)
# ==========================================
if [[ "$TARGET_CODENAME" != "r8s" ]]; then
    ADD_TO_WORK_DIR "p3sxxx" "vendor" "bin/hw/vendor.samsung.hardware.light-service"
    ADD_TO_WORK_DIR "p3sxxx" "vendor" "lib64/android.hardware.light-V1-ndk_platform.so"
    ADD_TO_WORK_DIR "p3sxxx" "vendor" "lib64/vendor.samsung.hardware.light-V1-ndk_platform.so"
fi

LOG_STEP_OUT
