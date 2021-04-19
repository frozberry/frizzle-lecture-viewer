.class Lcom/oculus/utilities/HeadsetReceiver;
.super Landroid/content/BroadcastReceiver;
.source "HeadsetReceiver.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "HeadsetReceiver"

.field public static filter:Landroid/content/IntentFilter;

.field public static receiver:Lcom/oculus/utilities/HeadsetReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private static getCurrentHeadsetState(Landroid/content/Context;)I
    .locals 2

    const-string v0, "audio"

    .line 46
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/AudioManager;

    if-eqz p0, :cond_0

    .line 49
    invoke-virtual {p0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 50
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getCurrentHeadsetState: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HeadsetReceiver"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return p0
.end method

.method private static startReceiver(Landroid/app/Activity;)V
    .locals 2

    .line 24
    invoke-static {p0}, Lcom/oculus/utilities/HeadsetReceiver;->getCurrentHeadsetState(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Lcom/oculus/utilities/HeadsetReceiver;->stateChanged(I)V

    const-string v0, "HeadsetReceiver"

    const-string v1, "Registering headset receiver"

    .line 26
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    sget-object v0, Lcom/oculus/utilities/HeadsetReceiver;->filter:Landroid/content/IntentFilter;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/oculus/utilities/HeadsetReceiver;->filter:Landroid/content/IntentFilter;

    .line 30
    :cond_0
    sget-object v0, Lcom/oculus/utilities/HeadsetReceiver;->receiver:Lcom/oculus/utilities/HeadsetReceiver;

    if-nez v0, :cond_1

    .line 31
    new-instance v0, Lcom/oculus/utilities/HeadsetReceiver;

    invoke-direct {v0}, Lcom/oculus/utilities/HeadsetReceiver;-><init>()V

    sput-object v0, Lcom/oculus/utilities/HeadsetReceiver;->receiver:Lcom/oculus/utilities/HeadsetReceiver;

    .line 34
    :cond_1
    sget-object v0, Lcom/oculus/utilities/HeadsetReceiver;->receiver:Lcom/oculus/utilities/HeadsetReceiver;

    sget-object v1, Lcom/oculus/utilities/HeadsetReceiver;->filter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private static native stateChanged(I)V
.end method

.method private static stopReceiver(Landroid/content/Context;)V
    .locals 2

    const-string v0, "HeadsetReceiver"

    const-string v1, "Unregistering headset receiver"

    .line 39
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    sget-object v0, Lcom/oculus/utilities/HeadsetReceiver;->receiver:Lcom/oculus/utilities/HeadsetReceiver;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    const-string p1, "HeadsetReceiver"

    const-string v0, "!$$$$$$! headsetReceiver::onReceive"

    .line 56
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "state"

    .line 57
    invoke-virtual {p2, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 59
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 60
    invoke-static {p1}, Lcom/oculus/utilities/HeadsetReceiver;->stateChanged(I)V

    :cond_0
    return-void
.end method
