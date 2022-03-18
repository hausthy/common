import os
import sys
import calendar
import datetime
import oci.usage_api.models
from oci.usage_api.models import RequestSummarizedUsagesDetails
from datetime import datetime
import ddNotify

dataMap = {
    "Block Storage": "存储使用量",
    "Compute": "计算使用时长",
    "Telemetry": "遥测使用量",
    "Virtual Cloud Network": "流量使用量"
}

# Default config file and profile
configfile = os.getenv('CONFIGFILE')
config = oci.config.from_file(file_location=configfile,
                              profile_name='Default')
usage_api_client = oci.usage_api.UsageapiClient(config)

tenant_id = config['tenancy']

if __name__ == '__main__':
    try:
        # query cost with group by service
        now = datetime.now().date()
        this_month_start = datetime(now.year, now.month, 1)
        dayTotal = calendar.monthrange(now.year, now.month)[1]
        # this_month_end = datetime(now.year, now.month, dayTotal)
        this_month_end = datetime(now.year, now.month, now.day+1)
        dtb = this_month_start.strftime('%Y-%m-%d')
        dte = this_month_end.strftime('%Y-%m-%d')
        usage_request = RequestSummarizedUsagesDetails(tenant_id=tenant_id,
                                                       time_usage_started=this_month_start,
                                                       time_usage_ended=this_month_end,
                                                       granularity='MONTHLY',
                                                       query_type='USAGE',
                                                       group_by=['service'])

        usage_response = usage_api_client.request_summarized_usages(
            usage_request)
        cost = usage_response.__dict__['data']
        costItems = {}
        for item in cost.items:
            service = item.service
            quantity = item.computed_quantity
            unit = item.unit
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
        ddNotify.send_msg(content)
    except Exception as ex:
        print(f'出错了:{ex}')
        sys.exit(1)
