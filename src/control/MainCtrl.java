package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommDAO;
import util.Info;

public class MainCtrl extends HttpServlet {

	public MainCtrl() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void go(String url, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void gor(String url, HttpServletRequest request, HttpServletResponse response) {
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		HashMap admin = (HashMap) session.getAttribute("admin");
		HashMap user = (HashMap) session.getAttribute("user");
		String ac = request.getParameter("ac");
		if (ac == null)
			ac = "";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0, 10);
		String tomonth = date.substring(0, 7);

		// 登录
		if (ac.equals("login")) {
			String utype = request.getParameter("utype");
			String username = request.getParameter("uname");
			String password = request.getParameter("upass");
			String sql = "select * from sysuser where uname='" + username + "' and upass='" + password + "' ";
			List<HashMap> userlist = dao.select(sql);
			if (userlist.size() != 1) {
				request.setAttribute("error", "");
				go("/admin/login.jsp", request, response);
			} else {
				request.getSession().setAttribute("admin", userlist.get(0));
				gor("/srykzsblmis/admin/index.jsp", request, response);
			}
		}

		// 添加用户
		if (ac.equals("sysuseradd")) {
			String uname = request.getParameter("uname");
			String cksql = "select * from sysuser where uname='" + uname + "'";
			ArrayList cklist = (ArrayList) dao.select(cksql);
			if (cklist.size() != 0) {
				request.getParameter("no");
				go("/admin/sysuseradd.jsp", request, response);
			} else {
				String upass = request.getParameter("upass");
				String tname = request.getParameter("tname");
				String utype = request.getParameter("utype");
				String sex = request.getParameter("sex");
				String birth = request.getParameter("birth");
				String tel = request.getParameter("tel");
				String ismarage = request.getParameter("ismarage");
				String addr = request.getParameter("addr");
				String email = request.getParameter("email");
				String idcard = request.getParameter("idcard");
				String byschool = request.getParameter("byschool");
				String dept = request.getParameter("dept");
				if (!utype.equals("医生")) {
					dept = "";
				}
				String sql = "insert into sysuser (uname,upass,tname,utype,sex,dept,birth,tel,ismarage,addr,email,idcard,byschool)values"
						+ " ('" + uname + "','" + upass + "','" + tname + "','" + utype + "','" + sex + "','" + dept
						+ "','" + birth + "','" + tel + "','" + ismarage + "'" + " ,'" + addr + "','" + email + "','"
						+ idcard + "','" + byschool + "')";
				dao.commOper(sql);
				request.setAttribute("suc", "");
				go("/admin/sysuseradd.jsp", request, response);
			}
		}
		// 编辑用户
		if (ac.equals("sysuseredit")) {
			String id = request.getParameter("id");
			String upass = request.getParameter("upass");
			String tname = request.getParameter("tname");
			String utype = request.getParameter("utype");
			String sex = request.getParameter("sex");
			String dept = request.getParameter("dept");
			String birth = request.getParameter("birth");
			String tel = request.getParameter("tel");
			String ismarage = request.getParameter("ismarage");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			String idcard = request.getParameter("idcard");
			String byschool = request.getParameter("byschool");
			if (!utype.equals("医生")) {
				dept = "";
			}
			String sql = "update sysuser set upass='" + upass + "',tname='" + tname + "',utype='" + utype + "',sex='"
					+ sex + "',dept='" + dept + "' " + " ,birth='" + birth + "',tel='" + tel + "',ismarage='" + ismarage
					+ "',addr='" + addr + "',email='" + email + "'" + " ,idcard='" + idcard + "',byschool='" + byschool
					+ "' where id=" + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/sysuseradd.jsp", request, response);
		}

		// 修改个人信息
		if (ac.equals("stuedit1")) {
			String id = request.getParameter("id");
			String upass = request.getParameter("upass");
			String tname = request.getParameter("tname");
			String sfcard = request.getParameter("sfcard");
			String sex = request.getParameter("sex");
			String tel = request.getParameter("tel");
			String yx = request.getParameter("yx");
			String bj = request.getParameter("bj");
			String sql = "update student set upass='" + upass + "',tname='" + tname + "',sfcard='" + sfcard + "',sex='"
					+ sex + "',tel='" + tel + "',yx='" + yx + "',bj='" + bj + "' where id=" + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/stuinfo.jsp", request, response);
		}

		// 添加科室
		if (ac.equals("deptadd")) {
			String deptname = request.getParameter("deptname");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			String delstatus = "0";
			String sql = "insert into dept (deptname,tel,addr,delstatus) values('" + deptname + "','" + tel + "','"
					+ addr + "','" + delstatus + "')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/deptadd.jsp", request, response);
		}
		// 修改科室
		if (ac.equals("deptedit")) {
			String id = request.getParameter("id");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			String deptname = request.getParameter("deptname");

			String sql = "update dept set deptname='" + deptname + "',tel='" + tel + "',addr='" + addr + "' where id= "
					+ id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/deptadd.jsp", request, response);
		}
		// 添加药品、处置
		if (ac.equals("ypcfadd")) {
			String yno = request.getParameter("yno");
			String cksql = "select * from ypcf where yno='" + yno + "'";
			ArrayList cklist = (ArrayList) dao.select(cksql);
			if (cklist.size() != 0) {
				request.getParameter("no");
				go("/admin/ypcfadd.jsp", request, response);
			} else {
				String yname = request.getParameter("yname");
				String price = request.getParameter("price");
				String type = request.getParameter("type");
				String gg = request.getParameter("gg");
				String company = request.getParameter("company");
				if (!type.equals("药品")) {
					gg = "";
					company = "";
				}
				String delstatus = "0";
				String sql = "insert into ypcf (yno,yname,gg,price,company,delstatus,type)values('" + yno + "','"
						+ yname + "','" + gg + "','" + price + "','" + company + "','" + delstatus + "','" + type
						+ "')";
				dao.commOper(sql);
				request.setAttribute("suc", "");
				go("/admin/ypcfadd.jsp", request, response);
			}
		}
		// 编辑药品、处置
		if (ac.equals("ypcfedit")) {
			String id = request.getParameter("id");
			String yname = request.getParameter("yname");
			String price = request.getParameter("price");
			String type = request.getParameter("type");
			String gg = request.getParameter("gg");
			String company = request.getParameter("company");
			if (!type.equals("药品")) {
				gg = "";
				company = "";
			}
			String sql = "update ypcf set yname='" + yname + "',gg='" + gg + "',price='" + price + "',company='"
					+ company + "',type='" + type + "' where id=" + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/ypcfadd.jsp", request, response);
		}

