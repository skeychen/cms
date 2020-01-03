<%@page language="java" contentType="text/html;charset=UTF-8" %><%!
// 使用此功能需要增加jar：dswork-db-redis.jar,commons-pool2-2.6.1.jar,jedis-3.1.0.jar
static dswork.db.redis.RedisUtil db = new dswork.db.redis.RedisUtil(//
		new dswork.db.redis.config.RedisConfig()//
		.setHost("127.0.0.1")//
		.setPassword(null)//
		.setDatabase(1)//
		.setPort(6379)//
		.setMinIdle(2)//
		.setMaxIdle(2)//
		.setMaxTotal(2)//
		.setMaxWaitMillis(10000)//
		.setTestOnBorrow(true)//
		.setTestOnReturn(false)//
		.setTestWhileIdle(true)//
		.setMinEvictableIdleTimeMillis(60000)//
		.setTimeBetweenEvictionRunsMillis(30000)//
		.setNumTestsPerEvictionRun(-1)//
		.setConnectTimeout(2000)//
		.setSoTimeout(2000)//
		.setClientName(null)//
	);

static String s = "{\"code\":1,\"data\":{\"s\":\"%s\"}}";
static String c = "{\"code\":1,\"data\":{\"s\":\"%s\",\"c\":\"%s\"}}";
static String p = "{\"code\":1,\"data\":{\"s\":\"%s\",\"c\":\"%s\",\"p\":\"%s\"}}";
%><%
response.setCharacterEncoding("UTF-8");
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
dswork.web.MyRequest req = new dswork.web.MyRequest(request);
long siteid = req.getLong("s", 0L);
long categoryid = req.getLong("c", 0L);
long pageid = req.getLong("p", 0L);
redis.clients.jedis.Jedis jedis = null;
String json = null;
try
{
	if(siteid > 0)
	{
		jedis = db.getJedis();
		String k = siteid + "";
		jedis.hincrBy("site", k, 1);// 全站访问量加1
		String sCount = jedis.hget("site", k);
		if(categoryid > 0)
		{
			k = categoryid + "";
			jedis.hincrBy("category", k, 1);// 栏目访问量加1
			String cCount = jedis.hget("category", k);
			if(pageid > 0)
			{
				k = pageid + "";
				jedis.hincrBy("page", k, 1);// 文章访问量加1
				String pCount = jedis.hget("page", k);
				json = String.format(p, sCount, cCount, pCount);
			}
			else
			{
				json = String.format(c, sCount, cCount);
			}
		}
		else
		{
			json = String.format(s, sCount);
		}
	}
}
catch(Exception e)
{
}
finally
{
	if(jedis != null)
	{
		jedis.close();
	}
}
if(json != null)
{
%>var json = <%=json %>;
document.write("网站访问量：" + json.data.s + (json.data.c > 0 ? "，栏目访问量：" + json.data.c : "") + (json.data.p > 0 ? "，文章访问量：" + json.data.p : ""));
<%
}
%>