/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : vblog

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 04/05/2019 22:39:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `cover` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `content_md` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容-Markdown',
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `origin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `state` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `views` bigint(20) NULL DEFAULT 0,
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `edit_time` datetime(0) NOT NULL COMMENT '上次修改时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `type` int(11) NULL DEFAULT 0 COMMENT '类型， 0原创 1转载',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES (8, '如何从0开始搭建并发布一个自己的网站', '/site/images/thumbs/1.jpg', 'feizifeiyu', '<h1 id=\"h1--\"><a name=\"网站三要素，项目、域名、空间\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>网站三要素，项目、域名、空间</h1><p>那我们怎么可以快速的准备好这些呢？</p>\n<p>一项目：我觉得一个不错的<strong>博客项目VBlog</strong>，地址：<a href=\"https://github.com/feizifeiyu/vblog\">https://github.com/feizifeiyu/vblog</a> （喜欢可以<strong>star</strong>哦！） </p>\n<p>二域名：Freenom可以让你拥有自己顶级域名（<strong>免费</strong>的哦），地址：：<a href=\"https://my.freenom.com\">https://my.freenom.com</a></p>\n<p>三空间：阿里云新用户可以免费领取一个月的空间，地址：<a href=\"https://www.aliyun.com/\">https://www.aliyun.com/</a></p>\n<h1 id=\"h1-u51C6u5907u7A7Au95F4u7684u57FAu7840u73AFu5883\"><a name=\"准备空间的基础环境\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>准备空间的基础环境</h1><p>有了云服务器，不搭建好必要的环境可以不能运行自己的项目，比如，<a href=\"https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html\" title=\"jdk\"><strong>jdk</strong></a>, <a href=\"http://nginx.org/en/download.html\" title=\"nginx\"><strong>nginx</strong></a>等等</p>\n<p>还有，</p>\n<p>为了把我们的项目上传到云服务器，可能我们还需要<a href=\"https://www.filezilla.cn/download/client\" title=\"FileZilla\"><strong>FileZilla</strong></a>这样的软件，方便上传文件</p>\n<p>为了管理我们的云服务器，我们也需要XShell，可以输入你的linux命令</p>\n<p>……</p>\n<p>好了，现在就正式开始准备基础环境吧…</p>\n<h2 id=\"h2--jdk\"><a name=\"安装jdk\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>安装jdk</h2><p>解压jdk<br><code>$ tar  -zxvf  jdk-8u131-linux-x64.tar.gz</code><br>配置环境<br><code>vim /etc/profile</code><br><code>export JAVA_HOME=/home/env/jdk1.8.0_202</code><br><code>export CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar</code><br><code>export PATH=$PATH:${JAVA_HOME}/bin</code></p>\n<h2 id=\"h2--shell-\"><a name=\"编写项目启动、停止的Shell脚本\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>编写项目启动、停止的Shell脚本</h2><p>启动脚本：start.sh</p>\n<pre><code>#!/bin/sh\nnohup java -jar vblog.jar &gt;&gt; ./log/vblog.log 2&gt;&amp;1 &amp;\necho $!&gt;./vblog.pid # 将jar包启动对应的pid写入文件中，为停止时提供pid\n</code></pre><p>停止脚本：stop.sh</p>\n<pre><code>#!/bin/sh\nPID=$(cat ./vblog.pid)\nkill -9 $PID\n</code></pre><p>脚本执行命令：<br><code>. start.sh</code><br>或者<br><code>./stop.sh</code><br>PS：要执行Shell脚本，要记得先赋予执行的权限哦<br><code>chmod u+x start.sh</code></p>\n<p>未完待续…</p>\n', '#网站三要素，项目、域名、空间\n那我们怎么可以快速的准备好这些呢？\n\n一项目：我觉得一个不错的**博客项目VBlog**，地址：https://github.com/feizifeiyu/vblog （喜欢可以**star**哦！） \n\n二域名：Freenom可以让你拥有自己顶级域名（**免费**的哦），地址：：https://my.freenom.com\n\n三空间：阿里云新用户可以免费领取一个月的空间，地址：https://www.aliyun.com/\n\n#准备空间的基础环境\n有了云服务器，不搭建好必要的环境可以不能运行自己的项目，比如，[**jdk**](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html \"jdk\"), [**nginx**](http://nginx.org/en/download.html \"nginx\")等等\n\n还有，\n\n为了把我们的项目上传到云服务器，可能我们还需要[**FileZilla**](https://www.filezilla.cn/download/client \"FileZilla\")这样的软件，方便上传文件\n\n为了管理我们的云服务器，我们也需要XShell，可以输入你的linux命令\n\n......\n\n好了，现在就正式开始准备基础环境吧...\n\n## 安装jdk\n解压jdk\n`$ tar  -zxvf  jdk-8u131-linux-x64.tar.gz`\n配置环境\n`vim /etc/profile`\n`export JAVA_HOME=/home/env/jdk1.8.0_202`\n`export CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar`\n`export PATH=$PATH:${JAVA_HOME}/bin`\n\n## 编写项目启动、停止的Shell脚本\n启动脚本：start.sh\n    #!/bin/sh\n    nohup java -jar vblog.jar >> ./log/vblog.log 2>&1 &\n    echo $!>./vblog.pid # 将jar包启动对应的pid写入文件中，为停止时提供pid\n停止脚本：stop.sh\n    #!/bin/sh\n    PID=$(cat ./vblog.pid)\n    kill -9 $PID\n脚本执行命令：\n`. start.sh`\n或者\n`./stop.sh`\nPS：要执行Shell脚本，要记得先赋予执行的权限哦\n`chmod u+x start.sh`\n\n未完待续...\n\n\n\n\n', '随笔', 'https://www.feizifeiyu.tk', '1', NULL, NULL, '2019-05-03 14:32:40', '2019-05-03 14:32:40', 0);

-- ----------------------------
-- Table structure for tb_article_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_category`;
CREATE TABLE `tb_article_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章&&分类关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_article_category
-- ----------------------------
INSERT INTO `tb_article_category` VALUES (1, 1, 4);
INSERT INTO `tb_article_category` VALUES (2, 2, 2);
INSERT INTO `tb_article_category` VALUES (3, 4, 3);
INSERT INTO `tb_article_category` VALUES (4, 5, 1);
INSERT INTO `tb_article_category` VALUES (5, 6, 1);
INSERT INTO `tb_article_category` VALUES (6, 8, 2);

-- ----------------------------
-- Table structure for tb_article_tags
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_tags`;
CREATE TABLE `tb_article_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `tag_id` bigint(20) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章&&标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_article_tags
-- ----------------------------
INSERT INTO `tb_article_tags` VALUES (1, 1, 1);
INSERT INTO `tb_article_tags` VALUES (2, 1, 1);
INSERT INTO `tb_article_tags` VALUES (3, 1, 1);
INSERT INTO `tb_article_tags` VALUES (5, 1, 4);
INSERT INTO `tb_article_tags` VALUES (6, 2, 4);
INSERT INTO `tb_article_tags` VALUES (7, 4, 5);
INSERT INTO `tb_article_tags` VALUES (8, 4, 4);
INSERT INTO `tb_article_tags` VALUES (9, 5, 4);
INSERT INTO `tb_article_tags` VALUES (10, 6, 1);
INSERT INTO `tb_article_tags` VALUES (11, 7, 5);
INSERT INTO `tb_article_tags` VALUES (15, 11, 5);
INSERT INTO `tb_article_tags` VALUES (16, 11, 4);
INSERT INTO `tb_article_tags` VALUES (17, 8, 6);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (1, '测试');
INSERT INTO `tb_category` VALUES (2, '随笔');
INSERT INTO `tb_category` VALUES (3, '心情');
INSERT INTO `tb_category` VALUES (4, 'springboot');

-- ----------------------------
-- Table structure for tb_comments
-- ----------------------------
DROP TABLE IF EXISTS `tb_comments`;
CREATE TABLE `tb_comments`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `p_id` bigint(20) NULL DEFAULT 0 COMMENT '父级ID，给哪个留言进行回复',
  `c_id` bigint(20) NULL DEFAULT 0 COMMENT '子级ID，给哪个留言下的回复进行评论',
  `article_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `article_id` bigint(20) NULL DEFAULT NULL COMMENT '文章ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `c_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '给谁留言',
  `time` datetime(0) NOT NULL COMMENT '留言时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网址',
  `type` bigint(20) NULL DEFAULT 0 COMMENT '分类：0:默认，文章详情页，1:友链页，2:关于页',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `device` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comments
