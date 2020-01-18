Check the Virus Pattern and the activation of windows 7.

Batch File：
1. 查看是否存在UI，若不存在，则调起
2. 查看是否存在检查exe，若存在，则跳过，若不存在，则调起


Autoit：
1. Update Program时，调起CheckComputer.exe
	1. 有则Kill掉，没有则调起
2. Check Activation：
	1. 通过exe，调用slmgr /dli
	2. 若正确激活，则通过batch档，显示Pass（画面），否则显示Fail（画面）
	3. 若未激活，则调用Batch档进行激活
3. Check Virus Pattern：
	1. 通过exe，读取本地的病毒库版本，并读取服务器的病毒库版本
	2. 若版本相同，则通过batch档，显示Pass（画面），否则显示Fail（画面）

	3. 若程式未打开（同时未尝试打开过），则打开程式，并记录已经尝试打开过
	3. 若版本异常，同时指向有问题（同时未修改过指向），则修改指向，并记录已经修改过指向
	4. 若版本异常，若指向无错（同时未调起过修改GUID的Tool），则运行修改GUID的Tool，已记录已经调用过修改GUID的Tool
	5. 其余异常，人工处理


备注：
1. CheckComputer.exe，每两次Update Program时调起一次
2. MIS激活方式：有域，有KMS Server，电脑会自动激活，无监控
3. MIS扫毒方式：image没有问题，能确保大多数电脑安装正确，即使有异常，在加域时，人工确认其安装的正确性，无监控（服务端只要确保下端75%以上版本正常更新即可）
4. P5TE通过程式显示异常部分，并通过程式自动解决，若无法解决则显示异常，以便提示人为解决


version update：
解除一些异常对话框问题问题，新Tool可以点掉异常对话框
隐藏托盘图标