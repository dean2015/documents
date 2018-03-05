# Swagger 注解使用说明

将通过对两段样例代码的阅读，来解释swagger注解的使用。

### 样例代码1

```java
@RestController
@Slf4j
@RequestMapping(value = "/sample")
@Api(value = "/sample", tags = {"swagger测试接口"}, description = "swagger注解的例子")
public class SampleController {

    @ApiOperation(value = "无返回值测试", notes = "返回值对象为AjaxResult<Void>，即不返回业务对象")
    @RequestMapping(value = "/test-reture-void", method = RequestMethod.GET)
    public AjaxResult<Void> testReturnVoid() {
        return AjaxResult.newInstance(Void.class).success("OK");
    }

    @ApiOperation(value = "返回长整型测试", notes = "返回值对象为AjaxResult<Void>，即不返回业务对象")
    @RequestMapping(value = "/test-long", method = RequestMethod.GET)
    public AjaxResult<Long> testReturnPrimitiveTypeLong() {
        return AjaxResult.newInstance(Long.class).success("OK", 1L);
    }

    @ApiOperation(value = "返回对象测试", notes = "返回值对象为AjaxResult<Object>，即不返回业务对象")
    @RequestMapping(value = "/test-object", method = RequestMethod.GET)
    public AjaxResult<TestModel> testReturnObject() {
        TestModel testModel = new TestModel();
        testModel.setNumber(1L);
        testModel.setText("testModel");
        SubTestModel subTestModel = new SubTestModel();
        subTestModel.setNumber(2L);
        subTestModel.setText("subTestModel");
        List<SubTestModel> subTestModelList = new ArrayList<SubTestModel>();
        subTestModelList.add(subTestModel);
        testModel.setSubTestModel(subTestModel);
        testModel.setSubTestModelList(subTestModelList);
        return AjaxResult.newInstance(TestModel.class).success("OK", testModel);
    }

    @ApiOperation(value = "带有DTO参数测试", notes = "POST方法，输入参数为DTO,并含有路径参数")
    @RequestMapping(value = "/test-with-dto/{path-param}", method = RequestMethod.POST)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "path-param", value = "POST时候可以使用路径传递其他单个参数", required = true, paramType = "path")
    })
    public AjaxResult<Void> testWithDto(@ApiParam(value = "主要参数TestDTO", required = true) @RequestBody TestDTO testDTO, @PathVariable(value = "path-param") String myParam) {
        return AjaxResult.newInstance(Void.class).success("OK --- " + myParam);
    }

    @ApiOperation(value = "请求参数测试", notes = "GET方法，可以通过请求传递参数,并含有路径参数")
    @RequestMapping(value = "/test-with-param/{path-param}", method = RequestMethod.GET)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "param", value = "参数传递", required = true, paramType = "query"),
            @ApiImplicitParam(name = "path-param", value = "路径参数传递", required = true, paramType = "path")
    })
    public AjaxResult<Void> testWithParam(@RequestParam("param") String param, @PathVariable(value = "path-param") String myParam) {
        return AjaxResult.newInstance(Void.class).success("OK --- " + param + " === " + myParam);
    }
}
```



上面代码段中，swagger相关注解如下：

1. ```java
   @Api(value = "/sample", tags = {"swagger测试接口"}, description = "swagger注解的例子")
   ```

   @Api注解使用在接口类上，标识一类接口集合。

   参数：value在swagger-ui上没有显示，tags将把方法级别的接口归类，description会显示在tags列表的后面补充说明接口集合的作用

2. ```java
   @ApiOperation(value = "无返回值测试", notes = "返回值对象为AjaxResult<Void>，即不返回业务对象")
   ```

   @ApiOperation注解使用在一个方法上，标识一个具体接口

   参数：value会显示在收起的title栏目中，notes是显示具体的接口作用描述

3. ```java
   @ApiImplicitParams({
    @ApiImplicitParam(name = "param", value = "参数传递", required = true, paramType = "query"),
    @ApiImplicitParam(name = "path-param", value = "路径参数传递", required = true, paramType = "path")
   })
   ```

   @ApiImplicitParams注解是一个集合类注解，位置在方法上，具体的注解项在注解@ApiImplicitParam中填写。

   @ApiImplicitParam标识了一个具体参数

   参数：name需要准确对应到请求参数的名称，value为请求参数的描述，required描述该参数是否为必填，paramType代表参数的传递方式（query: 请求参数，body：请求体参数，path：路径参数，header：请求头参数 和 form：表单参数）

4. ```
   @ApiParam(value = "主要参数TestDTO", required = true)
   ```

   @ApiParam和@ApiImplicitParam的作用一样，都是标识了一个参数，但是它的位置在参数表中。

   因为@ApiParam在参数列表中，所以不需要name属性来对应是哪个参数。@ApiParam可以解决@RequestBody无法使用@ApiImplicitParam的问题。



### 样例代码2

```java
@ApiModel
@Data
public class TestModel {

    @ApiModelProperty(value = "TestModel 的文本字段",
            required = true,
            example = "Hello TestModel"
    )
    private String text;

    @ApiModelProperty(value = "TestModel 的数字字段",
            required = true,
            example = "123456789"
    )
    private Long number;

    @ApiModelProperty(value = "TestModel的SubTestModel字段",
            required = true
    )
    private SubTestModel subTestModel;

    @ApiModelProperty(value = "TestModel的List<SubTestModel>字段",
            required = true
    )
    private List<SubTestModel> subTestModelList;

}
```



上面代码段中，swagger相关注解如下：

1. ```java
   @ApiModel
   ```

   @ApiModel标识一个模型类

2. ```java
   @ApiModelProperty(value = "TestModel 的文本字段",
               required = true,
               example = "Hello TestModel"
       )
   ```

   @ApiModelProperty标识模型类中的一个属性

   参数：value为属性的描述，required为属性是否必须存在值，example为该属性值的一个例子

   注意：在使用的时候，如果属性值不是java的基本类型或者基本类型对应的java包装类，example请不要设置任何值，默认会使用该属性自身的@ApiModelProperty提供例子。