		// 修改密码
		if (ac.equals("uppass")) {
			String id = request.getParameter("id");
			String upass = request.getParameter("upass");
			String tname = request.getParameter("tname");
			String sex = request.getParameter("sex");
			String birth = request.getParameter("birth");
			String tel = request.getParameter("tel");
			String ismarage = request.getParameter("ismarage");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			String idcard = request.getParameter("idcard");
			String byschool = request.getParameter("byschool");
			String sql = "update sysuser set upass='" + upass + "',tname='" + tname + "',sex='" + sex + "'  ,birth='"
					+ birth + "',tel='" + tel + "',ismarage='" + ismarage + "',addr='" + addr + "',email='" + email
					+ "'" + " ,idcard='" + idcard + "',byschool='" + byschool + "' where id=" + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/uppass.jsp", request, response);
		}
		// 退出
		if (ac.equals("exit")) {
			session.removeAttribute("admin");
			request.setAttribute("suc", "");
			go("/admin/login.jsp", request, response);
		}
		// 新增挂号
		if (ac.equals("ghadd")) {
			String ghno = request.getParameter("ghno");
			String tname = request.getParameter("tname");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String idcard = request.getParameter("idcard");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			String ghdept = request.getParameter("ghdept");
			String price = request.getParameter("price");
			String status = "待问诊";
			String delstatus = "0";
			String oper = admin.get("uname").toString();
			String savetime = Info.getDateStr();
			dao.commOper(
					"insert into ghinfo (ghno,tname,sex,age,idcard,tel,addr,ghdept,price,status,delstatus,oper,savetime) "
							+ " values('" + ghno + "','" + tname + "','" + sex + "','" + age + "','" + idcard + "','"
							+ tel + "','" + addr + "','" + ghdept + "','" + price + "','" + status + "','" + delstatus
							+ "','" + oper + "','" + savetime + "')  ");
			request.setAttribute("suc", "");
			go("/admin/ghadd.jsp", request, response);
		}
		// 药品入库
		if (ac.equals("yprk")) {
			String yno = request.getParameter("yno");
			String num = request.getParameter("num");
			String type = "in";
			String oper = admin.get("uname").toString();
			String savetime = Info.getDateStr();
			dao.commOper("insert into kcrecord (yno,num,type,savetime,oper) values ('" + yno + "','" + num + "','"
					+ type + "','" + savetime + "','" + oper + "') ");
			request.setAttribute("suc", "");
			go("/admin/yprk.jsp", request, response);
		}

