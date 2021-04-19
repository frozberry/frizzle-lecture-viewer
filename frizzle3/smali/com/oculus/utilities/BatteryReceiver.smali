.class Lcom/oculus/utilities/BatteryReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BatteryReceiver.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "UnityBatteryReceiver"

.field public static filter:Landroid/content/IntentFilter;

.field public static receiver:Lcom/oculus/utilities/BatteryReceiver;


# instance fields
.field private batteryLevel:I

.field private batteryStatus:I

.field private batteryTemperature:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryLevel:I

    .line 19
    iput v0, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryStatus:I

    .line 20
    iput v0, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryTemperature:I

    return-void
.end method

.method private static native dispatchEvent(III)V
.end method

.method private processIntent(Landroid/content/Intent;)V
    .locals 5

    const/4 v0, 0x0

    const-string v1, "present"

    .line 26
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "status"

    .line 35
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, -0x1

    const-string v3, "level"

    .line 36
    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "scale"

    .line 37
    invoke-virtual {p1, v4, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string v4, "temperature"

    .line 39
    invoke-virtual {p1, v4, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-ltz v3, :cond_0

    if-lez v2, :cond_0

    mul-int/lit8 v3, v3, 0x64

    .line 44
    div-int v0, v3, v2

    .line 46
    :cond_0
    iget v2, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryStatus:I

    if-ne v1, v2, :cond_1

    iget v2, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryLevel:I

    if-ne v0, v2, :cond_1

    iget v2, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryTemperature:I

    if-eq p1, v2, :cond_2

    .line 49
    :cond_1
    iput v1, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryStatus:I

    .line 50
    iput v0, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryLevel:I

    .line 51
    iput p1, p0, Lcom/oculus/utilities/BatteryReceiver;->batteryTemperature:I

    .line 52
    invoke-static {v1, v0, p1}, Lcom/oculus/utilities/BatteryReceiver;->dispatchEvent(III)V

    :cond_2
    return-void
.end method

.method private static startReceiver(Landroid/app/Activity;)V
    .locals 2

    const-string v0, "UnityBatteryReceiver"

    const-string v1, "Registering battery receiver"

    .line 59
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    sget-object v0, Lcom/oculus/utilities/BatteryReceiver;->filter:Landroid/content/IntentFilter;

    if-nez v0, :cond_0

    .line 62
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/oculus/utilities/BatteryReceiver;->filter:Landroid/content/IntentFilter;

    .line 65
    :cond_0
    sget-object v0, Lcom/oculus/utilities/BatteryReceiver;->receiver:Lcom/oculus/utilities/BatteryReceiver;

    if-nez v0, :cond_1

    .line 66
    new-instance v0, Lcom/oculus/utilities/BatteryReceiver;

    invoke-direct {v0}, Lcom/oculus/utilities/BatteryReceiver;-><init>()V

    sput-object v0, Lcom/oculus/utilities/BatteryReceiver;->receiver:Lcom/oculus/utilities/BatteryReceiver;

    .line 69
    :cond_1
    sget-object v0, Lcom/oculus/utilities/BatteryReceiver;->receiver:Lcom/oculus/utilities/BatteryReceiver;

    sget-object v1, Lcom/oculus/utilities/BatteryReceiver;->filter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 72
    sget-object v0, Lcom/oculus/utilities/BatteryReceiver;->receiver:Lcom/oculus/utilities/BatteryReceiver;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/oculus/utilities/BatteryReceiver;->processIntent(Landroid/content/Intent;)V

    return-void
.end method

.method private static stopReceiver(Landroid/content/Context;)V
    .locals 2

    const-string v0, "UnityBatteryReceiver"

    const-string v1, "Unregistering battery receiver"

    .line 77
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    sget-object v0, Lcom/oculus/utilities/BatteryReceiver;->receiver:Lcom/oculus/utilities/BatteryReceiver;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 84
    invoke-direct {p0, p2}, Lcom/oculus/utilities/BatteryReceiver;->processIntent(Landroid/content/Intent;)V

    return-void
.end method
