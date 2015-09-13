##1
    观察者模式定义了对象间一对多的依赖关系，当一个对象的状态改变时，所有依赖他的对象都得到通知并被自动更新。
    这一模式可用来消除具有不同行为的对象之间的解耦。
    OC中除了`自己实现`，也可以之间使用系统提供的`NSNotificationCenter` 以及 `KVO` 来实现。 
    代码见HJAnswerDemo中的 vc中的viewdidload中，直接使用了NSNotificationCenter来实现
##2
    优点：解耦、可测、可复用、解决了MVC中C过于庞大，逻辑过多的缺点
    缺点：代码量相对增加、view与model之间传递事件更加遥远、若和RAC一起使用时代码的可读性下降,后人维护成本更大。

##3
    循环引用原因：vc 引用-> view引用->tableView引用-> cell->持有block   即vc强引用--》block
                block中出现了self，block捕获-》self    即 block -》 强引用 vc
                出现了循环引用，导致内存泄露