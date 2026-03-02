#!/bin/bash
# ============================================================
# ARKA CORE - SMART CALL (CSC) MODULE (HARDCODED EDITION)
# ============================================================

echo "----------------------------------------------------"
echo ">> [ARKA_CORE] RUNNING SMART CALL (CSC) MODULE"
echo "----------------------------------------------------"

WORK_DIR="./out/target/r8s"

# 1. Brutal XML Patching (Forcing the paths)
FF_PATH="$WORK_DIR/system/system/etc/floating_feature.xml"
if [ -f "$FF_PATH" ]; then
    sed -i '/SEC_FLOATING_FEATURE_CONTACTS_SUPPORT_SMART_CALL/d' "$FF_PATH"
    sed -i '/SEC_FLOATING_FEATURE_SMARTCALL_CONFIG_SVC_PROVIDER/d' "$FF_PATH"
    sed -i 's/<\/SecFloatingFeatureSet>/    <SEC_FLOATING_FEATURE_CONTACTS_SUPPORT_SMART_CALL>TRUE<\/SEC_FLOATING_FEATURE_CONTACTS_SUPPORT_SMART_CALL>\n    <SEC_FLOATING_FEATURE_SMARTCALL_CONFIG_SVC_PROVIDER>whitepages<\/SEC_FLOATING_FEATURE_SMARTCALL_CONFIG_SVC_PROVIDER>\n<\/SecFloatingFeatureSet>/' "$FF_PATH"
    echo ">> [ARKA_CORE] Smart Call: Floating Feature patched."
fi

echo ">> [ARKA_CORE] Patching Global CSC files..."
find "$WORK_DIR/optics" "$WORK_DIR/prism" -type f -name "cscfeature.xml" 2>/dev/null | while read -r CSC_FILE; do
    sed -i '/CscFeature_Common_ConfigSvcProviderForUnknownNumber/d' "$CSC_FILE"
    sed -i '/CscFeature_Contact_SupportSmartCall/d' "$CSC_FILE"
    sed -i 's/<\/FeatureSet>/    <CscFeature_Common_ConfigSvcProviderForUnknownNumber>whitepages,whitepages,off<\/CscFeature_Common_ConfigSvcProviderForUnknownNumber>\n    <CscFeature_Contact_SupportSmartCall>true<\/CscFeature_Contact_SupportSmartCall>\n<\/FeatureSet>/' "$CSC_FILE"
done

PROP_PATH="$WORK_DIR/system/system/build.prop"
if [ -f "$PROP_PATH" ]; then
    sed -i '/ro.config.smart_call_supported/d' "$PROP_PATH"
    echo "ro.config.smart_call_supported=true" >> "$PROP_PATH"
    echo ">> [ARKA_CORE] Smart Call: build.prop patched."
fi

# 2. Smali Patching
CSC_SMALI=$(find "$WORK_DIR/apktool" -type f -path "*/com/samsung/android/feature/SemCscFeature.smali" 2>/dev/null | head -n 1)
if [ -n "$CSC_SMALI" ] && [ -f "$CSC_SMALI" ]; then
    awk -f - "$CSC_SMALI" > "${CSC_SMALI}.tmp" << 'EOF'
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
EOF
    mv "${CSC_SMALI}.tmp" "$CSC_SMALI"
    echo ">> [ARKA_CORE] Smart Call: Smali Patched!"
fi
