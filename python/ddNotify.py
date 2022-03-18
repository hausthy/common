import os
import json
import requests
import time
import hmac
import hashlib
import base64
import urllib.parse

def getsign(secret, timestamp):
    # timestamp = str(round(time.time() * 1000))
    secret_enc = secret.encode('utf-8')
    string_to_sign = '{}\n{}'.format(timestamp, secret)
    string_to_sign_enc = string_to_sign.encode('utf-8')
    hmac_code = hmac.new(secret_enc, string_to_sign_enc,
                         digestmod=hashlib.sha256).digest()
    sign = urllib.parse.quote_plus(base64.b64encode(hmac_code))
    return sign

def send_msg(content):
    # 时间戳
    timestamp = str(round(time.time() * 1000))
    # 钉钉机器人配置
    secret = os.getenv('DD_SECRET')
    access_token = os.getenv('DD_TOKEN')
    if(secret == '' or secret is None or access_token == '' or access_token is None):
        return
    sign_str = getsign(secret, timestamp)
    headers = {'Content-Type': 'application/json'}  # 定义数据类型
    webhook = f'https://oapi.dingtalk.com/robot/send?access_token={access_token}&timestamp={timestamp}&sign={sign_str}'
    data = {
        "msgtype": "text",
        "text": {"content": content},
        "isAtAll": False}
    res = requests.post(webhook, data=json.dumps(data),
                        headers=headers)  # 发送post请求

