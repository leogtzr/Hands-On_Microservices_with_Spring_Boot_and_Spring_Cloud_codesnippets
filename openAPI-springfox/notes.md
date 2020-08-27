## How to call the product-service

### Build
gradle build

### Run
java -jar microservices/product-service/build/libs/*.jar

### Call the WS
http :7001/product/123

```
0 [16:49]leo@lein ~ $ curl http://localhost:7000/product-composite/1
{"productId":1,"name":"name-1","weight":123,"recommendations":[],"reviews":[],"serviceAddresses":{"cmp":"lein/127.0.1.1:7000","pro":"lein/127.0.1.1:7001","rev":"","rec":""}}0 [16:49]leo@lein ~ $ http :7000/product-composite/1
HTTP/1.1 200 OK
Content-Length: 173
Content-Type: application/json

{
    "name": "name-1",
    "productId": 1,
    "recommendations": [],
    "reviews": [],
    "serviceAddresses": {
        "cmp": "lein/127.0.1.1:7000",
        "pro": "lein/127.0.1.1:7001",
        "rec": "",
        "rev": ""
    },
    "weight": 123
}

0 [16:50]leo@lein ~ $ 
```
