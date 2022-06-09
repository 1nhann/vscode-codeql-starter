import java
import Method
class CallsDangerousMethod extends Callable {
    CallsDangerousMethod(){
      exists(MethodAccess ma | ma.getMethod() instanceof DangerousMethod and ma.getEnclosingCallable() = this)
    }
}