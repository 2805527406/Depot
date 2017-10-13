$(function(){
		$('#dg').datagrid({    
		    url:'elist.sw', 
		    queryParams:{
		    	ename:'',
		    	dept_id:0
		    },
		    columns:[[    
		        {field:'eid',title:'编号',width:100},    
		        {field:'ename',title:'姓名',width:100},    
		        {field:'sex',title:'性别',width:100},
		        {field:'hire',title:'更改日期'},
		        {field:'dname',title:'部门',formatter:function(value,row,index){
		        	return row.dept?row.dept.dname:"--";
		        }},
		        {field:'cz',title:'操作',formatter:function(value,row,index){
		        	return "<a href='javascript:void(0)' onclick='del("+row.eid+")'>删除</a>&nbsp;<a href='javascript:void(0)' onclick='toupdate("+row.eid+")'>修改</a>";
		        }}
		    ]]    
		});  

	})
	
	function del(eid){
		$.get('edel.sw',{eid:eid},function(data){
			alert(data);
			$('#dg').datagrid('reload');
		})
	}
	
	function toupdate(eid){
		$('#f').form('load',"etoupdate/"+eid+".sw");
		$("#dv").dialog("open");
	}
	
	//渲染下拉列表
	$(function(){
		$('#cc').combobox({    
		    url:'elist2.sw',    
		    valueField:'did',    
		    textField:'dname'
		});
		
		$('#c2').combobox({    
		    url:'elist2.sw',    
		    valueField:'did',    
		    textField:'dname'
		});
	})
	
	
	
	//查询
	function cx(){
		$("#dg").datagrid('reload',{
			ename:$("input[name='ename']").val(),
			dept_id:$("input[name='dept_id']").val()
		});
	}
	
	//表单提交
	function tj(){
		var eid=parseInt($("input[name='eid']").val());
		console.log(eid);
		var url=null;
		if(eid){
			console.log("修改");
			url="eupdate.sw";
		}else{
			console.log("添加");
			url="eadd.sw";
		}
		$("#f").form('submit',{
			url:url,
			onSubmit:function(){
				
			},
			success:function(data){
				alert(data);
				$("#f").form('reset');
				$("input[name='eid']").val(0);
				$('#dg').datagrid('load');
				$("#dv").dialog('close');
			}
		});
		
	}
	
	$(function(){
		$("#dg").datagrid({
			toolbar:'#f2'
		});
	})
	
	$(function(){
		$("#dv").dialog({title:'员工管理',
			buttons:[{
				text:'保存',
				handler:function(){
					tj();
				}
			},{
				text:'关闭',
				handler:function(){
					$("#dv").dialog('close');
					$("input[name='eid']").val(0);
					$("#f").form('reset');
				
				}
			}]
			}).dialog('close');
	})
	
	function da(){
		$("#dv").dialog("open");
	}