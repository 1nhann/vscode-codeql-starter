import java
import Type

class ReadObjectMethodMy extends Method {
    ReadObjectMethodMy() {
      (this.getDeclaringType() instanceof TypeObjectInputStream or this.getDeclaringType() instanceof TypeObjectInput)
    and this.hasName("readObject")
    }
}


class Getter extends Method{
    Getter(){
        this.getDeclaringType() instanceof Serializable
        and this.getName().regexpMatch("get.+")
        and this.isPublic()
    }
}

class NoParamGetter extends Getter{
    NoParamGetter(){
        this.hasNoParameters()
    }
}


class JndiLookupMethod extends Method{
    JndiLookupMethod(){
        this.getDeclaringType().getAnAncestor().hasQualifiedName("javax.naming", "Context") 
        and this.hasName("lookup")
    }
}

class RuntimeExecMethod extends Method {
    RuntimeExecMethod(){
        this.hasQualifiedName("java.lang", "Runtime", "exec")
    }
}


class ProcessBuilderMethod extends Method {
    ProcessBuilderMethod(){
        this.hasQualifiedName("java.lang", "ProcessBuilder", "start")
    }
}

class DangerousMethod extends Callable {
    DangerousMethod(){
        this instanceof RuntimeExecMethod or
        this instanceof JndiLookupMethod or
        this instanceof ProcessBuilderMethod
      }
  }

class SerializeSinkMethod extends Method{
    SerializeSinkMethod(){
        this instanceof InvokeMethod
    }
}


class InvokeMethod extends Method{
    InvokeMethod(){
      this.hasName("invoke")
      and this.getDeclaringType().hasQualifiedName("java.lang.reflect","Method")
    }
  }

