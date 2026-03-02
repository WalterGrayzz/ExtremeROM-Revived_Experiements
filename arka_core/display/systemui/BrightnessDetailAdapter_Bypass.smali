.class public final Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;
.super Ljava/lang/Object;
.source "qb/105238559 62f91e9ec09f875cd30742176b3f8505f0642c5a9b37677b26897e98b2d5c98d"

# interfaces
.implements Lcom/android/systemui/plugins/qs/DetailAdapter;


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public final activityStarter$delegate:Lkotlin/Lazy;

.field public autoBrightnessContainer:Lcom/android/systemui/qs/SecQSSwitchPreference;

.field public final autoBrightnessDelegate:Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$autoBrightnessDelegate$1;

.field public autoBrightnessSummary:Landroid/widget/TextView;

.field public autoBrightnessSwitch:Landroidx/appcompat/widget/SwitchCompat;

.field public brightnessController:Lcom/android/systemui/settings/brightness/BrightnessController;

.field public brightnessObserver:Lcom/android/systemui/settings/brightness/BrightnessObserver;

.field public final context:Landroid/content/Context;

.field public enforcedAdmin:Lcom/android/settingslib/RestrictedLockUtils$EnforcedAdmin;

.field public final factory:Lcom/android/systemui/settings/brightness/BrightnessController$Factory;

.field public final quickBarBrightnessExtraBrightness:Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;

.field public final quickKnox:Lcom/android/systemui/knox/KnoxStateMonitor;

.field public final quickSALog:Lcom/android/systemui/settings/brightness/QuickSALog;

