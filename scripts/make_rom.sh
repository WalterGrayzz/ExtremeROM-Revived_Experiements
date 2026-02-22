#!/usr/bin/env bash
#
# Copyright (C) 2025 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

set -e

# [
source "$SRC_DIR/scripts/utils/build_utils.sh" || exit 1

FORCE=false
BUILD_ROM=false
BUILD_ZIP=true

START_TIME="$(date +%s)"

SOURCE_FIRMWARE_PATH="$(cut -d "/" -f 1 -s <<< "$SOURCE_FIRMWARE")_$(cut -d "/" -f 2 -s <<< "$SOURCE_FIRMWARE")"
TARGET_FIRMWARE_PATH="$(cut -d "/" -f 1 -s <<< "$TARGET_FIRMWARE")_$(cut -d "/" -f 2 -s <<< "$TARGET_FIRMWARE")"

GET_WORK_DIR_HASH()
{
    find "$SRC_DIR/unica" "$SRC_DIR/target/$TARGET_CODENAME" -type f -print0 | \
        sort -z | xargs -0 sha1sum | sha1sum | cut -d " " -f 1
}

PREPARE_SCRIPT()
{
    while [ "$#" != 0 ]; do
        case "$1" in
            "-f" | "--force")
                FORCE=true
                ;;
            "--no-rom-zip")
                BUILD_ZIP=false
                ;;
            *)
                echo "Usage: make_rom [options]"
                echo " -f, --force : Force build"
                echo " --no-rom-zip : Do not build ROM zip"
                exit 1
                ;;
        esac

        shift
    done
}

PRINT_BUILD_OUTCOME()
{
    local EXIT_CODE="$?"
    local END_TIME
    local ESTIMATED

    END_TIME="$(date +%s)"
    ESTIMATED="$((END_TIME - START_TIME))"

    if [ "$EXIT_CODE" != "0" ]; then
        echo -n -e '\n\033[1;31m'"Build failed "
    else
        echo -n -e '\n\033[1;32m'"Build completed "
    fi
    echo -e "in $((ESTIMATED / 3600))hrs $(((ESTIMATED / 60) % 60))min $((ESTIMATED % 60))sec."'\033[0m\n'
}

PRINT_USAGE()
{
    echo "Usage: make_rom [options]" >&2
    echo " -f, --force : Force ROM build" >&2
    echo " --no-rom-zip : Do not build ROM zip" >&2
}
# ]

PREPARE_SCRIPT "$@"

if $FORCE; then
    BUILD_ROM=true
else
    if [ -f "$WORK_DIR/.completed" ]; then
        if [[ "$(cat "$WORK_DIR/.completed")" == "$(GET_WORK_DIR_HASH)" ]]; then
            LOGW "No changes have been detected in the build environment"
            BUILD_ROM=false
        else
            LOGW "Changes detected in the build environment"
            BUILD_ROM=true
        fi
    else
        BUILD_ROM=true
    fi
fi

trap 'PRINT_BUILD_OUTCOME' EXIT
trap 'echo' INT

if $BUILD_ROM; then
    [ -d "$APKTOOL_DIR" ] && rm -rf "$APKTOOL_DIR"
    [ -f "$WORK_DIR/.completed" ] && rm -f "$WORK_DIR/.completed"

    if [ ! -f "$FW_DIR/$SOURCE_FIRMWARE_PATH/.extracted" ] || [ ! -f "$FW_DIR/$TARGET_FIRMWARE_PATH/.extracted" ]; then
        if [ ! -f "$ODIN_DIR/$SOURCE_FIRMWARE_PATH/.downloaded" ] || [ ! -f "$ODIN_DIR/$TARGET_FIRMWARE_PATH/.downloaded" ]; then
            LOG_STEP_IN true "Downloading required firmwares"
            "$SRC_DIR/scripts/download_fw.sh" || exit 1
            LOG_STEP_OUT
        fi
        LOG_STEP_IN true "Extracting required firmwares"
        "$SRC_DIR/scripts/extract_fw.sh" || exit 1
        LOG_STEP_OUT
    fi

    LOG_STEP_IN true "Creating work dir"
    "$SRC_DIR/scripts/internal/create_work_dir.sh" || exit 1
    LOG_STEP_OUT

    if [ -d "$SRC_DIR/unica/patches" ]; then
        LOG_STEP_IN true "Applying ROM patches"
        "$SRC_DIR/scripts/internal/apply_modules.sh" "$SRC_DIR/unica/patches" || exit 1
        LOG_STEP_OUT
    fi

    if [ -d "$SRC_DIR/platform/$TARGET_PLATFORM/patches" ]; then
        LOG_STEP_IN true "Applying platform patches"
        "$SRC_DIR/scripts/internal/apply_modules.sh" "$SRC_DIR/platform/$TARGET_PLATFORM/patches" || exit 1
        LOG_STEP_OUT
    fi
    if [ -d "$SRC_DIR/target/$TARGET_CODENAME/patches" ]; then
        LOG_STEP_IN true "Applying device patches"
        "$SRC_DIR/scripts/internal/apply_modules.sh" "$SRC_DIR/target/$TARGET_CODENAME/patches" || exit 1
        LOG_STEP_OUT
    fi

    if [ -d "$SRC_DIR/unica/mods" ]; then
        LOG_STEP_IN true "Applying ROM mods"
        "$SRC_DIR/scripts/internal/apply_modules.sh" "$SRC_DIR/unica/mods" || exit 1
        LOG_STEP_OUT
    fi
  ## =======================================================
    # GhasemzadehFard-dev Patch: Global Smart Call (Prism+Whitepages)
    # =======================================================
    echo ">> [GhasemzadehFard-dev] Injecting Smart Call Features..."

    FF_FILE="$WORK_DIR/system/system/etc/floating_feature.xml"
    if [ -f "$FF_FILE" ]; then
        sed -i '/SEC_FLOATING_FEATURE_CONTACTS_SUPPORT_SMART_CALL/d' "$FF_FILE"
        sed -i '/SEC_FLOATING_FEATURE_SMARTCALL_CONFIG_SVC_PROVIDER/d' "$FF_FILE"
        sed -i 's/<\/SecFloatingFeatureSet>/    <SEC_FLOATING_FEATURE_CONTACTS_SUPPORT_SMART_CALL>TRUE<\/SEC_FLOATING_FEATURE_CONTACTS_SUPPORT_SMART_CALL>\n    <SEC_FLOATING_FEATURE_SMARTCALL_CONFIG_SVC_PROVIDER>whitepages<\/SEC_FLOATING_FEATURE_SMARTCALL_CONFIG_SVC_PROVIDER>\n<\/SecFloatingFeatureSet>/' "$FF_FILE"
        echo ">> Floating Feature patched."
    fi

    # 2. Global CSC Patching (Targets BOTH optics AND prism)
    find "$WORK_DIR/optics" "$WORK_DIR/prism" -type f -name "cscfeature.xml" 2>/dev/null | while read -r CSC_FILE; do
        sed -i '/CscFeature_Common_ConfigSvcProviderForUnknownNumber/d' "$CSC_FILE"
        sed -i '/CscFeature_Contact_SupportSmartCall/d' "$CSC_FILE"
        # Using Salvo's Whitepages bypass trick
        sed -i 's/<\/FeatureSet>/    <CscFeature_Common_ConfigSvcProviderForUnknownNumber>whitepages,whitepages,off<\/CscFeature_Common_ConfigSvcProviderForUnknownNumber>\n    <CscFeature_Contact_SupportSmartCall>true<\/CscFeature_Contact_SupportSmartCall>\n<\/FeatureSet>/' "$CSC_FILE"
    done
    echo ">> All CSC files in Optics & Prism patched."

    PROP_FILE="$WORK_DIR/system/system/build.prop"
    if [ -f "$PROP_FILE" ]; then
        sed -i '/ro.config.smart_call_supported/d' "$PROP_FILE"
        echo "ro.config.smart_call_supported=true" >> "$PROP_FILE"
    fi
    # =======================================================
    
    if [ -d "$APKTOOL_DIR" ]; then
        LOG_STEP_IN true "Building APKs/JARs"