-- ----------------------------
INSERT INTO `tb_comments` VALUES (106, 105, NULL, NULL, NULL, '非子非鱼', NULL, '2019-03-26 08:14:31', '回复你', '122@qq.com', 'https://www.feizifeiyu.tk/', 2, NULL, 'Chrome,Mac OS X', NULL);
INSERT INTO `tb_comments` VALUES (107, 0, 0, NULL, NULL, '一剑寒雪', NULL, '2019-03-26 08:42:09', '留言', '122@qq.com', 'https://www.feizifeiyu.tk/', 2, '127.0.0.1', 'Chrome,Mac OS X', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_comments` VALUES (108, 0, 0, '测试heiehi', 12, '非子非鱼', NULL, '2019-03-26 18:28:31', '测试下', '1222@qq.com', 'https://www.feizifeiyu.tk/', 0, '127.0.0.1', 'Chrome,Mac OS X', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for tb_links
-- ----------------------------
DROP TABLE IF EXISTS `tb_links`;
CREATE TABLE `tb_links`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友链表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_links
-- ----------------------------
INSERT INTO `tb_links` VALUES (1, '非子非鱼的博客', 'https://www.feizifeiyu.tk/');
INSERT INTO `tb_links` VALUES (3, '非子非鱼的Advantage', 'https://docsify.js.org/#/');

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '耗时(毫秒)',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作参数',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `location` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES (49, 'feizifeiyu', '更新用户', 37, 'com.feizifeiyu.vblog.admin.controller.UserController.update()', ' user\"User(id=1, username=feizifeiyu, password=b569c75ee31f92738efa9727359be8e2, salt=f66d8a04211434ced334a3be48104b24, avatar=/img/avatar/default.jpg, introduce=心静如水，代码如风, remark=着急修BUG的Coder, checkPass=null)\"', '127.0.0.1', '2019-05-03 18:18:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (50, 'feizifeiyu', '更新用户', 31, 'com.feizifeiyu.vblog.admin.controller.UserController.update()', ' user\"User(id=1, username=feizifeiyu, password=b1c1f24faa78bafcc61911adddf866eb, salt=c850a7633b1589323072309a433c6233, avatar=/img/avatar/default.jpg, introduce=心静如水，代码如风, remark=着急修BUG的Coder, checkPass=null)\"', '127.0.0.1', '2019-05-03 18:25:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (51, 'feizifeiyu', '更新用户', 318121, 'com.feizifeiyu.vblog.admin.controller.UserController.update()', ' user\"User(id=1, username=feizifeiyu, password=9ec32b98fafc3fa6aa961fcee8bfd0a5, salt=034e957fff588f3caafba278ec8f5104, avatar=/img/avatar/default.jpg, introduce=心静如水，代码如风, remark=着急修BUG的Coder, checkPass=null)\"', '127.0.0.1', '2019-05-03 18:39:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (52, 'feizifeiyu', '更新用户', 25, 'com.feizifeiyu.vblog.admin.controller.UserController.update()', ' user\"User(id=1, username=feizifeiyu, password=5f30f29b4be250e55a8074b2b9caa2bb, salt=38d3eae420cffb400afec72d6de9b684, avatar=/img/avatar/default.jpg, introduce=心静如水，代码如风, remark=着急修BUG的Coder, checkPass=null)\"', '127.0.0.1', '2019-05-03 18:39:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (53, 'feizifeiyu', '更新用户', 9, 'com.feizifeiyu.vblog.admin.controller.UserController.update()', ' user\"User(id=1, username=非子非鱼, password=966eba4621063ee73ee5ddc9e65b7cd2, salt=a096c6e2ea5036fafe62affa4d609845, avatar=/img/avatar/default.jpg, introduce=心静如水，代码如风, remark=着急修BUG的Coder, checkPass=null)\"', '127.0.0.1', '2019-05-03 18:40:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (54, 'feizifeiyu', '更新友链', 18, 'com.feizifeiyu.vblog.admin.controller.LinksController.update()', ' link\"Links(id=3, name=非子非鱼的Advantage, url=https://docsify.js.org/#/)\"', '127.0.0.1', '2019-05-03 18:46:26', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for tb_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_login_log`;
CREATE TABLE `tb_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `device` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录设备',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_login_log
-- ----------------------------
INSERT INTO `tb_login_log` VALUES (40, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 08:58:01', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (41, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 09:25:50', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (42, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 09:32:48', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (43, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 09:43:07', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (44, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 10:07:32', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (45, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 11:23:41', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (46, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 11:26:27', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (47, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 11:52:07', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (48, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 11:52:51', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (49, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 18:24:11', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (50, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 18:33:42', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (51, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 18:40:09', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (52, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-03 18:41:53', 'Chrome -- Windows 10');
INSERT INTO `tb_login_log` VALUES (53, 'feizifeiyu', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-05-04 12:46:19', 'Chrome -- Windows 10');

-- ----------------------------
-- Table structure for tb_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_setting`;
CREATE TABLE `tb_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `site_links` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '社交链接，JSON格式',
  `site_donation` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠，微信、支付宝收款图片，JSON格式',
  `site_music` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '音乐ID',
  `about` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我，HTML格式',
  `about_md` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关于我，Markdown格式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_setting
-- ----------------------------
INSERT INTO `tb_setting` VALUES (1, '非子非鱼的博客', '[{\"key\":\"Github\",\"value\":\"https://github.com/feizifeiyu\"}]', '[{\"key\":\"支付宝\",\"value\":\"/site/images/alipay.png\"},{\"key\":\"微信支付\",\"value\":\"/site/images/wechat.png\"}]', '453843751', '<hr>\n<h2 id=\"h2-u672Cu4EBA\"><a name=\"本人\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>本人</h2><p>工作两年</p>\n<p>技术会基本功能开发、算法没怎么了解、数据结构知道点集合框架</p>\n<p>知识体系凌乱（或者也没积累多少知识~）</p>\n<p>想着要学这学那，但是不知从何下手（都是浅尝辄止的）</p>\n<p>……（此处省略很多很多）</p>\n<p>希望有一天能改变这种状态，搭建起自己的知识框架吧！！！</p>\n<p>致此</p>\n<p>加油！</p>\n<hr>\n<h2 id=\"h2-u4EA4u6D41\"><a name=\"交流\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>交流</h2><p>如果大家有兴趣，欢迎评论、留言，一起交流学习Java技术。本人一直在自学java，目前技术有限，但如果可以的话会尽力帮助大家，希望能和大家共同进步。</p>\n<p><br/></p>\n<h2 id=\"h2-u8054u7CFB\"><a name=\"联系\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>联系</h2><p>If you have some questions after you see this article, you can contact me or you can find some info by clicking these links.</p>\n<ul>\n<li><a href=\"https://www.feizifeiyu.tk/\">VBlog@非子非鱼</a></li><li><a href=\"https://github.com/feizifeiyu\">GitHub@非子非鱼</a></li></ul>\n', '\n---\n\n## 本人\n\n工作两年\n\n技术会基本功能开发、算法没怎么了解、数据结构知道点集合框架\n\n知识体系凌乱（或者也没积累多少知识~）\n\n想着要学这学那，但是不知从何下手（都是浅尝辄止的）\n\n......（此处省略很多很多）\n\n希望有一天能改变这种状态，搭建起自己的知识框架吧！！！\n\n致此\n\n加油！\n\n----------\n\n## 交流\n\n如果大家有兴趣，欢迎评论、留言，一起交流学习Java技术。本人一直在自学java，目前技术有限，但如果可以的话会尽力帮助大家，希望能和大家共同进步。\n\n<br/>\n\n## 联系\n\nIf you have some questions after you see this article, you can contact me or you can find some info by clicking these links.\n\n* [VBlog@非子非鱼](https://www.feizifeiyu.tk/)\n* [GitHub@非子非鱼](https://github.com/feizifeiyu)');

-- ----------------------------
-- Table structure for tb_tags
-- ----------------------------
DROP TABLE IF EXISTS `tb_tags`;
CREATE TABLE `tb_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tags
-- ----------------------------
INSERT INTO `tb_tags` VALUES (1, '随笔');
INSERT INTO `tb_tags` VALUES (4, '测试');
INSERT INTO `tb_tags` VALUES (5, '博客日志');
INSERT INTO `tb_tags` VALUES (6, '建站');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盐值',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `introduce` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'feizifeiyu', '9b035e3ab499aa3c052c2f4c03bfc106', 'ffd6202d8715bd2ba0a641716445f674', '/img/avatar/default.jpg', '心静如水，代码如风', '着急修BUG的Coder');

SET FOREIGN_KEY_CHECKS = 1;
