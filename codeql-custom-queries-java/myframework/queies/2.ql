/**
@kind path-problem
*/

import java
import semmle.code.java.dataflow.DataFlow
import myframework.Method

query predicate edges(Method m1,Method m2){
    m1.polyCalls(m2)
}

from ReadObjectMethodMy read , InvokeMethod invoke
where edges+(read, invoke)
select read,read,invoke,"$@ $@ to $@ $@" ,
read.getDeclaringType(),read.getDeclaringType().getName(),
read,read.getName(),
invoke.getDeclaringType(),invoke.getDeclaringType().getName(),
invoke,invoke.getName() 