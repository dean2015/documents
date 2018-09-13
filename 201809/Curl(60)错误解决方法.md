# curl （60） 错误解决方案

### 1. 导入根证书 TrustedRoot.crt

根证书名称一般为 TrustedRoot.crt

将证书写入到 /etc/pki/tls/certs/ca-bundle.trust.crt 文件的尾部

> cat /tmp/TrustedRoot.crt >> /etc/pki/tls/certs/ca-bundle.trust.crt



### 2. 导入证书 DigiCertCA.crt

将证书写入到 /etc/pki/tls/certs/ca-bundle.crt 文件的尾部

> cat /tmp/DigiCertCA.crt >> /etc/pki/tls/certs/ca-bundle.crt



### 3. 导入*.pem证书

将证书写入到 /etc/pki/tls/certs/ca-bundle.crt 文件的尾部

> cat /tmp/smsf.accenture.com.pem >> /etc/pki/tls/certs/ca-bundle.crt



### 4. 证书请向证书服务提供方申请

