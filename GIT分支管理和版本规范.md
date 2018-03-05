# GIT分支管理和版本规范

### 1. 版本号管理

版本的命名规则，version N1.N2.N3， 例如 1.3.5，2.2.15, 
1）. N1是系统编号。当服务本身重大变动如重新设计，框架变动，等等时，N1加1，基数为0 （0表示开发阶段）
2）. N2是功能编号。当项目增加某一功能，或某一功能需要修改时，N2加1，基数为0 
3）. N3是BUG编号。当项目的BUG被修复时，N3加1，基数为0 



### 2. 开发周期中的git分支创建和合并流程，举例说明

1） MASTER总是和线上部署的代码保持一致，当前版本为1.3.5

2） 一个开发迭代开始，出现了3个特性任务，A，B，C。这时从Master分支新建3个feature分支，命名为feature/A，feature/B，feature/C

3） 迭代开发阶段结束后，A和B特性开发任务完成，并准备测试和上线，特性C将推迟测试和上线

4） 从Master分支新建分支release/1.4.0， 将feature/A和feautre/B分支的代码合并到分支release/1.4.0，删除feature/A和feautre/B分支，pom中版本号修改为1.4.0

5） 分支release/1.4.0进行测试，出现了bug1和bug2，那么从分支release/1.4.0新建分支bugfix/bug1和bugfix/bug2

6） bug1修复后分支bugfix/bug1合并到release/1.4.0，删除分支bugfix/bug1；此时出现了bug3，那么从分支release/1.4.0新建分支bugfix/bug3

7） 转到5）直到bug修复可以达到上线标准

8） release/1.4.0分支作为发布版本进行发布

9） 上线后，release/1.4.0分支合并到MASTER；删除release/1.4.0分支；MASTER分支合并到所有的其他feature分支（feature/C）和bug分支（bugfix/bugN）

10） 进入开发下一个迭代，修复剩余bug和继续开发特性C

11） 线上发生紧急bugX，那么从MASTER新建分支hotfix/bugX，并修复

12） 从Master分支新建分支release/1.4.1，将分支hotfix/bugX合并到release/1.4.1，测试并上线

13） 上线后，release/1.4.1分支合并到MASTER；删除release/1.4.1分支；MASTER分支合并到所有的其他feature分支（feature/C）和bug分支（bugfix/bugN）

14） 转到3） 或者 转到11）



### 3. api服务和服务sdk的版本不需要保持一致



### 4. 在api服务的pom中的build中设置finalname标签，指定jar包名称，不带版本号（推荐使用artifactId）



### 5. git合并分支时解决冲突的步骤

1）IDE中，更新需要合并的两个分支，一般来说是自己开发的分支（分支A），另一个是目标分支（分支B）

2）切换到分支A，在分支A上合并分支B，并解决冲突

3）在GIT提交一个合并分支请求

4）有权限在GIT上审批合并分支请求的人进行真正合并分支