.field public final sensorPrivacyManager$delegate:Lkotlin/Lazy;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/systemui/settings/brightness/BrightnessController$Factory;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->context:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->factory:Lcom/android/systemui/settings/brightness/BrightnessController$Factory;

    sget-boolean p2, Lcom/android/systemui/QpRune;->QUICK_BAR_BRIGHTNESS_EXTRA_BRIGHTNESS:Z

    if-eqz p2, :cond_0

    new-instance p2, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;

    invoke-direct {p2, p1}, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;-><init>(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iput-object p2, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->quickBarBrightnessExtraBrightness:Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;

    new-instance p2, Lcom/android/systemui/settings/brightness/QuickSALog;

    invoke-direct {p2, p1}, Lcom/android/systemui/settings/brightness/QuickSALog;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->quickSALog:Lcom/android/systemui/settings/brightness/QuickSALog;

    sget-object p1, Lcom/android/systemui/Dependency;->sDependency:Lcom/android/systemui/Dependency;

    const-class p2, Lcom/android/systemui/knox/KnoxStateMonitor;

    invoke-virtual {p1, p2}, Lcom/android/systemui/Dependency;->getDependencyInner(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/systemui/knox/KnoxStateMonitor;

    iput-object p1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->quickKnox:Lcom/android/systemui/knox/KnoxStateMonitor;

    new-instance p1, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$autoBrightnessDelegate$1;

    invoke-direct {p1, p0}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$autoBrightnessDelegate$1;-><init>(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;)V

    iput-object p1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessDelegate:Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$autoBrightnessDelegate$1;

    new-instance p1, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$$ExternalSyntheticLambda0;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$$ExternalSyntheticLambda0;-><init>(I)V

    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->activityStarter$delegate:Lkotlin/Lazy;

    new-instance p1, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$$ExternalSyntheticLambda0;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$$ExternalSyntheticLambda0;-><init>(I)V

    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object p1

    iput-object p1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->sensorPrivacyManager$delegate:Lkotlin/Lazy;

    return-void
.end method

.method public static final access$addDividerView(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroid/view/View;

    iget-object p0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->context:Landroid/content/Context;

    invoke-direct {v0, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const v1, 0x7f070fd6

    invoke-static {v0, v1}, Lcom/android/systemui/qs/customize/viewcontroller/QSLayoutEditViewController$$ExternalSyntheticOutline0;->m(Landroid/view/View;I)I

    move-result v1

    const/4 v2, -0x1

    invoke-direct {p0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const v1, 0x7f070fd7

    invoke-static {v0, v1}, Lcom/android/systemui/qs/customize/viewcontroller/QSLayoutEditViewController$$ExternalSyntheticOutline0;->m(Landroid/view/View;I)I

    move-result v1

    iput v1, p0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v1, p0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v1, 0x7f060635

    invoke-virtual {p0, v1}, Landroid/content/Context;->getColor(I)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method public static final access$setBrightness(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;ZZ)V
    .locals 7

    iget-object v0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->quickKnox:Lcom/android/systemui/knox/KnoxStateMonitor;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/android/systemui/knox/KnoxStateMonitorImpl;

    invoke-virtual {v0}, Lcom/android/systemui/knox/KnoxStateMonitorImpl;->isBrightnessBlocked()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const-string v2, "BrightnessDetailAdapter"

    if-eqz v0, :cond_1

    const-string v0, "Auto brightness options are not available by KnoxStateMonitor."

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_1
    move p1, p2

    :goto_1
    const-string v0, "automatic = "

    invoke-static {v0, v2, p1}, Lcom/android/keyguard/EmergencyButtonController$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/systemui/util/DeviceType;->isLightSensorSupported(Landroid/content/Context;)Z

    move-result v2

    const/4 v3, -0x2

    if-eqz v2, :cond_5

    sget-boolean v2, Lcom/android/systemui/QpRune;->QUICK_BAR_BRIGHTNESS_PERSONAL_CONTROL:Z

    if-nez v2, :cond_2

    goto :goto_4

    :cond_2
    const-string v2, "brightness_pms_marker_screen"

    const-string/jumbo v4, "screen_brightness"

    if-eqz p1, :cond_3

    move-object v5, v4

    goto :goto_2

    :cond_3
    move-object v5, v2

    :goto_2
    if-eqz p1, :cond_4

    goto :goto_3

    :cond_4
    move-object v2, v4

    :goto_3
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/16 v6, 0x64

    invoke-static {v4, v5, v6, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v4

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-static {v5, v2, v4, v3}, Landroid/provider/Settings$Secure;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    :goto_4
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v2, "screen_brightness_mode"

    invoke-static {v0, v2, p1, v3}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    goto :goto_5

    :cond_5
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "display_outdoor_mode"

    invoke-static {v0, v2, p1, v3}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    :goto_5
    iget-object v0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessSwitch:Landroidx/appcompat/widget/SwitchCompat;

    if-eqz v0, :cond_6

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    :cond_6
    iget-object v0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->quickBarBrightnessExtraBrightness:Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;

    if-eqz v0, :cond_8

    sget-boolean v2, Lcom/android/systemui/QpRune;->QUICK_BAR_BRIGHTNESS_EXTRA_BRIGHTNESS:Z

    if-eqz v2, :cond_7

    move-object v1, v0

    :cond_7
    if-eqz v1, :cond_8

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;->setExtraBrightnessLayoutVisibilityLogic(Ljava/lang/Boolean;)V

    :cond_8
    iget-object p0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->quickSALog:Lcom/android/systemui/settings/brightness/QuickSALog;

    if-eqz p0, :cond_9

    invoke-static {}, Lcom/android/systemui/util/SystemUIAnalytics;->getCurrentScreenID()Ljava/lang/String;

    move-result-object p1

    const-string v0, "QPDE1006"

    invoke-static {p1, v0}, Lcom/android/systemui/util/SystemUIAnalytics;->sendEventLog(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/systemui/settings/brightness/QuickSALog;->brightnessBarPrefEditor:Landroid/content/SharedPreferences$Editor;

    if-eqz p0, :cond_9

    const-string p1, "QPDS1006"

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_9
    return-void
.end method


# virtual methods
.method public final createDetailView(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 12

    const/4 p2, 0x0

    if-nez p1, :cond_0

    new-instance p0, Landroid/view/View;

    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object p0

    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d039b

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p3

    if-eqz p3, :cond_1d

    move-object v0, p3

    check-cast v0, Landroid/view/ViewGroup;

    invoke-static {p1, v0}, Lcom/android/systemui/qs/SecQSSwitchPreference;->inflateSwitch(Landroid/content/Context;Landroid/view/ViewGroup;)Lcom/android/systemui/qs/SecQSSwitchPreference;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessContainer:Lcom/android/systemui/qs/SecQSSwitchPreference;

    invoke-static {p1}, Lcom/android/systemui/util/DeviceType;->isLightSensorSupported(Landroid/content/Context;)Z

    invoke-static {p1}, Lcom/android/systemui/util/DeviceType;->isLightSensorSupported(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f1311e8

    goto :goto_0

    :cond_1
    const v1, 0x7f1311f3

    :goto_0
    iget-object v3, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessContainer:Lcom/android/systemui/qs/SecQSSwitchPreference;

    const v4, 0x7f0a0df5

    if-eqz v3, :cond_2

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    goto :goto_1

    :cond_2
    move-object v3, p2

    :goto_1
    instance-of v5, v3, Landroid/widget/TextView;

    if-eqz v5, :cond_3

    check-cast v3, Landroid/widget/TextView;

    goto :goto_2

    :cond_3
    move-object v3, p2

    :goto_2
    if-eqz v3, :cond_4

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4
    iget-object v1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessContainer:Lcom/android/systemui/qs/SecQSSwitchPreference;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessContainer:Lcom/android/systemui/qs/SecQSSwitchPreference;

    const/16 v3, 0x8

    const v5, 0x7f0a0dfc

    const v6, 0x7f0a0dfd

    if-eqz v1, :cond_a

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v7, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessSwitch:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_5

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3

    :cond_5
    move-object v7, p2

    :goto_3
    iput-object v7, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessSummary:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    instance-of v8, v7, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v8, :cond_6

    check-cast v7, Landroid/view/ViewGroup$MarginLayoutParams;

    goto :goto_4

    :cond_6
    move-object v7, p2

    :goto_4
    if-eqz v7, :cond_7

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f071087

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    iput v8, v7, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7
    sget-object v7, Lcom/android/systemui/Dependency;->sDependency:Lcom/android/systemui/Dependency;

    const-class v8, Lcom/android/systemui/util/SecQsUiDisplayModeInteractor;

    invoke-virtual {v7, v8}, Lcom/android/systemui/Dependency;->getDependencyInner(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/systemui/util/SecQsUiDisplayModeInteractor;

    invoke-virtual {v7}, Lcom/android/systemui/util/SecQsUiDisplayModeInteractor;->isTablet()Z

    move-result v7

    if-eqz v7, :cond_8

    move-object v7, v1

    goto :goto_5

    :cond_8
    move-object v7, p2

    :goto_5
    if-eqz v7, :cond_9

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f071187

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v9

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getPaddingRight()I

    move-result v10

    invoke-virtual {v7}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v11

    invoke-virtual {v7, v9, v8, v10, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    :cond_9
    new-instance v7, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$3$7;

    invoke-direct {v7, p0}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$3$7;-><init>(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;)V

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v7, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$3$8;

    invoke-direct {v7, p0}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$3$8;-><init>(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;)V

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_a
    iget-object v1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessSwitch:Landroidx/appcompat/widget/SwitchCompat;

    if-eqz v1, :cond_b

    invoke-virtual {p0}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->isSwitchChecked()Z

    move-result v7

    invoke-virtual {v1, v7}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    new-instance v7, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$4$1;

    invoke-direct {v7, p0}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$4$1;-><init>(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;)V

    invoke-virtual {v1, v7}, Landroid/widget/CompoundButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v7, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$4$2;

    invoke-direct {v7, p0, v1, p1}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$4$2;-><init>(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;Landroidx/appcompat/widget/SwitchCompat;Landroid/content/Context;)V

    invoke-virtual {v1, v7}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    :cond_b
    const-string/jumbo v1, "sensor"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v7, v1, Landroid/hardware/SensorManager;

    if-eqz v7, :cond_c

    check-cast v1, Landroid/hardware/SensorManager;

    goto :goto_6

    :cond_c
    move-object v1, p2

    :goto_6
    if-eqz v1, :cond_11

    const v7, 0x10044

    invoke-virtual {v1, v7}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "isCameraLightSensorSupported: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "BrightnessDetailAdapter"

    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v1, :cond_11

    #iget-object v1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->sensorPrivacyManager$delegate:Lkotlin/Lazy;

    #invoke-interface {v1}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    #move-result-object v1

    #check-cast v1, Landroid/hardware/SensorPrivacyManager;

    #const/4 v7, 0x2

    #invoke-virtual {v1, v7}, Landroid/hardware/SensorPrivacyManager;->isSensorPrivacyEnabled(I)Z

    #move-result v1
    
    const/4 v1, 0x0

    xor-int/lit8 v7, v1, 0x1

    const-string v9, "initSensorPrivacy: isNonBlocked: "

    invoke-static {v9, v8, v7}, Lcom/android/keyguard/EmergencyButtonController$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Z)V

    iget-object v8, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessContainer:Lcom/android/systemui/qs/SecQSSwitchPreference;

    if-eqz v8, :cond_e

    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->setClickable(Z)V

    invoke-virtual {v8, v7}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    if-nez v1, :cond_d

    const/high16 v9, 0x3f800000    # 1.0f

    goto :goto_7

    :cond_d
    const v9, 0x3ecccccd    # 0.4f

    :goto_7
    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setAlpha(F)V

    :cond_e
    iget-object v8, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessSwitch:Landroidx/appcompat/widget/SwitchCompat;

    if-eqz v8, :cond_f

    invoke-virtual {v8, v7}, Landroid/widget/CompoundButton;->setClickable(Z)V

    invoke-virtual {v8, v7}, Landroid/widget/CompoundButton;->setEnabled(Z)V

    :cond_f
    iget-object v7, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessSummary:Landroid/widget/TextView;

    if-eqz v7, :cond_11

    if-nez v1, :cond_10

    goto :goto_8

    :cond_10
    move v3, v2

    :goto_8
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setVisibility(I)V

    const v1, 0x7f1311d1

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_11
    iget-object v1, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->quickBarBrightnessExtraBrightness:Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;

    if-eqz v1, :cond_19

    sget-boolean v3, Lcom/android/systemui/QpRune;->QUICK_BAR_BRIGHTNESS_EXTRA_BRIGHTNESS:Z

    if-eqz v3, :cond_12

    move-object v3, v1

    goto :goto_9

    :cond_12
    move-object v3, p2

    :goto_9
    if-eqz v3, :cond_19

    new-instance v7, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$6;

    invoke-direct {v7, p0}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$6;-><init>(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;)V

    iget-object v7, v7, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$initBrightnessDetail$6;->this$0:Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;

    invoke-static {v7, v0}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->access$addDividerView(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    iput-object v7, v3, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;->divider:Landroid/view/View;

    invoke-static {p1, v0}, Lcom/android/systemui/qs/SecQSSwitchPreference;->inflateSwitch(Landroid/content/Context;Landroid/view/ViewGroup;)Lcom/android/systemui/qs/SecQSSwitchPreference;

    move-result-object v7

    if-eqz v7, :cond_17

    invoke-virtual {v7, v4}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    instance-of v8, v4, Landroid/widget/TextView;

    if-eqz v8, :cond_13

    check-cast v4, Landroid/widget/TextView;

    goto :goto_a

    :cond_13
    move-object v4, p2

    :goto_a
    if-eqz v4, :cond_14

    const v8, 0x7f1311f0

    invoke-virtual {p1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_14
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/appcompat/widget/SwitchCompat;

    if-eqz v4, :cond_15

    iput-object v4, v3, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;->extraBrightnessSwitch:Landroidx/appcompat/widget/SwitchCompat;

    :cond_15
    invoke-virtual {v7, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_16

    const v5, 0x7f1311f1

    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_b

    :cond_16
    move-object v4, p2

    :goto_b
    iput-object v4, v3, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;->extraBrightnessSummary:Landroid/widget/TextView;

    iput-object v7, v3, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;->extraBrightnessContainer:Lcom/android/systemui/qs/SecQSSwitchPreference;

    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_17
    iget-object v0, v3, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;->extraBrightnessSwitch:Landroidx/appcompat/widget/SwitchCompat;

    if-eqz v0, :cond_19

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo v4, "screen_extra_brightness"

    const/4 v5, -0x2

    invoke-static {v3, v4, v2, v5}, Landroid/provider/Settings$Secure;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_18

    move v2, v4

    :cond_18
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    :cond_19
    if-eqz v1, :cond_1c

    sget-boolean v0, Lcom/android/systemui/QpRune;->QUICK_BAR_BRIGHTNESS_EXTRA_BRIGHTNESS:Z

    if-eqz v0, :cond_1a

    goto :goto_c

    :cond_1a
    move-object v1, p2

    :goto_c
    if-eqz v1, :cond_1c

    iget-object v0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->autoBrightnessSwitch:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1}, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;->setExtraBrightnessLayoutClickListener()V

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result p2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    :cond_1b
    invoke-virtual {v1, p2}, Lcom/android/systemui/settings/brightness/QuickBarBrightnessExtraBrightness;->setExtraBrightnessLayoutVisibilityLogic(Ljava/lang/Boolean;)V

    :cond_1c
    new-instance p2, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$createDetailView$1$2;

    invoke-direct {p2, p0, p1}, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter$createDetailView$1$2;-><init>(Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;Landroid/content/Context;)V

    invoke-virtual {p3, p2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-object p3

    :cond_1d
    new-instance p0, Landroid/view/View;

    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object p0
.end method

.method public final getMetricsCategory()I
    .locals 0

    const/16 p0, 0x1389

    return p0
.end method

.method public final getSettingsIntent()Landroid/content/Intent;
    .locals 1

    new-instance p0, Landroid/content/Intent;

    const-string v0, "android.settings.DISPLAY_SETTINGS"

    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    return-object p0
.end method

.method public final getTitle()Ljava/lang/CharSequence;
    .locals 1

    iget-object p0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->context:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f1311ef

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic getToggleState()Ljava/lang/Boolean;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final isSwitchChecked()Z
    .locals 4

    iget-object p0, p0, Lcom/android/systemui/settings/brightness/BrightnessDetailAdapter;->context:Landroid/content/Context;

    invoke-static {p0}, Lcom/android/systemui/util/DeviceType;->isLightSensorSupported(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, -0x2

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string/jumbo v0, "screen_brightness_mode"

    invoke-static {p0, v0, v2, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result p0

    if-eqz p0, :cond_0

    return v1

    :cond_0
    return v2

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "display_outdoor_mode"

    invoke-static {p0, v0, v2, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result p0

    if-eqz p0, :cond_2

    return v1

    :cond_2
    return v2
.end method

.method public final setToggleState(Z)V
    .locals 0

    return-void
.end method
