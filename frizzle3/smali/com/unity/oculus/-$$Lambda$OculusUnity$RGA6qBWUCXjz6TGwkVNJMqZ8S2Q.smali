.class public final synthetic Lcom/unity/oculus/-$$Lambda$OculusUnity$RGA6qBWUCXjz6TGwkVNJMqZ8S2Q;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/unity/oculus/OculusUnity;


# direct methods
.method public synthetic constructor <init>(Lcom/unity/oculus/OculusUnity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/unity/oculus/-$$Lambda$OculusUnity$RGA6qBWUCXjz6TGwkVNJMqZ8S2Q;->f$0:Lcom/unity/oculus/OculusUnity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/unity/oculus/-$$Lambda$OculusUnity$RGA6qBWUCXjz6TGwkVNJMqZ8S2Q;->f$0:Lcom/unity/oculus/OculusUnity;

    invoke-virtual {v0}, Lcom/unity/oculus/OculusUnity;->lambda$initOculus$0$OculusUnity()V

    return-void
.end method