		if (ac.equals("export")) {

			String sql = "select * from zd where fkstatus='已付款' ";
			sql += "order by ghno desc";
			ArrayList<HashMap> list = (ArrayList) dao.select(sql);
			List<List> rlist = new ArrayList();
			DecimalFormat decimal = new DecimalFormat("#.#");
			for (HashMap map : list) {

				HashMap am = dao.select("select * from ghinfo where ghno='" + map.get("ghno") + "'").get(0);
				HashMap mstu = dao.select("select * from zd where ghno='" + map.get("ghno") + "'").get(0);
				String info = mstu.get("info").toString();
				String numinfo = mstu.get("numinfo").toString();
				String yinfo = "";
				String a[] = info.split("\\$");
				String b[] = numinfo.split("\\$");
				for (int i = 0; i < a.length; i++) {
					yinfo += a[i] + "&nbsp;&nbsp;数量:" + b[i] + "<br/>";
				}
				List mlist = new ArrayList();
				mlist.add(map.get("ghno"));
				mlist.add(am.get("tname"));
				mlist.add(am.get("sex"));
				mlist.add(am.get("age"));
				mlist.add(mstu.get("bq"));
				mlist.add(mstu.get("zd"));
				mlist.add(yinfo);
				mlist.add(decimal.format(Double.valueOf(map.get("totalprice").toString())) + "元");
				mlist.add(map.get("sfoper"));
				mlist.add(map.get("sfsavetime"));
				rlist.add(mlist);
			}
			// String[] pros = {"挂号编号","患者姓名","收费金额","收费人","收费时间"};
			String[] pros = { "挂号编号", "患者姓名", "性别", "年龄", "病情", "诊断", "药品处置", "收费金额", "收费人", "收费时间" };
			Info.writeExcel(request.getRealPath("/upfile/") + "/sfexport.xls", pros, rlist, request, response);
		}

		if (ac.equals("ghexport")) {

			String sql = "select * from ghinfo where 1=1 and delstatus='0'";
			sql += "order by id desc";
			ArrayList<HashMap> list = (ArrayList) dao.select(sql);
			List<List> rlist = new ArrayList();
			DecimalFormat decimal = new DecimalFormat("#.#");
			for (HashMap map : list) {
				List mlist = new ArrayList();
				mlist.add(map.get("ghno"));
				mlist.add(decimal.format(Double.valueOf(map.get("price").toString())) + "元");
				HashMap dm = dao.select("select * from dept where id=" + map.get("ghdept")).get(0);
				mlist.add(dm.get("deptname"));
				mlist.add(map.get("oper"));
				mlist.add(map.get("savetime"));

				rlist.add(mlist);
			}
			String[] pros = { "挂号编号", "挂号金额", "挂号科室", "操作人", "操作时间" };
			Info.writeExcel(request.getRealPath("/upfile/") + "/ghexport.xls", pros, rlist, request, response);
		}

