import os
import sys
import json
import subprocess
import requests
import time
import hmac
import hashlib
import base64
import urllib.parse
from datetime import datetime, timedelta

dataMap = {
    "Block Storage": "存储使用量",
    "Compute": "计算使用时长",
    "Telemetry": "遥测使用量",
    "Virtual Cloud Network": "流量使用量"
}


def run_command(command):
    proc = subprocess.Popen(command, shell=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    bresult = proc.stdout.read()
    result = bresult.decode('gb2312')
    return result


def getsign(secret, timestamp):
    # timestamp = str(round(time.time() * 1000))
    secret_enc = secret.encode('utf-8')
    string_to_sign = '{}\n{}'.format(timestamp, secret)
    string_to_sign_enc = string_to_sign.encode('utf-8')
    hmac_code = hmac.new(secret_enc, string_to_sign_enc,
                         digestmod=hashlib.sha256).digest()
    sign = urllib.parse.quote_plus(base64.b64encode(hmac_code))
    return sign


def seng_msg(content):
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


if __name__ == '__main__':
    try:
        tenanid = os.getenv('TENANID')
        dtb = datetime.now().strftime('%Y-%m-01')
        dte = (datetime.now()+timedelta(days=1)).strftime('%Y-%m-%d')
        str_command = f'oci usage-api usage-summary request-summarized-usages --granularity MONTHLY --query-type USAGE --compartment-depth 6 --group-by \'["service"]\' --time-usage-started {dtb} --time-usage-ended {dte} --tenant-id {tenanid}'
        out = run_command(str_command)
        cost = json.loads(out)
        costItems = {}
        for item in cost['data']['items']:
            service = item['service']
            quantity = item['computed-quantity']
            unit = item['unit']
            costItems[service] = {'quantity': quantity, 'unit': unit}

        cost_analysis = [f'{dtb[5:]}至{dte[5:]} 资源使用统计：']
        for k, v in dataMap.items():
            service = costItems[k]
            quantity = service['quantity']
            unit = service['unit']
            cost_analysis.append(
                f'{v}：{format(quantity,".2f")} ({unit})')
        cost_analysis.append('来自：hausthy/oracle-oci:latest')
        content = '\r\n'.join(cost_analysis)
        seng_msg(content)
    except Exception as ex:
        print(f'出错了:{ex}')
        sys.exit(1)
