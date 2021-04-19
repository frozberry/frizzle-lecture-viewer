.class Lcom/oculus/utilities/VolumeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "VolumeReceiver.java"


# static fields
.field private static final DEBUG:Z = false

.field private static STREAM_TYPE:Ljava/lang/String; = "android.media.EXTRA_VOLUME_STREAM_TYPE"

.field private static STREAM_VALUE:Ljava/lang/String; = "android.media.EXTRA_VOLUME_STREAM_VALUE"

.field private static final TAG:Ljava/lang/String; = "UnityVolumeReceiver"

.field private static VOLUME_CHANGED_ACTION:Ljava/lang/String; = "android.media.VOLUME_CHANGED_ACTION"

.field private static filter:Landroid/content/IntentFilter;

.field private static receiver:Lcom/oculus/utilities/VolumeReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private static startReceiver(Landroid/content/Context;)V
    .locals 3

    const-string v0, "UnityVolumeReceiver"

    const-string v1, "Registering volume receiver"

    .line 26
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    sget-object v1, Lcom/oculus/utilities/VolumeReceiver;->filter:Landroid/content/IntentFilter;

    if-nez v1, :cond_0

    .line 28
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    sput-object v1, Lcom/oculus/utilities/VolumeReceiver;->filter:Landroid/content/IntentFilter;

    .line 29
    sget-object v1, Lcom/oculus/utilities/VolumeReceiver;->filter:Landroid/content/IntentFilter;

    sget-object v2, Lcom/oculus/utilities/VolumeReceiver;->VOLUME_CHANGED_ACTION:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 31
    :cond_0
    sget-object v1, Lcom/oculus/utilities/VolumeReceiver;->receiver:Lcom/oculus/utilities/VolumeReceiver;

    if-nez v1, :cond_1

    .line 32
    new-instance v1, Lcom/oculus/utilities/VolumeReceiver;

    invoke-direct {v1}, Lcom/oculus/utilities/VolumeReceiver;-><init>()V

    sput-object v1, Lcom/oculus/utilities/VolumeReceiver;->receiver:Lcom/oculus/utilities/VolumeReceiver;

    .line 35
    :cond_1
    sget-object v1, Lcom/oculus/utilities/VolumeReceiver;->receiver:Lcom/oculus/utilities/VolumeReceiver;

    sget-object v2, Lcom/oculus/utilities/VolumeReceiver;->filter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const-string v1, "audio"

    .line 37
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/AudioManager;

    const/4 v1, 0x3

    .line 38
    invoke-virtual {p0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p0

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startVolumeReceiver: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static stopReceiver(Landroid/content/Context;)V
    .locals 2

    const-string v0, "UnityVolumeReceiver"

    const-string v1, "Unregistering volume receiver"

    .line 44
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    sget-object v0, Lcom/oculus/utilities/VolumeReceiver;->receiver:Lcom/oculus/utilities/VolumeReceiver;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method private static native volumeChanged(I)V
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string p1, "UnityVolumeReceiver"

    const-string v0, "OnReceive VOLUME_CHANGED_ACTION"

    .line 50
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    sget-object v1, Lcom/oculus/utilities/VolumeReceiver;->STREAM_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 52
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    sget-object v1, Lcom/oculus/utilities/VolumeReceiver;->STREAM_VALUE:Ljava/lang/String;

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 55
    invoke-static {p2}, Lcom/oculus/utilities/VolumeReceiver;->volumeChanged(I)V

    goto :goto_0

    .line 59
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "skipping volume change from stream "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method
