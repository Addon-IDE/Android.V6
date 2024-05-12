类 编辑器_函数编辑器_补全

	//声明
	变量 代码补全视图 : CodeAutoPanelView?

	//设置代码补全视图
	方法 设置代码补全视图(补全名称 : CodeAutoPanelView)
		//赋值
		代码补全视图 = 补全名称
		//加载方法
		初始化()
	结束 方法

	//
	方法 初始化()
		事件 代码补全视图:被插入删除()
			//变量
			变量 获取内容 : 文本 = 代码补全视图.获取当前行()
			变量 全局 : 文本 = "execute "
			//补全清空
			代码补全视图.清空补全()
			//ID Block
			变量 Block : 文本 = 全局 + "fill setblock give"
			变量 BlockList : 文本[] = Block.分割文本(" ")
			循环(i, 0, 取数组长度(BlockList))
				如果 获取内容 ? BlockList[i] 则
					MCBEID转补全("data/mcbeid/block.txt")
				结束 如果
			结束 循环
			//ID Item
			变量 Item : 文本 = 全局 + "give clear replaceitem"
			变量 ItemList : 文本[] = Item.分割文本(" ")
			循环(i, 0, 取数组长度(ItemList))
				如果 获取内容 ? ItemList[i] 则
					MCBEID转补全("data/mcbeid/item.txt")
				结束 如果
			结束 循环
			//ID Entity
			变量 Entity : 文本 = 全局 + "summon teleport tp kill replaceitem"
			变量 EntityList : 文本[] = Entity.分割文本(" ")
			循环(i, 0, 取数组长度(EntityList))
				如果 获取内容 ? EntityList[i] 则
					MCBEID转补全("data/mcbeid/entity.txt")
				结束 如果
			结束 循环
			//ID Gamerule
			变量 Gamerule : 文本 = 全局 + "gamerule"
			变量 GameruleList : 文本[] = Gamerule.分割文本(" ")
			循环(i, 0, 取数组长度(GameruleList))
				如果 获取内容 ? GameruleList[i] 则
					MCBEID转补全("data/mcbeid/gamerule.txt")
				结束 如果
			结束 循环
			//ID Effect
			变量 Effect : 文本 = 全局 + "effect"
			变量 EffectList : 文本[] = Effect.分割文本(" ")
			循环(i, 0, 取数组长度(EffectList))
				如果 获取内容 ? EffectList[i] 则
					MCBEID转补全("data/mcbeid/effect.txt")
				结束 如果
			结束 循环
			//ID Sound
			变量 Sound : 文本 = 全局 + "playsound music"
			变量 SoundList : 文本[] = Sound.分割文本(" ")
			循环(i, 0, 取数组长度(SoundList))
				如果 获取内容 ? SoundList[i] 则
					MCBEID转补全("data/mcbeid/sound.txt")
				结束 如果
			结束 循环
			//ID Locate
			变量 Locate : 文本 = 全局 + "locate"
			变量 LocateList : 文本[] = Locate.分割文本(" ")
			循环(i, 0, 取数组长度(LocateList))
				如果 获取内容 ? LocateList[i] 则
					MCBEID转补全("data/mcbeid/location.txt")
				结束 如果
			结束 循环
			//ID EntitySlot
			变量 EntitySlot : 文本 = 全局 + "replaceitem"
			变量 EntitySlotList : 文本[] = EntitySlot.分割文本(" ")
			循环(i, 0, 取数组长度(EntitySlotList))
				如果 获取内容 ? EntitySlotList[i] 则
					MCBEID转补全("data/mcbeid/entitySlot.txt")
				结束 如果
			结束 循环
			//ID Fog
			变量 Fog : 文本 = 全局 + "fog"
			变量 FogList : 文本[] = Fog.分割文本(" ")
			循环(i, 0, 取数组长度(FogList))
				如果 获取内容 ? FogList[i] 则
					MCBEID转补全("data/mcbeid/fog.txt")
				结束 如果
			结束 循环
			//ID CameraPreset
			变量 CameraPreset : 文本 = 全局 + "camera"
			变量 CameraPresetList : 文本[] = CameraPreset.分割文本(" ")
			循环(i, 0, 取数组长度(CameraPresetList))
				如果 获取内容 ? CameraPresetList[i] 则
					MCBEID转补全("data/mcbeid/cameraPreset.txt")
				结束 如果
			结束 循环
			//ID LootTable
			变量 LootTable : 文本 = 全局 + "loot"
			变量 LootTableList : 文本[] = LootTable.分割文本(" ")
			循环(i, 0, 取数组长度(LootTableList))
				如果 获取内容 ? LootTableList[i] 则
					MCBEID转补全("data/mcbeid/lootTable.txt")
				结束 如果
			结束 循环
			//ID DamageCause
			变量 DamageCause : 文本 = 全局 + "damage"
			变量 DamageCauseList : 文本[] = DamageCause.分割文本(" ")
			循环(i, 0, 取数组长度(DamageCauseList))
				如果 获取内容 ? DamageCauseList[i] 则
					MCBEID转补全("data/mcbeid/damageCause.txt")
				结束 如果
			结束 循环
			//ID Biome
			变量 Biome : 文本 = 全局 + "biome"
			变量 BiomeList : 文本[] = Biome.分割文本(" ")
			循环(i, 0, 取数组长度(BiomeList))
				如果 获取内容 ? BiomeList[i] 则
					MCBEID转补全("data/mcbeid/biome.txt")
				结束 如果
			结束 循环
			//ID Enchant
			变量 Enchant : 文本 = 全局 + "enchant"
			变量 EnchantList : 文本[] = Enchant.分割文本(" ")
			循环(i, 0, 取数组长度(EnchantList))
				如果 获取内容 ? EnchantList[i] 则
					MCBEID转补全("data/mcbeid/enchant.txt")
				结束 如果
			结束 循环
			//ID Animation
			变量 Animation : 文本 = 全局 + "playanimation"
			变量 AnimationList : 文本[] = Animation.分割文本(" ")
			循环(i, 0, 取数组长度(AnimationList))
				如果 获取内容 ? AnimationList[i] 则
					MCBEID转补全("data/mcbeid/animation.txt")
				结束 如果
			结束 循环
			//ID ParticleEmitter
			变量 ParticleEmitter : 文本 = 全局 + "particle"
			变量 ParticleEmitterList : 文本[] = ParticleEmitter.分割文本(" ")
			循环(i, 0, 取数组长度(ParticleEmitterList))
				如果 获取内容 ? ParticleEmitterList[i] 则
					MCBEID转补全("data/mcbeid/particleEmitter.txt")
				结束 如果
			结束 循环
			//ID @
			变量 Selector : 文本 = "@p[ @r[ @a[ @e[ @s[ @c[ @v[ @initiator["
			变量 SelectorList : 文本[] = Selector.分割文本(" ")
			循环(i, 0, 取数组长度(SelectorList))
				如果 获取内容 ? SelectorList[i] 则
					选择器转补全("data/function_editor_selector2.txt")
				结束 如果
			结束 循环
			//加载默认补全
			命令转补全("data/function_editor_command.txt")
			选择器转补全("data/function_editor_selector.txt")
		结束 事件
	结束 方法

	方法 命令转补全(path:文本)
		//变量
		变量 con : 文本 = 读入附加资源文件(path)
		变量 cons : 文本 = con.截取文本("【","】")
		变量 conss : 文本 = "【" + cons + "】"
		变量 consss : 文本 = con.替换(conss,"")
		变量 list : 文本[] = consss.分割文本("\n")
		//开始循环递增
		循环(i, 0, 取数组长度(list))
			如果 list[i].替换(" ","") == "" 则
			否则
				如果 list[i] ? "※" 则
				否则
					变量 lista : 文本[] = list[i].分割文本("=")
					代码补全视图.添加补全("icon/function_complete/command.png",lista[0],lista[0],"Command",lista[1].替换(lista[1].截取文本("【","】"),"").替换("【","").替换("】",""),lista[1].截取文本("【","】"))
				结束 如果
			结束 如果
		结束 循环
	结束 方法
	
	方法 MCBEID转补全(path:文本)
		//变量
		变量 con : 文本 = 读入附加资源文件(path)
		变量 cons : 文本 = con.截取文本("【","】")
		变量 conss : 文本 = "【" + cons + "】"
		变量 consss : 文本 = con.替换(conss,"")
		变量 list : 文本[] = consss.分割文本("\n")
		//开始循环递增
		循环(i, 0, 取数组长度(list))
			如果 list[i].替换(" ","") == "" 则
			否则
				如果 list[i] ? "※" 则
				否则
					变量 lista : 文本[] = list[i].分割文本("=")
					代码补全视图.添加补全("icon/function_complete/id.png",lista[0],lista[0],"Identifier",lista[1])
				结束 如果
			结束 如果
		结束 循环
	结束 方法
	
	方法 选择器转补全(path:文本)
		//变量
		变量 con : 文本 = 读入附加资源文件(path)
		变量 cons : 文本 = con.截取文本("【","】")
		变量 conss : 文本 = "【" + cons + "】"
		变量 consss : 文本 = con.替换(conss,"")
		变量 list : 文本[] = consss.分割文本("\n")
		//开始循环递增
		循环(i, 0, 取数组长度(list))
			如果 list[i].替换(" ","") == "" 则
			否则
				如果 list[i] ? "※" 则
				否则
					变量 lista : 文本[] = list[i].分割文本("=")
					如果 path ? "function_editor_selector.txt" 则
						代码补全视图.添加补全("icon/function_complete/selector.png",lista[0],lista[0],"Selector",lista[1])
						否则
							代码补全视图.添加补全("icon/function_complete/selector2.png",lista[0],lista[0],"Selector",lista[1])
					结束 如果
				结束 如果
			结束 如果
		结束 循环
	结束 方法

结束 类