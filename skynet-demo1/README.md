
例子1
./skynet config/testserver1_config  测试使用mysql redis


例子2
./skynet config/testserver2_config  测试使用网关
lua client/client2.lua

例子3
./skynet config/testserver3_config  测试使用sproto
lua client/client3.lua

例子4
./skynet config/testserver4_config  测试使用protobuf
lua client/client4.lua

其中例子3和例子4 的差别很小，只是协议解析构造部分代码改了


例子5
./skynet config/testserver5_config  测试使用sproto rpc
lua client/client5.lua

例子6
./skynet config/testserver6_config  测试使用sproto rpc   大部分代码是从skynet example里扒下来的
lua client/client6.lua

例子7
./skynet config/testserver7_config  测试使用web
curl '127.0.0.1:6600/testweb1?arg1=111&arg2=222'
curl '127.0.0.1:6600/testweb2?data=%7b"msgid":100,"msg":"mmmmmmmmmmm"%7d'

例子8
./skynet config/testserver8_cluster1_config			测试cluster  2和3向1发送心跳，2向3请求信息
./skynet config/testserver8_cluster2_config
./skynet config/testserver8_cluster3_config

例子9
./skynet config/testserver9_config		测试一些代码

例子10
./skynet config/testserver10_config		测试一些代码

例子11
./skynet config/testserver11_config		测试codec.so  xxtea

例子12
./skynet config/testserver12_config		测试httpc（skynet自带的）

例子13
./skynet config/testserver13_config		测试webclient

例子14
./skynet config/testserver14_config		测试使用skynet.queue 模块

例子15
./skynet config/testserver15_s1_config		测试使用master/slave 模块
./skynet config/testserver15_s2_config		
./skynet config/testserver15_s3_config
(以 . 开头的名字是在同一 skynet 节点下有效的，跨节点的 skynet 服务对别的节点下的 . 开头的名字不可见。不同的 skynet 节点可以定义相同的 . 开头的名字。
如果一个 slave 意外退出网络，这个 harbor id 就被废弃，不可再使用。)


