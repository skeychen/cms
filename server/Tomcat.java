public class Tomcat
{
	public static void main(String[] args) throws Exception
	{
		dswork.ee.MyTomcat.class.newInstance().setPort(8833).addWebapp().start();
	}
}