		if (ac.equals("test")) {
			String str = request.getParameter("str");
			String sql = "select * from sysuser where uname like '%" + str + "%' or tname like '%" + str + "%' ";
			if (str.equals("")) {
				sql = "select * from sysuser";
			}
			System.out.println(sql);
			String returnStr = "";
			ArrayList<HashMap> list = (ArrayList<HashMap>) dao.select(sql);
			System.out.println("aa-=" + list.size());
			if (list.size() != 0) {
				for (HashMap map : list) {
					returnStr += map.get("uname") + "-" + map.get("tname") + "$";
				}
				out.println(returnStr);
			} else {
				out.println("");
			}
		}
		if (ac.equals("testadd")) {
			String Hidden1 = request.getParameter("Hidden1");
			// String str[] = Hidden1.split("\\$");
			String cfno = "czd001";
			// for(int i=0;i<str.length;i++){
			// System.out.println("aaa="+str[i]);
			// }
			System.out.println("Hidden1==" + Hidden1);
			String sql = "update czd set info='" + Hidden1 + "' where cfno='" + cfno + "' ";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/testadd1.jsp?cfno=" + cfno, request, response);
		}
		// 自动补全药品
		if (ac.equals("ajaxsearch")) {
			String str = request.getParameter("str");
			System.out.println("aaaaaaaaaaaa==" + str);
			String sql = "select * from ypcf where (yno like '%" + str + "%' or yname like '%" + str
					+ "%') and delstatus='0'  ";
			if (str.equals("")) {
				sql = "select * from ypcf";
			}
			System.out.println(sql);
			String returnStr = "";
			ArrayList<HashMap> list = (ArrayList<HashMap>) dao.select(sql);
			System.out.println("aa-=" + list.size());
			if (list.size() != 0) {
				for (HashMap map : list) {
					returnStr += map.get("yno") + "-" + map.get("yname") + "-" + map.get("price") + "元$";
				}
				out.println(returnStr);
			} else {
				out.println("");
			}
		}
		// 问诊添加
		if (ac.equals("wzadd")) {
			String ghno = request.getParameter("ghno");
			String bq = request.getParameter("bq");
			String zd = request.getParameter("zd");
			String info = request.getParameter("Hidden1");
			String numinfo = request.getParameter("Hidden2");
			String oper = admin.get("uname").toString();
			String savetime = Info.getDateStr();
			String qystatus = "未取药";
			String fkstatus = "未付款";
			dao.commOper("update ghinfo set status='已问诊' where ghno='" + ghno + "'");
			String sql = "insert into zd (ghno,bq,zd,info,numinfo,oper,savetime,qystatus,fkstatus) values" + " ('"
					+ ghno + "','" + bq + "','" + zd + "','" + info + "','" + numinfo + "','" + oper + "','" + savetime
					+ "','" + qystatus + "','" + fkstatus + "') ";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/brwz.jsp?ghno=" + ghno, request, response);
		}