# =======================================================
        # GhasemzadehFard-dev Inline Smali Hook Injector
        # =======================================================
        CSC_SMALI=$(find "$APKTOOL_DIR" -type f -path "*/framework.jar/*/com/samsung/android/feature/SemCscFeature.smali" 2>/dev/null)
        if [ -n "$CSC_SMALI" ]; then
            echo ">> Injecting Inline Smali Hooks into $CSC_SMALI"
            awk '
            /^\.method public whitelist getString\(Ljava\/lang\/String;.*\)Ljava\/lang\/String;/ { in_str=1; print; next }
            in_str && /\.locals/ {
                print
                print "    # GhasemzadehFard Hook"
                print "    const-string v0, \"CscFeature_Common_ConfigSvcProviderForUnknownNumber\""
                print "    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z"
                print "    move-result v0"
                print "    if-eqz v0, :cond_bypass_" NR
                print "    const-string v0, \"whitepages,whitepages,off\""
                print "    return-object v0"
                print "    :cond_bypass_" NR
                in_str=0
                next
            }
            /^\.method public whitelist getBoolean\(Ljava\/lang\/String;.*\)Z/ { in_bool=1; print; next }
            in_bool && /\.locals/ {
                print
                print "    # GhasemzadehFard Hook"
                print "    const-string v0, \"CscFeature_Contact_SupportSmartCall\""
                print "    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z"
                print "    move-result v0"
                print "    if-eqz v0, :cond_bypass_" NR
                print "    const/4 v0, 0x1"
                print "    return v0"
                print "    :cond_bypass_" NR
                in_bool=0
                next
            }
            { print }
            ' "$CSC_SMALI" > "${CSC_SMALI}.tmp" && mv "${CSC_SMALI}.tmp" "$CSC_SMALI"
            echo ">> Smali Hooks Injected Successfully!"
        else
            echo ">> ERROR: SemCscFeature.smali not found. Skipping Smali Patch."
        fi
        # =======================================================
        while IFS= read -r f; do
            f="${f/$APKTOOL_DIR\//}"
            PARTITION="$(cut -d "/" -f 1 -s <<< "$f")"
            if [[ "$PARTITION" == "system" ]]; then
                "$SRC_DIR/scripts/apktool.sh" b "system" "$f" &
            else
                "$SRC_DIR/scripts/apktool.sh" b "$PARTITION" "$(cut -d "/" -f 2- -s <<< "$f")" &
            fi
        done < <(find "$APKTOOL_DIR" -type d \( -name "*.apk" -o -name "*.jar" \))

        # shellcheck disable=SC2046
        wait $(jobs -p) || exit 1

        LOG_STEP_OUT

    fi

    echo -n "$(GET_WORK_DIR_HASH)" > "$WORK_DIR/.completed"
fi

if [ -n "$GITHUB_ACTIONS" ]; then
    bash "$SRC_DIR/scripts/cleanup.sh" fw kernel
fi

if $BUILD_ZIP; then
    LOG_STEP_IN true "Creating zip"
    "$SRC_DIR/scripts/internal/build_flashable_zip.sh" || exit 1
    LOG_STEP_OUT
fi

exit 0

