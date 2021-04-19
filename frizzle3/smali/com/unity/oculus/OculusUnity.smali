.class public Lcom/unity/oculus/OculusUnity;
.super Ljava/lang/Object;
.source "OculusUnity.java"


# instance fields
.field activity:Landroid/app/Activity;

.field glView:Landroid/view/SurfaceView;

.field player:Lcom/unity3d/player/UnityPlayer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private native initComplete(Landroid/view/Surface;)V
.end method

.method public static loadLibrary(Ljava/lang/String;)V
    .locals 2

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "loading library "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Unity"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public destroyOculus()V
    .locals 0

    return-void
.end method

.method public initOculus()V
    .locals 2

    const-string v0, "Unity"

    const-string v1, "initOculus Java!"

    .line 18
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    sget-object v0, Lcom/unity3d/player/UnityPlayer;->currentActivity:Landroid/app/Activity;

    iput-object v0, p0, Lcom/unity/oculus/OculusUnity;->activity:Landroid/app/Activity;

    .line 21
    iget-object v0, p0, Lcom/unity/oculus/OculusUnity;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/unity/oculus/-$$Lambda$OculusUnity$RGA6qBWUCXjz6TGwkVNJMqZ8S2Q;

    invoke-direct {v1, p0}, Lcom/unity/oculus/-$$Lambda$OculusUnity$RGA6qBWUCXjz6TGwkVNJMqZ8S2Q;-><init>(Lcom/unity/oculus/OculusUnity;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public synthetic lambda$initOculus$0$OculusUnity()V
    .locals 5

    .line 23
    iget-object v0, p0, Lcom/unity/oculus/OculusUnity;->activity:Landroid/app/Activity;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    .line 24
    iput-object v1, p0, Lcom/unity/oculus/OculusUnity;->player:Lcom/unity3d/player/UnityPlayer;

    const/4 v2, 0x0

    move v3, v2

    .line 25
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 26
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Lcom/unity3d/player/UnityPlayer;

    if-eqz v4, :cond_0

    .line 27
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/unity3d/player/UnityPlayer;

    iput-object v0, p0, Lcom/unity/oculus/OculusUnity;->player:Lcom/unity3d/player/UnityPlayer;

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 32
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/unity/oculus/OculusUnity;->player:Lcom/unity3d/player/UnityPlayer;

    const-string v3, "Unity"

    if-nez v0, :cond_2

    const-string v0, "Failed to find UnityPlayer view!"

    .line 33
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 37
    :cond_2
    iput-object v1, p0, Lcom/unity/oculus/OculusUnity;->glView:Landroid/view/SurfaceView;

    move v0, v2

    .line 38
    :goto_2
    iget-object v1, p0, Lcom/unity/oculus/OculusUnity;->player:Lcom/unity3d/player/UnityPlayer;

    invoke-virtual {v1}, Lcom/unity3d/player/UnityPlayer;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 40
    iget-object v1, p0, Lcom/unity/oculus/OculusUnity;->player:Lcom/unity3d/player/UnityPlayer;

    invoke-virtual {v1, v2}, Lcom/unity3d/player/UnityPlayer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/view/SurfaceView;

    if-eqz v1, :cond_3

    .line 42
    iget-object v1, p0, Lcom/unity/oculus/OculusUnity;->player:Lcom/unity3d/player/UnityPlayer;

    invoke-virtual {v1, v2}, Lcom/unity3d/player/UnityPlayer;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/SurfaceView;

    iput-object v1, p0, Lcom/unity/oculus/OculusUnity;->glView:Landroid/view/SurfaceView;

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 46
    :cond_4
    iget-object v0, p0, Lcom/unity/oculus/OculusUnity;->glView:Landroid/view/SurfaceView;

    if-nez v0, :cond_5

    const-string v0, "Failed to find GlView!"

    .line 47
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    const-string v0, "Oculus UI thread done."

    .line 50
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    iget-object v0, p0, Lcom/unity/oculus/OculusUnity;->glView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/unity/oculus/OculusUnity;->initComplete(Landroid/view/Surface;)V

    return-void
.end method

.method public pauseOculus()V
    .locals 0

    return-void
.end method

.method public resumeOculus()V
    .locals 0

    return-void
.end method
