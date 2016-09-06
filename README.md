# Apple-Swfit-Tec
苹果官方入门指南，使用swfit来教学，入门级教程。（UI控件、基础语法、数据模型、SB、Autolayout等）
//TEST:git push 2016-09-04 19:15
//TEST:git pull 2016-09-04 19:25

一：
二：
1.
2.
3.
4.
5.新建dataModel，并且进行测试unit test
编写好模型数据后，可能存在边界情况没考虑到。
为了解决这种不确定性,您可以编写单元测试。单元测试用于测试小型、独立的代码,以确保他们正确的行为。
测试可以编写功能测试（检查所有您期望产生的值）和性能测试（检查您的代码预期执行速度）
所有的测试都以test开头，再加上你的标示组成名字（例如检查是否被正确初始化：命名为testMealInitialization）
测试用例一般测试几组边界数据来测试结果是否是你想要的，是否是根据你的设计跑出的运行结果。
单元测试可以帮助你发现你可能忽略的错误，通过单元测试模块的名字来暗示它们的测试行为，因此每个测试都应该查一个特定的、基本类型的行为。如果单元测试编写得冗长或复杂，那么讲很难追踪到底什么是错的。
一些断言的简单功能介绍：https://github.com/zhoushejun/OCUnit
三：
导航的目的是向下拉取更多信息而不是完成一个独立的用户操作，模态展示则可以表达出用户独立操作。（使用导航和模态的区别）

as? : downcast 向下转换 ，类似OC中的类型强制转换
if let sourceController = sender.sourceViewController as? MealViewController {
}
as!: 强制转换操作符
对比 "!"和 "?"的区别
as!:
let mealDetailViewController = segue.destinationViewController as! MealViewController
 If the cast is successful, the local constant mealDetailViewController gets assigned the value of segue.destinationViewController cast as type MealViewController. If the cast is unsuccessful, the app should crash at runtime.
Only use a forced cast if you’re absolutely certain that the cast will succeed—and that if it fails, something has gone wrong in the app and it should crash. Otherwise, downcast using as?.
as?:
if let selectedMealCell = sender as? MealTableViewCell {
}
This code tries to downcast sender to a MealCell using the optional type cast operator (as?). If the cast is successful, the local constant selectedMealCell gets assigned the value of sender cast as type MealTableViewCell, and the if statement proceeds to execute. If the cast is unsuccessful, the expression evaluates to nil and the if statement isn’t executed.

=== : 恒等运算符,判断这两个指针是否是指向同一个对象，一般叫做是否相等
if a === b {}
?? "abc" : let name = nameTextField.text ?? ""// ?? 可选值，如果textfield没有值 nil 那么返回一个默认值 这里是 "abc"
unwind... :@IBAction func unwindToMealList(sender: UIStoryboardSegue) {
}
Exit,从vc1经segue（sb id = mySegue）到vc2(在vc1中会调用preparForSegue func)，再从vc2 Exit返回vc1时也是经segue(sb id = mySegue)返回的，在vc2中一样会调用preparFotSegue func，在vc1中则会调用Exit链接的unwind...方法，这里就是 func unwindToMealList() {}。在上面的func中，都能通过segue查找到sourceController和destiController，运用于属性传值。（FAQ: 属性传值过程中的属性引用问题？）

下面这个判断dismiss/pop的是什么鬼？ （好晕）
let isPresentingInAddMealMode = presentingViewController is UINavigationController
//A ->present(modal/push)-> B
//A.presentedViewController = B
//B.presentingViewController = A

if isPresentingInAddMealMode {
dismissViewControllerAnimated(true, completion: nil)
}
else {
navigationController!.popViewControllerAnimated(true)
}

在swift中实现NSCoding协议：
required convenience init?(coder aDecoder: NSCoder) {
}
The required keyword means this initializer must be implemented on every subclass of the class that defines this initializer.
The convenience keyword denotes this initializer as a convenience initializer. Convenience initializers are secondary（次要的，第二的）, supporting initializers that need to call one of their class’s designated initializers. Designated initializers are the primary initializers for a class. They fully initialize all properties introduced by that class and call a superclass initializer to continue the initialization process up the superclass chain. Here, you’re declaring this initializer as a convenience initializer because it only applies when there’s saved data to be loaded.
The question mark (?) means that this is a failable initializer that might return nil.
//这里的convenience initializer（方便初始化器）只在存储数据的时候被加载

let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
The decodeObjectForKey(_:) method unarchives the stored information stored about an object.
The return value of decodeObjectForKey(_:) is AnyObject, which you downcast in the code above as a String to assign it to a name constant. You downcast the return value using the forced type cast operator (as!) because if the object can’t be cast as a String, or if it’s nil, something has gone wrong and the error should cause a crash at runtime.

Add the following code at the end of the implementation:
// Must call designated initializer.
self.init(name: name, photo: photo, rating: rating)
As a convenience initializer, this initializer is required to call one of its class’s designated initializers before completing. As the initializer’s arguments, you pass in the values of the constants you created while archiving the saved data.
//在解档中必须调用设计的主初始化器
四：
完成以上，进一步完善开发技能：
https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Resources.html#//apple_ref/doc/uid/TP40015214-CH15-SW1