		// 修改问诊
		if (ac.equals("wzedit")) {
			String ghno = request.getParameter("ghno");
			String bq = request.getParameter("bq");
			String zd = request.getParameter("zd");
			String info = request.getParameter("Hidden1");
			String numinfo = request.getParameter("Hidden2");
			System.out.println("numinfo==" + numinfo);
			String sql = "update zd set bq='" + bq + "',zd='" + zd + "',info='" + info + "',numinfo='" + numinfo
					+ "' where ghno='" + ghno + "'";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/brwzedit.jsp?ghno=" + ghno, request, response);
		}
		// 取药
		if (ac.equals("qy")) {
			String ghno = request.getParameter("ghno");
			HashMap zdm = dao.select("select * from zd where ghno='" + ghno + "'").get(0);
			String yinfo = zdm.get("info").toString();
			String numinfo = zdm.get("numinfo").toString();
			String a[] = yinfo.split("\\$");
			String b[] = numinfo.split("\\$");
			String is = "yes";
			int m = 0;
			for (int i = 0; i < a.length; i++) {
				String ynos[] = a[i].split("\\-");
				ArrayList amlist = (ArrayList) dao
						.select("select * from ypcf where yno='" + ynos[0] + "' and type='药品' ");
				if (amlist.size() != 0) {
					HashMap am = dao.select("select * from ypcf where yno='" + ynos[0] + "' and type='药品' ").get(0);
					String yno = am.get("yno").toString();// 药品编号
					int num = Integer.parseInt(b[i]);// 购买药品数量
					// 查药品数量
					HashMap inmap = dao
							.select("select sum(num) as innum from kcrecord where type='in' and yno='" + ynos[0] + "' ")
							.get(0);
					HashMap outmap = dao.select(
							"select sum(num) as outnum from kcrecord where type='out' and yno='" + ynos[0] + "' ")
							.get(0);
					int innum = 0;
					int outnum = 0;
					if (inmap.get("innum") != null) {
						innum = Integer.parseInt(inmap.get("innum").toString());
					}
					if (outmap.get("outnum") != null) {
						outnum = Integer.parseInt(outmap.get("outnum").toString());
					}
					int kc = innum - outnum;
					if (num > kc) {
						m++;
					}
					//

				}
			}
			if (m == 0) {
				for (int i = 0; i < a.length; i++) {
					String ynos[] = a[i].split("\\-");
					ArrayList amlist = (ArrayList) dao
							.select("select * from ypcf where yno='" + ynos[0] + "' and type='药品' ");
					if (amlist.size() != 0) {
						HashMap am = dao.select("select * from ypcf where yno='" + ynos[0] + "' and type='药品' ").get(0);
						String yno = am.get("yno").toString();// 药品编号
						int num = Integer.parseInt(b[i]);// 购买药品数量
						// 查药品数量
						HashMap inmap = dao.select(
								"select sum(num) as innum from kcrecord where type='in' and yno='" + ynos[0] + "' ")
								.get(0);
						HashMap outmap = dao.select(
								"select sum(num) as outnum from kcrecord where type='out' and yno='" + ynos[0] + "' ")
								.get(0);
						int innum = 0;
						int outnum = 0;
						if (inmap.get("innum") != null) {
							innum = Integer.parseInt(inmap.get("innum").toString());
						}
						if (outmap.get("outnum") != null) {
							outnum = Integer.parseInt(outmap.get("outnum").toString());
						}
						int kc = innum - outnum;

						dao.commOper("insert into kcrecord (yno,num,type,savetime,oper) values ('" + yno + "','" + num
								+ "','out','" + Info.getDateStr() + "','" + admin.get("uname") + "') ");
					}
				}
				dao.commOper("update zd set fyoper='" + admin.get("uname") + "',fysavetime='" + Info.getDateStr()
						+ "',qystatus='已取药'  where ghno='" + ghno + "'");
				request.setAttribute("suc", "");
				go("/admin/dfy.jsp", request, response);
			} else {
				request.setAttribute("no", "");
				go("/admin/dfy.jsp", request, response);
			}
		}

		// 注册
		if (ac.equals("regedit")) {
			System.out.println("123123");
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			String tname = request.getParameter("tname");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String idcard = request.getParameter("idcard");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			String delstatus = "0";
			ArrayList cklist = (ArrayList) dao
					.select("select * from patient where delstatus='0' and uname='" + uname + "' ");
			if (cklist.size() > 0) {
				request.setAttribute("no", "");
			} else {
				dao.commOper("insert into patient (uname,upass,tname,sex,age,idcard,tel,addr,delstatus) values " + "('"
						+ uname + "','" + upass + "','" + tname + "','" + sex + "','" + age + "','" + idcard + "','"
						+ tel + "','" + addr + "','" + delstatus + "') ");
				request.setAttribute("suc", "");
				go("/regedit.jsp", request, response);
			}
		}
		// 患者修改个人信息
		if (ac.equals("userinfo")) {
			String id = request.getParameter("id");
			String upass = request.getParameter("upass");
			String tname = request.getParameter("tname");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String idcard = request.getParameter("idcard");
			String tel = request.getParameter("tel");
			String addr = request.getParameter("addr");
			dao.commOper("update patient set upass='" + upass + "',tname='" + tname + "',sex='" + sex + "',age='" + age
					+ "'," + " idcard='" + idcard + "',tel='" + tel + "',addr='" + addr + "' where id=" + id);
			request.setAttribute("suc", "");
			go("/userinfo.jsp", request, response);
		}

