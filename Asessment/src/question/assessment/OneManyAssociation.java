package question.assessment;

class Parent
{
	public void method()
	{
		System.out.println("This is example of one to many association");
	}
}
class Child1 extends Parent
{
	
}
class Child2 extends Parent
{
	
}
class Child3 extends Parent
{
	
}
public class OneManyAssociation {
	public static void main(String[] args) {
		Parent p=new Parent();
		p.method();
		Child1 c1=new Child1();
		c1.method();
		Child2 c2=new Child2();
		c2.method();
		Child3 c3=new Child3();
		c3.method();
	}
}