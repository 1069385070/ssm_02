<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/26
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/style.css"/>
    <link rel="stylesheet" href="../assets/css/ace.min.css" />
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css" />

    <!--  <link rel="stylesheet" href="font/css/font-awesome.min.css" />-->

    <script type="text/javascript">
        window.jQuery || document.write("<script src='../assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>
    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <!-- page specific plugin scripts -->
    <title>用户组信息查看</title>
</head>
<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <form class="search_style" id="search_form_list">
                <input type="hidden" name="roleId" id="roleId">
                <ul class="search_content clearfix">
                    <li>
                        <label class="l_f">用户账号：</label>
                        <input name="username" type="text"  class="text_add" placeholder="输入用户账号"  />
                    </li>
                    <li>
                        <label class="l_f">用户姓名：</label>
                        <input name="name" type="text"  class="text_add" placeholder="输入用户姓名"  />
                    </li>
                    <li>
                        <label class="l_f">手机号：</label>
                        <input name="tel" type="text"  class="text_add" placeholder="输入手机号"  />
                    </li>
                    <li>
                        <label class="l_f">部门：</label>
                        <select name="post" style="width:90px">
                            <option>--所有--</option>
                            <option>部门1</option>
                            <option>部门2</option>
                            <option>部门3</option>
                        </select>
                    </li>
                    <li style="width:90px;">
                        <button type="button" class="btn_search" onclick="search_user_list()"><i class="icon-search"></i>查询</button>
                    </li>
                </ul>
            </form>
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th  >账号</th>
                        <th  >名称</th>
                        <th  >年龄</th>
                        <th >电话</th>
                        <th >QQ</th>
                        <th >职务</th>
                        <th >角色</th>
                        <th >添加时间</th>
                        <th >状态</th>
                    </tr>
                    </thead>
                    <tbody id="tbody">
                    <%--<tr>
                        <td>001</td>
                        <td> 张三</td>
                        <td>23</td>
                        <td>13999999999</td>
                        <td>291023733</td>
                        <td >部门1</td>
                        <td>普通用户</td>
                        <td>2014-6-11 14:21</td>
                        <td class="td-status"><span class="label label-success radius">正常</span></td>
                    </tr>--%>
                    <%--<tr>
                        <td>001</td>
                        <td> 张三</td>
                        <td>23</td>
                        <td>13999999999</td>
                        <td>291023733</td>
                        <td >部门1</td>
                        <td>普通用户</td>
                        <td>2014-6-11 14:21</td>
                        <td class="td-status"><span class="label label-success radius">正常</span></td>
                    </tr> --%>
                    <%--<tr>
                        <td>001</td>
                        <td> 张三</td>
                        <td>23</td>
                        <td>13999999999</td>
                        <td>291023733</td>
                        <td >部门1</td>
                        <td>普通用户</td>
                        <td>2014-6-11 14:21</td>
                        <td class="td-status"><span class="label label-success radius">正常</span></td>
                    </tr> --%>
                    <%--<tr>
                        <td>001</td>
                        <td> 张三</td>
                        <td>23</td>
                        <td>13999999999</td>
                        <td>291023733</td>
                        <td >部门1</td>
                        <td>普通用户</td>
                        <td>2014-6-11 14:21</td>
                        <td class="td-status"><span class="label label-success radius">正常</span></td>
                    </tr> --%>
                    <%--<tr>
                        <td>001</td>
                        <td> 张三</td>
                        <td>23</td>
                        <td>13999999999</td>
                        <td>291023733</td>
                        <td >部门1</td>
                        <td>普通用户</td>
                        <td>2014-6-11 14:21</td>
                        <td class="td-status"><span class="label label-success radius">正常</span></td>
                    </tr>--%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div style="margin:0 auto; width:80px;">
    <button onclick="return_close();" class="btn btn-default radius" type="button">返回上一步</button>
    </div>
    </body>
    </html>
    <script>
    var roleId=GetQueryString("roleId");
    /*查询*/
    $().ready(function() {
        selectAdminByRoleId({"roleId":roleId});
    });
    function search_user_list(){
        //$("#search_form_list").submit();
        $("#roleId").val(roleId);
        var param=$('#search_form_list').serialize();
        selectAdminByRoleId(param)
    }

    //返回操作
    function return_close(){
        location.href="user-group.jsp";

    }

    function GetQueryString(name){
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null){
            return unescape(r[2]);
        }else{
            return null;
        }
    }
    //根据条件查询用户组下的用户
    function selectAdminByRoleId(param) {
        $.ajax({
            url: '/selectAdminByAdminRole.do',
            type: 'post',  // 请求类型
            data: param,  // post时请求体
            dataType: 'json',  // 返回请求的类型，有text/json两种
            async: true,   // 是否异步
            /*  cache: true,   // 是否缓存 */
            timeout:null,  // 设置请求超时
            contentType: 'application/x-www-form-urlencoded',
            success:function(data){
                console.log(data)
                var html="";
                var state="";
                var spanclass="";
                if (data!=null&&data.length!=0){
                    $.each(data, function (index,element) {
                        if (element.state==1) {
                            state="已启用"
                            spanclass="label label-success radius";
                        }
                        if (element.state==0) {
                            state="已停用"
                            spanclass="label label-defaunt radius";
                        }
                        html+="<tr><td>"+element.username+"</td><td>"+element.name+"</td><td>"+element.age+"</td><td>"+element.tel+"</td><td>"+element.qq+"</td><td>"+element.post+"</td>";
                        html+="<td>"+element.roleName+"</td><td>"+element.addTime+"</td>";
                        html+="<td class='td-status'><span class='"+spanclass+"'>"+state+"</span></td></tr>";
                    });
                    $("#tbody").html(html);
                }else{
                    $("#tbody").html("<tr><td colspan='11' style='text-align: center;'>没有查询到符合条件的数据</td></tr>");
                }

            }
        });
    }
</script>
