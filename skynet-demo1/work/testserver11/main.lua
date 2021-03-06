local skynet = require "skynet"
local config = require "config.testServer1Config"
local redisdb = require "common.db.redis.redisdb"
local mysqldb = require "common.db.mysql.mysqldb"
local logger = require "common.log.skynetlog"

local httpc = require "http.httpc"
local crypt = require "crypt"
local codec = require "codec"
local xxtea = require "xxtea"
local md5 = require "md5"

function codec_test( )
    local src = '123456'
    local privpem = [[-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCsxjKD2lnmkmELoo5QphM/VdREJKym26R0T+19JDa3MVZFDbwg
UGT8XM8bElrKgxexhTVRt07btyIejdbiPx7sCbWcVP8peZI+QZEVVzaE2Ci5n0lP
9v9GUSl0QfZU94uIwl++BVq0VFvbHax/R/q4oTRD1u73ASM27QW42+cJFwIDAQAB
AoGALHoNMQI52HBgSSV8q2hFVi2bKjuisoWibUrSIT/8UeaChd5GSq9Hf+vIaPit
pKpgpBNdqX6d71PSlbj/01hadg5IxrGWQZWzT/3IzuhTxAu4TkztUJelGRcM6ykZ
5AxijiIxTLWSY/ygtEaM2QShhl8dCReNT+oIDGf/iMSTVykCQQDl07WZR9ATReVc
vM7/v9iiz/g1Tj9/8AOuyYOZ5kp5a8IAr48dXixzuTZY66RwPj/J5vrzLuHc7Uc0
RAi4hgmTAkEAwHMxP0KVOzDH49SsiUjfOycqrBl68QCXUWQj2mi7Bb1pLryoYDFv
FTuk6pxKyfr5O8M2s8thTz6f3EO7hFqk7QJAdX8Ly2ZkYUYNoaDBbwzEk1AhhBcR
7bVmHJjXV/ndP0Aw+arHTutTbIJW35TxB5U7hVw6FdN1Ez6XdYgGsVeNUwJAEjlW
SoVFmGtQInT7Oaza5sEYu19WUwgZTC3Nb1tHio2bLj/TOfi0ajBRt53BP0sy2sPr
pC74MgbeIH+RfEERKQJBAIpPkQztkbpZwD9gDiK86U+HHYZrhglxgfDIXYwTH3z/
KCrfyNxiH2im9ZhwuhLs7LDD7wDPHUC5BItx2tYN10s=
-----END RSA PRIVATE KEY-----]]
    local bs = codec.rsa_private_sign(src, privpem)
    local sign = codec.base64_encode(bs)
    print(sign)

    local dbs = codec.base64_decode(sign)
    local pubpem = [[-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsxjKD2lnmkmELoo5QphM/VdRE
JKym26R0T+19JDa3MVZFDbwgUGT8XM8bElrKgxexhTVRt07btyIejdbiPx7sCbWc
VP8peZI+QZEVVzaE2Ci5n0lP9v9GUSl0QfZU94uIwl++BVq0VFvbHax/R/q4oTRD
1u73ASM27QW42+cJFwIDAQAB
-----END PUBLIC KEY-----]]
    local ok = codec.rsa_public_verify(src, dbs, pubpem, 2)
    print(ok)
end



function xxtea_test( )
    local text = "0&&1023unxyy";
    local key = "Hkg5Ft#3S19Nku0a";
    local encrypt_data = xxtea.encrypt(text, key);


    local decrypt_data = xxtea.decrypt(encrypt_data, key);
    if text == decrypt_data then
        print("success!\n");
        print(encrypt_data.."\n"..string.len(encrypt_data));

        local str = encrypt_data
        local str_len  = #str
        print("str_len:"..str_len)
        for i=1,str_len do
            print(i..":"..string.byte(str,i))
        end

        local md5_str = md5.sumhexa(encrypt_data)
        local base64_str = crypt.base64encode(encrypt_data)
        print(md5_str.."\n");
        print(base64_str.."\n");
        print(xxtea.decrypt(crypt.base64decode(base64_str),key).."\n");
    else
        print("fail!\n");
    end
end


skynet.start(function()

    print("Server Start")
    codec_test()
    xxtea_test()

    skynet.exit()
end)