		// 用户登陆
		if (ac.equals("plogin")) {
			String uname = request.getParameter("uname");
			String upass = request.getParameter("upass");
			ArrayList list = (ArrayList) dao.select(
					"select * from patient where uname='" + uname + "' and upass='" + upass + "' and delstatus='0' ");
			if (list.size() == 1) {
				session.setAttribute("user", list.get(0));
				request.setAttribute("suc", "");
				gor("index.jsp", request, response);
			} else {
				request.setAttribute("no", "");
				go("index.jsp", request, response);
			}

		}

		// 预约
		if (ac.equals("yy")) {
			String uid = user.get("id").toString();
			String type = request.getParameter("type");
			String dept = request.getParameter("id");
			String savetime = Info.getDateStr();
			dao.commOper("insert into yy (uid,type,dept,ghno,savetime) values ('" + uid + "','" + type + "','" + dept
					+ "','','" + savetime + "') ");
			request.setAttribute("suc", "");
			go("yy.jsp?id=" + dept, request, response);
		}
		// 挂号受理
		if (ac.equals("yysl")) {
			System.out.println("aa");
			String id = request.getParameter("id");
			HashMap map = dao.select("select * from yy where id=" + id).get(0);
			HashMap mm = dao.select("select * from patient where id=" + map.get("uid")).get(0);
			String ghno = Info.AutoID();
			String tname = mm.get("tname").toString();
			String sex = mm.get("sex").toString();
			String age = mm.get("age").toString();
			String idcard = mm.get("idcard").toString();
			String tel = mm.get("tel").toString();
			String addr = mm.get("addr").toString();
			String ghdept = map.get("dept").toString();
			String price = map.get("type").toString();
			String status = "待问诊";
			String delstatus = "0";
			String oper = "网上预约";
			String savetime = Info.getDateStr();
			dao.commOper("update yy set ghno ='" + ghno + "' where id=" + id);
			dao.commOper(
					"insert into ghinfo (ghno,tname,sex,age,idcard,tel,addr,ghdept,price,status,delstatus,oper,savetime) "
							+ " values('" + ghno + "','" + tname + "','" + sex + "','" + age + "','" + idcard + "','"
							+ tel + "','" + addr + "','" + ghdept + "','" + price + "','" + status + "','" + delstatus
							+ "','" + oper + "','" + savetime + "')  ");
			request.setAttribute("suc", "");
			go("admin/yy.jsp", request, response);
		}
		// 前台退出
		if (ac.equals("frontexit")) {
			session.removeAttribute("user");
			go("index.jsp", request, response);
		}

		// 添加公告
		if (ac.equals("noticeadd")) {
			String title = request.getParameter("title");
			String note = request.getParameter("note");
			String savetime = Info.getDateStr();
			String sql = "insert into notice (title,note,savetime) values('" + title + "','" + note + "','" + savetime
					+ "')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/noticeadd.jsp", request, response);
		}
		// 修改公告
		if (ac.equals("noticeedit")) {
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String note = request.getParameter("note");
			String sql = "update notice set title='" + title + "',note='" + note + "' where id= " + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/noticeadd.jsp", request, response);
		}

		// 添加留言
		if (ac.equals("chatadd")) {
			String msg = request.getParameter("msg");
			String hfmsg = "";
			String savetime = Info.getDateStr();
			String uid = user.get("id").toString();
			String sql = "insert into chat (msg,hfmsg,savetime,uid) values('" + msg + "','" + hfmsg + "','" + savetime
					+ "','" + uid + "')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("chat.jsp", request, response);
		}
		// 回复留言
		if (ac.equals("chathf")) {
			String id = request.getParameter("id");
			String hfmsg = request.getParameter("hfmsg");
			String sql = "update chat set hfmsg='" + hfmsg + "' where id= " + id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			go("/admin/chathf.jsp?id=" + id, request, response);
		}

		dao.close();
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
