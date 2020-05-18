<!DOCTYPE html>
<html>
<head>
  	<#import "../common/common.macro.ftl" as netCommon>
	<@netCommon.commonStyle />
	<!-- DataTables -->
  	<link rel="stylesheet" href="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <title>${I18n.admin_name}</title>
    <style type="text/css">
        .atalk{
            margin:10px;
        }
        .atalk span{
            display:inline-block;
            background:#0181cc;
            border-radius:10px;
            color:#fff;
            padding:5px 10px;
        }
        .btalk{
            margin:10px;
            text-align:right;
        }
        .btalk span{
            display:inline-block;
            background:#ef8201;
            border-radius:10px;
            color:#fff;
            padding:5px 10px;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && cookieMap["xxljob_adminlte_settings"]?exists && "off" == cookieMap["xxljob_adminlte_settings"].value >sidebar-collapse</#if> ">
<div class="wrapper">
	<!-- header -->
	<@netCommon.commonHeader />
	<!-- left -->
	<@netCommon.commonLeft "jobgroup" />
	
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>${I18n.jobgroup_name}</h1>
		</section>

		<!-- Main content -->
	    <section class="content">

            <div class="row">
                <div class="col-xs-3">
                    <div class="input-group">
                        <span class="input-group-addon">AppName</span>
                        <input type="text" class="form-control" id="appname" autocomplete="on" placeholder="${I18n.system_please_input}AppName" >
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="input-group">
                        <span class="input-group-addon">${I18n.jobgroup_field_title}</span>
                        <input type="text" class="form-control" id="title" autocomplete="on" placeholder="${I18n.jobgroup_field_title}" >
                    </div>
                </div>
                <div class="col-xs-2">
                    <button class="btn btn-block btn-info" id="searchBtn">${I18n.system_search}</button>
                </div>
                <div class="col-xs-2">
                    <button class="btn btn-block btn-success add" type="button">${I18n.jobinfo_field_add}</button>
                </div>
                <div class="col-xs-2">
                    <button class="btn btn-block btn-success" id="liaoTian">聊天框</button>
                </div>
            </div>
			
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
			            <div class="box-body">
			              	<table id="jobgroup_list" class="table table-bordered table-striped display" width="100%" >
				                <thead>
					            	<tr>
                                        <th name="id" >ID</th>
                                        <th name="appname" >AppName</th>
                                        <th name="title" >${I18n.jobgroup_field_title}</th>
                                        <th name="addressType" >${I18n.jobgroup_field_addressType}</th>
                                        <th name="registryList" >OnLine ${I18n.jobgroup_field_registryList}</th>
                                        <th>${I18n.system_opt}</th>
					                </tr>
				                </thead>
                                <tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
	    </section>
	</div>

    <!-- 新增.模态框 -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" >${I18n.jobgroup_add}</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal form" role="form" >
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">AppName<font color="red">*</font></label>
                            <div class="col-sm-10"><input type="text" class="form-control" name="appname" placeholder="${I18n.system_please_input}AppName" maxlength="64" ></div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">${I18n.jobgroup_field_title}<font color="red">*</font></label>
                            <div class="col-sm-10"><input type="text" class="form-control" name="title" placeholder="${I18n.system_please_input}${I18n.jobgroup_field_title}" maxlength="12" ></div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">${I18n.jobgroup_field_addressType}<font color="red">*</font></label>
                            <div class="col-sm-10">
                                <input type="radio" name="addressType" value="0" checked />${I18n.jobgroup_field_addressType_0}
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="addressType" value="1" />${I18n.jobgroup_field_addressType_1}
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">${I18n.jobgroup_field_registryList}<font color="red">*</font></label>
                            <div class="col-sm-10">
                                <textarea class="textarea" name="addressList" maxlength="512" placeholder="${I18n.jobgroup_field_registryList_placeholder}" readonly="readonly" style="background-color:#eee; width: 100%; height: 100px; font-size: 14px; line-height: 15px; border: 1px solid #dddddd; padding: 5px;"></textarea>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <button type="submit" class="btn btn-primary"  >${I18n.system_save}</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 更新.模态框 -->
    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" >${I18n.jobgroup_edit}</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal form" role="form" >
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">AppName<font color="red">*</font></label>
                            <div class="col-sm-10"><input type="text" class="form-control" name="appname" placeholder="${I18n.system_please_input}AppName" maxlength="64" ></div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">${I18n.jobgroup_field_title}<font color="red">*</font></label>
                            <div class="col-sm-10"><input type="text" class="form-control" name="title" placeholder="${I18n.system_please_input}${I18n.jobgroup_field_title}" maxlength="12" ></div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">${I18n.jobgroup_field_addressType}<font color="red">*</font></label>
                            <div class="col-sm-10">
                                <input type="radio" name="addressType" value="0" />${I18n.jobgroup_field_addressType_0}
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="addressType" value="1" />${I18n.jobgroup_field_addressType_1}
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastname" class="col-sm-2 control-label">${I18n.jobgroup_field_registryList}<font color="red">*</font></label>
                            <div class="col-sm-10">
                                <textarea class="textarea" name="addressList" maxlength="512" placeholder="${I18n.jobgroup_field_registryList_placeholder}" readonly="readonly" style="background-color:#eee; width: 100%; height: 100px; font-size: 14px; line-height: 15px; border: 1px solid #dddddd; padding: 5px;"></textarea>
                            </div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <button type="submit" class="btn btn-primary"  >${I18n.system_save}</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">${I18n.system_cancel}</button>
                                <input type="hidden" name="id" >
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 聊天.模态框 -->
    <div class="modal fade" id="chatModel" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" >智能客服</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal form1" role="form"  onsumbit="false">

                        <div class="form-group" style="padding-right: 27px;">
                            <div class="talk_show" id="words" style="width:530px; height:400px;border:1px solid #666;background:#fff;margin:10px auto 0;overflow:auto;">

                            </div>
                        </div>
                        <hr>
                        <div class="form-group">

                            <div style="padding-left: 20px;padding-bottom: 5px">
                                <button class="btn btn-primary" id="foldButton" type="button">折叠</button>
                                <button class="btn btn-primary" id="clearButton" type="button">清空</button>
                                <button class="btn btn-primary" id="exportButton" type="button">导出</button>
                            </div>

                            <div class="form-group" style="padding-left: 20px;">

                                <div class="col-sm-10">
                                    <input type="text" id="importContent_but" autocomplete="off" class="textarea form-control" name="importContent " placeholder="请输入内容......" maxlength="512" style="background-color:#FFFFFF; width: 110%; height: 70px; font-size: 14px; line-height: 15px; border: 1px solid #dddddd; padding: 5px;">
                                </div>
                                <div class="col-sm-10">
                                    <label for="lastname form-control" style="background-color:#eee; width: 110%; height: 30px; font-size: 14px; line-height: 15px; border: 1px solid #dddddd; padding: 5px;">[发送快捷键enter]</label>
                                </div>
                                <input type="text" name="notautosubmit" style="display:none"/>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	<!-- footer -->
	<@netCommon.commonFooter />
</div>

<@netCommon.commonScript />
<!-- DataTables -->
<script src="${request.contextPath}/static/adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${request.contextPath}/static/adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${request.contextPath}/static/js/jobgroup.index.1.js"></script>
</body>
</html>
