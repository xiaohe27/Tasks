package mop;
public aspect BaseAspect {
    pointcut notwithin() :
    !within(sun..*) &&
    !within(java..*) &&
    !within(javax..*) &&
    !within(com.sun..*) &&
    !within(org.dacapo.harness..*) &&
    !within(org.apache.commons..*) &&
    !within(org.apache.geronimo..*) &&
    !within(net.sf.cglib..*) &&
    !within(mop..*) &&
    !within(javamoprt..*) &&
    !within(rvmonitorrt..*) &&
    !within(com.runtimeverification..*);
}
