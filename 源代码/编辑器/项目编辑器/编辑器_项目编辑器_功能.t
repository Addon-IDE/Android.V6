类 编辑器_项目编辑器_功能

	@静态
	方法 删除ID冒号前面(ID : 文本) : 文本
		@code
		String input = #ID;
		int colonIndex = input.indexOf(":");
        if (colonIndex != -1) {
            return input.substring(colonIndex + 1);
        }
        return input;
		@end
	结束 方法

	//生成textures/item_texture.json
	@静态
	方法 resource_item_texture(ID : 文本)
		//路径变量
		变量 item_name : 文本 = 其他_其他.读缓存("ProjectName")
		变量 item_texture_path : 文本 = 其他_变量.项目目录 + item_name + "/resource/textures/item_texture.json"
		//json
		变量 item_texture : JSON对象 = [[{}]]
		变量 item_texture_texture_data : JSON对象 = [[{}]]
		//判断文件是否存在
		如果 文件是否存在(item_texture_path) 则
			变量 根对象 : JSON对象 = 读入文本文件(item_texture_path)
			变量 texture_data : JSON对象 = 根对象["texture_data"]
			item_texture_texture_data = texture_data
		否则
			写出附加资源文件("editor/project_editor/item_texture.json",item_texture_path)
			resource_item_texture(ID)
		结束 如果
		//基础
		变量 item_texture_texture_data_textures : JSON对象 = [[{}]]
		item_texture["resource_pack_name"] = "AddonIDE resources"
		item_texture["texture_name"] = "atlas.items"
		//设置图标的路径
		item_texture_texture_data_textures["textures"] = "textures/items/addonide/" + ID.替换(":","_")
		//设置他的名称
		item_texture_texture_data[ID] = item_texture_texture_data_textures
		item_texture["texture_data"] = item_texture_texture_data
		//写出
		写出文本文件(item_texture_path,item_texture.到文本(4))
	结束 方法

	@静态
	方法 resource_attachables(ID : 文本,wield_first_person : 文本,wield_third_person : 文本)
		变量 IDS : 文本 = ID.替换(":","_")
		变量 item_name : 文本 = 其他_其他.读缓存("ProjectName")
		变量 attachables_path : 文本 = 其他_变量.项目目录 + item_name + "/resource/attachables/" + IDS + ".json"
		//json root
		变量 根对象 : JSON对象
		根对象["format_version"] = "1.10.0"
		//description
		变量 minecraft_attachable : JSON对象
		变量 description : JSON对象
		//identifier
		description["identifier"] = ID
		//materials
		变量 materials : JSON对象
		materials["default"] = "entity_alphatest"
		materials["enchanted"] = "entity_alphatest_glint"
		description["materials"] = materials
		//textures
		变量 textures : JSON对象
		textures["default"] = "textures/entity/addonide/" + IDS
		textures["enchanted"] = "textures/misc/enchanted_item_glint"
		description["textures"] = textures
		//geometry
		变量 geometry : JSON对象
		geometry["default"] = "geometry." + IDS
		description["geometry"] = geometry
		//animations
		变量 animations : JSON对象
		animations["wield_first_person"] = wield_first_person
		animations["wield_third_person"] = wield_third_person
		description["animations"] = animations
		//scripts
		变量 scripts : JSON对象
		变量 pre_animation : JSON数组
		pre_animation[0] = 读入附加资源文件("editor/project_editor/attachables_scripts.txt")
		scripts["pre_animation"] = pre_animation
		变量 animate : JSON数组
		变量 animate_1 : JSON对象
		animate_1["wield_first_person"] = "c.is_first_person"
		animate[0] = animate_1
		变量 animate_2 : JSON对象
		animate_2["wield_third_person"] = "!c.is_first_person"
		animate[1] = animate_2
		scripts["animate"] = animate
		description["scripts"] = scripts
		//render_controllers
		变量 render_controllers : JSON数组
		render_controllers[0] = "controller.render.item_default"
		description["render_controllers"] = render_controllers
		minecraft_attachable["description"] = description
		根对象["minecraft:attachable"] = minecraft_attachable
		//写出
		写出文本文件(attachables_path,根对象.到文本(4))
	结束 方法

	//
	@静态
	方法 模型文件内ID编辑(内容 : 文本,ID : 文本) : 文本
		变量 全局内容 : 文本 = 内容
		//root
		变量 根对象 : JSON对象 = 内容
		变量 minecraft_geometry : JSON数组 = 根对象["minecraft:geometry"]
		//minecraft_geometry
		循环(i, 0, minecraft_geometry.长度)
			变量 minecraft_geometry_i : JSON对象 = minecraft_geometry[0]
			//minecraft_geometry_i
			变量 description : JSON对象 = minecraft_geometry_i["description"]
			//description
			变量 identifier : 文本 = description["identifier"]
			//
			变量 identifierss : 文本 = "geometry." + ID.替换(":","_")
			全局内容 = 全局内容.替换(identifier,identifierss)
		结束 循环
		返回 全局内容
	结束 方法
	
	@静态
	方法 动画文件属性编辑(内容 : 文本,wield_first_person : 文本,wield_third_person : 文本) : 文本
		//待操作
		变量 f : 文本 = wield_first_person
		变量 t : 文本 = wield_third_person
		//json
		变量 json : JSON对象 = 内容
		变量 animations : JSON对象 = json["animations"]
		变量 animations_f : 文本 = 数组到集合(animations.键名).取成员(0)
		变量 animations_t : 文本 = 数组到集合(animations.键名).取成员(1)
		//输出
		变量 处理 : 文本 = 内容.替换(animations_f,f)
		变量 结果 : 文本 = 处理.替换(animations_t,t)
		返回 结果
	结束 方法


结束 类