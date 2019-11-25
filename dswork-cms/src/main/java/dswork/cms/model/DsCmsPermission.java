/**
 * 采编审核权限Model
 */
package dswork.cms.model;

public class DsCmsPermission
{
	// 主键
	private Long id = 0L;
	// 站点ID
	private long siteid = 0L;
	// 用户账号
	private String account = "";
	// 可采编栏目
	private String canEditall = "";
	// 可采编栏目（限个人）
	private String canEditown = "";
	// 可审核栏目
	private String canAudit = "";
	// 可发布栏目
	private String canPublish = "";

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public long getSiteid()
	{
		return siteid;
	}

	public void setSiteid(long siteid)
	{
		this.siteid = siteid;
	}

	public String getAccount()
	{
		return account;
	}

	public void setAccount(String account)
	{
		this.account = account;
	}

	/**
	 * 获取可采编栏目ID字符串<br>
	 * 格式：[,[栏目ID,[栏目ID,...]]]<br>
	 * 一个逗号或空字符串表示没有配置任何栏目的采编权限
	 * @return String
	 */
	public String getCanEditall()
	{
		return canEditall;
	}

	/**
	 * 设置可采编栏目ID字符串<br>
	 * 格式：[,[栏目ID,[栏目ID,...]]]<br>
	 * 一个逗号或空字符串表示没有配置任何栏目的采编权限
	 * @param idsArray 格式：[,[栏目ID,[栏目ID,...]]]
	 */
	public void setCanEditall(String idsArray)
	{
		this.canEditall = idsArray;
	}

	/**
	 * 获取个人可采编栏目ID字符串<br>
	 * 格式：[,[栏目ID,[栏目ID,...]]]<br>
	 * 一个逗号或空字符串表示没有配置任何栏目的个人采编权限
	 * @return String
	 */
	public String getCanEditown()
	{
		return canEditown;
	}

	/**
	 * 设置个人可采编栏目ID字符串<br>
	 * 格式：[,[栏目ID,[栏目ID,...]]]<br>
	 * 一个逗号或空字符串表示没有配置任何栏目的个人采编权限
	 * @param idsArray 格式：[,[栏目ID,[栏目ID,...]]]
	 */
	public void setCanEditown(String idsArray)
	{
		this.canEditown = idsArray;
	}

	/**
	 * 获取可审核栏目ID字符串<br>
	 * 格式：[,[栏目ID,[栏目ID,...]]]<br>
	 * 一个逗号或空字符串表示没有配置任何栏目的审核权限
	 * @return String
	 */
	public String getCanAudit()
	{
		return canAudit;
	}

	/**
	 * 设置可审核栏目ID字符串<br>
	 * 格式：[,[栏目ID,[栏目ID,...]]]<br>
	 * 一个逗号或空字符串表示没有配置任何栏目的审核权限
	 * @param idsArray 格式：[,[栏目ID,[栏目ID,...]]]
	 */
	public void setCanAudit(String idsArray)
	{
		this.canAudit = idsArray;
	}

	/**
	 * 获取可发布栏目ID字符串<br>
	 * 格式：[,[栏目ID,[栏目ID,...]]]<br>
	 * 一个逗号或空字符串表示没有配置任何栏目的发布权限
	 * @return String
	 */
	public String getCanPublish()
	{
		return canPublish;
	}

	/**
	 * 设置可发布栏目ID字符串<br>
	 * 格式：[,[栏目ID,[栏目ID,...]]]<br>
	 * 一个逗号或空字符串表示没有配置任何栏目的发布权限
	 * @param idsArray 格式：[,[栏目ID,[栏目ID,...]]]
	 */
	public void setCanPublish(String idsArray)
	{
		this.canPublish = idsArray;
	}
}
