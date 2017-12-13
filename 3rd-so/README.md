# skynet-in


1.lua-codec  
https://github.com/heyuanlong/lua-codec
基于openssl，实现常用的加密、摘要算法的Lua工具包，如hmac, md5, aes, rsa等


2.
https://github.com/heyuanlong/xxtea-lua
$(LUA_CLIB_PATH)/xxtea.so : lualib-src/xxtea/xxtea.c lualib-src/xxtea/lua_xxtea.c | $(LUA_CLIB_PATH)
	$(CC) $(CFLAGS) $(SHARED) -Ilualib-src/xxtea $^ -o $@
	
3.
https://github.com/heyuanlong/lua-webclient
https请求

4.
protobuf
https://github.com/cloudwu/pbc

