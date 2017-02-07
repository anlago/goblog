/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : goblog

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-02-07 18:04:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_option
-- ----------------------------
DROP TABLE IF EXISTS `t_option`;
CREATE TABLE `t_option` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_option
-- ----------------------------
INSERT INTO `t_option` VALUES ('1', 'sitename', 'Anlasheng');
INSERT INTO `t_option` VALUES ('2', 'siteurl', 'http://www.zanjs.com');
INSERT INTO `t_option` VALUES ('3', 'subtitle', 'Go 学习之路');
INSERT INTO `t_option` VALUES ('4', 'pagesize', '10');
INSERT INTO `t_option` VALUES ('5', 'keywords', 'Go语言,博客程序,GoBlog');
INSERT INTO `t_option` VALUES ('6', 'description', '基于Go语言 走在Go 学习之路');
INSERT INTO `t_option` VALUES ('7', 'email', 'anlasheng@gmail.com');
INSERT INTO `t_option` VALUES ('8', 'theme', 'default');
INSERT INTO `t_option` VALUES ('9', 'timezone', '8');
INSERT INTO `t_option` VALUES ('10', 'stat', '');

-- ----------------------------
-- Table structure for t_post
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `author` varchar(15) NOT NULL DEFAULT '' COMMENT '作者',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` varchar(7) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `url_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'url名',
  `url_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'url访问形式',
  `content` mediumtext NOT NULL COMMENT '内容',
  `tags` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `views` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态{0:正常,1:草稿,2:回收站}',
  `post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `is_top` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  PRIMARY KEY (`id`),
  KEY `userid` (`user_id`),
  KEY `posttime` (`post_time`),
  KEY `urlname` (`url_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_post
-- ----------------------------
INSERT INTO `t_post` VALUES ('1', '1', 'admin', '关于我', '', 'about', '1', '<p>个人简介</p><p>nihsih</p>', '', '8', '0', '2013-12-31 18:27:49', '2017-02-07 23:52:53', '0');
INSERT INTO `t_post` VALUES ('2', '1', 'admin', '友情链接', '', 'links', '1', '<p>赞生<a href=\"http://zanjs.com\" target=\"_blank\" title=\"http://zanjs.com\">的博客</a></p>', '', '16', '0', '2013-12-31 18:29:54', '2017-02-07 23:52:44', '0');
INSERT INTO `t_post` VALUES ('3', '1', 'admin', 'Go的内存模型', '', '', '0', '<h4 style=\"box-sizing: border-box; font-family: \" helvetica=\"\" pingfang=\"\" hiragino=\"\" sans=\"\" wenquanyi=\"\" micro=\"\" microsoft=\"\" font-weight:=\"\" line-height:=\"\" color:=\"\" margin:=\"\" 1.5em=\"\" font-size:=\"\" white-space:=\"\" background-color:=\"\">先行发生</h4><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: \" helvetica=\"\" pingfang=\"\" hiragino=\"\" sans=\"\" wenquanyi=\"\" micro=\"\" microsoft=\"\" white-space:=\"\" background-color:=\"\">在一个gouroutine中，读和写一定是按照程序中的顺序执行的。即编译器和处理器只有在不会改变这个goroutine的行为时才可能修改读和写的执行顺序。由于重排，不同的goroutine可能会看到不同的执行顺序。例如，一个goroutine执行<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">a = 1;b = 2;</code>，另一个goroutine可能看到<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">b</code>在<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">a</code>之前更新。&nbsp;<br style=\"box-sizing: border-box;\"/>为了说明读和写的必要条件，我们定义了<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">先行发生（Happens Before）</code>--Go程序中执行内存操作的偏序。如果事件<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e1</code>发生在<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e2</code>前，我们可以说<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e2</code>发生在<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e1</code>后。如果<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e1</code>不发生在<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e2</code>前也不发生在<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e2</code>后，我们就说<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e1</code>和<code style=\"box-sizing: border-box; font-family: \" source=\"\" code=\"\" courier=\"\" font-size:=\"\" color:=\"\" background-color:=\"\" padding:=\"\" 2px=\"\" border-radius:=\"\">e2</code>是并发的。&nbsp;<br style=\"box-sizing: border-box;\"/><span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">在单独的goroutine中先行发生的顺序即是程序中表达的顺序。</em></span>&nbsp;<br style=\"box-sizing: border-box;\"/>当下面条件满足时，对变量<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>的读操作<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>是<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">被允许</em></span>看到对<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>的写操作<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>的：</p><ol style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; margin-left: 3em; padding-left: 0px; color: rgb(51, 51, 51); font-family: \" helvetica=\"\" pingfang=\"\" hiragino=\"\" sans=\"\" wenquanyi=\"\" micro=\"\" microsoft=\"\" font-size:=\"\" white-space:=\"\" background-color:=\"\" class=\" list-paddingleft-2\"><li><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>不先行发生于<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span></p></li><li><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">在<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>后<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>前没有对<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>的其他写操作</p></li></ol><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: \" helvetica=\"\" pingfang=\"\" hiragino=\"\" sans=\"\" wenquanyi=\"\" micro=\"\" microsoft=\"\" white-space:=\"\" background-color:=\"\">为了保证对变量<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>的读操作<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>看到对<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>的写操作<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>,要确保<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>是<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>允许看到的唯一写操作。即当下面条件满足时，<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>&nbsp;<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">被保证</em></span>看到<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>：</p><ol style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; margin-left: 3em; padding-left: 0px; color: rgb(51, 51, 51); font-family: \" helvetica=\"\" pingfang=\"\" hiragino=\"\" sans=\"\" wenquanyi=\"\" micro=\"\" microsoft=\"\" font-size:=\"\" white-space:=\"\" background-color:=\"\" class=\" list-paddingleft-2\"><li><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"><span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>先行发生于<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span></p></li><li><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">其他对共享变量<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>的写操作要么在<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>前，要么在<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>后。&nbsp;<br style=\"box-sizing: border-box;\"/>这一对条件比前面的条件更严格，需要没有其他写操作与<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>或<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>并发发生。</p></li></ol><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: \" helvetica=\"\" pingfang=\"\" hiragino=\"\" sans=\"\" wenquanyi=\"\" micro=\"\" microsoft=\"\" white-space:=\"\" background-color:=\"\">单独的goroutine中没有并发，所以上面两个定义是相同的：读操作<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">r</em></span>看到最近一次的写操作<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">w</em></span>写入<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>的值。当多个goroutine访问共享变量<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>时，它们必须使用同步事件来建立先行发生这一条件来保证读操作能看到需要的写操作。&nbsp;<br style=\"box-sizing: border-box;\"/>对变量<span style=\"box-sizing: border-box; font-weight: 700;\"><em style=\"box-sizing: border-box;\">v</em></span>的零值初始化在内存模型中表现的与写操作相同。&nbsp;<br style=\"box-sizing: border-box;\"/>对大于一个字的变量的读写操作表现的像以不确定顺序对多个一字大小的变量的操作。</p><p><br/></p>', ',go,', '5', '0', '2017-01-01 10:33:41', '2017-02-08 02:01:04', '0');
INSERT INTO `t_post` VALUES ('4', '1', 'admin', 'Go编程技巧--Goroutine的优雅控制', '', '', '0', '<p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>是Go语言最重要的机制，<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>将复杂的需要异步的IO调用抽象成同步调用，符合人类正常的顺序思维，极大的简化了IO编程的难度。如同线程一样，对<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>既要掌握基本的用法，更要很好的控制<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>的退出机制。本文介绍一种<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>的退出思路。</p><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">通常<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>会因为两种情况阻塞：</p><ol style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; margin-left: 3em; padding-left: 0px; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\" class=\" list-paddingleft-2\"><li><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">IO操作，比如对<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Socket</code>的<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Read</code>。</p></li><li><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\"><code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">channel</code>操作。对一个chan的读写都有可能阻塞<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>。</p></li></ol><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">对于情况1，只需要关闭对应的描述符，阻塞的<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>自然会被唤醒。</p><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">重点讨论情况2。并发编程，<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>提供一种<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">channel</code>机制，<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">channel</code>类似管道，写入者向里面写入数据，读取者从中读取数据。如果<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">channel</code>里面没有数据，读取者将阻塞，直到有数据；如果<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">channel</code>里面数据满了，写入者将因为无法继续写入数据而阻塞。</p><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如果在整个应用程序的生命周期里，writer和reader都表现为一个<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>，始终都在工作，那么如何在应用程序结束前，通知它们终止呢？在Go中，并不推荐像abort线程那样，强行的终止<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">Goroutine</code>。因此，抽象的说，必然需要保留一个入口，能够跟writer或reader通信，以告知它们终止。</p><p><br/><img src=\"/static/upload/20170207/1486453330328933300.jpg\"/></p><p><br/></p><p><br/></p>', ',go,', '10', '0', '2017-03-01 18:33:46', '2017-02-08 02:01:51', '0');
INSERT INTO `t_post` VALUES ('5', '1', 'admin', '年度语言 golang 使用感受', '', '', '0', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">首先，无意进行语言之争，毕竟，PHP是世界上最好的语言，没有之一。这个话题可以停下来了。</p><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2016年已经过去，16年的年度语言给了<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">go语言</code>，而正好这一年我都是用go用得比较多，而且版本从1.2一直用到了1.8，有一些感受，来说说我对这个年度编程语言的一些粗浅理解吧。之前也写过一篇go语言的文章，但是那时候用得还不是很多，有些特性没有用上，所以理解上和今天的有些不同。</p><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这篇文章就不分什么优势和劣势了，想到哪里说到哪里。</p><h2 id=\"articleHeader0\" style=\"box-sizing: border-box; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; font-weight: 500; line-height: 1.2; color: rgb(51, 51, 51); margin: 1.5em 0px 0px; font-size: 1.75em; border-bottom: 1px solid rgb(238, 238, 238); padding-bottom: 10px; white-space: normal; background-color: rgb(255, 255, 255);\">指针还是很重要</h2><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">先看一个小坑，可能很多初次接触go的会遇到，go的range迭代用得也很多，下面这个例子不知道你之前遇到过没有，其实值是不会变的，还是1，2，3。</p><pre class=\"hljs cs\" style=\"box-sizing: border-box; overflow: auto; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; padding: 1em; margin-bottom: 1.5em; line-height: 1.3; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); border: none; border-radius: 3px; max-height: 35em; position: relative; margin-top: 0px !important;\">type&nbsp;a&nbsp;struct&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;b&nbsp;int}func&nbsp;main()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;m&nbsp;:=&nbsp;make([]a,&nbsp;0)\r\n&nbsp;&nbsp;&nbsp;&nbsp;m&nbsp;=&nbsp;append(m,&nbsp;a{b:&nbsp;0,&nbsp;c:&nbsp;0})\r\n&nbsp;&nbsp;&nbsp;&nbsp;m&nbsp;=&nbsp;append(m,&nbsp;a{b:&nbsp;1,&nbsp;c:&nbsp;1})\r\n&nbsp;&nbsp;&nbsp;&nbsp;m&nbsp;=&nbsp;append(m,&nbsp;a{b:&nbsp;2,&nbsp;c:&nbsp;2})&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;_,&nbsp;e&nbsp;:=&nbsp;range&nbsp;m&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.b&nbsp;=&nbsp;9\r\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;_,&nbsp;x&nbsp;:=&nbsp;range&nbsp;m&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fmt.Printf(&quot;%v\\n&quot;,&nbsp;x.b)\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n}</pre><p style=\"box-sizing: border-box; margin-top: 1.5em; margin-bottom: 1.5em; color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Microsoft Yahei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在range中，后面那个元素是值传递，这个很关键，所以修改不了元素的内容，而且如果元素很大的话，迭代的开销还是挺大的，所以要么你就变成<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">for idx, _ := range m&nbsp;</code>这样的形式，用下标更新，要么就变成<code style=\"box-sizing: border-box; font-family: &quot;Source Code Pro&quot;, Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace; font-size: 0.93em; color: rgb(199, 37, 78); background-color: rgb(249, 242, 244); padding: 2px 4px; border-radius: 3px;\">m := make([]*a, 0)</code>这样的指针，这样虽然传的还是值，不过是个指针的值，一是开销小，二是可以直接修改元素内容了。</p><p><br/></p>', ',go,', '5', '0', '2018-01-01 02:33:50', '2017-02-08 02:02:27', '0');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '标签名',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('3', 'go', '3');

-- ----------------------------
-- Table structure for t_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `t_tag_post`;
CREATE TABLE `t_tag_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '标签id',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '内容id',
  `post_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '内容状态',
  `post_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `tagid` (`tag_id`),
  KEY `postid` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag_post
-- ----------------------------
INSERT INTO `t_tag_post` VALUES ('19', '3', '3', '0', '2017-02-08 02:01:04');
INSERT INTO `t_tag_post` VALUES ('20', '3', '4', '0', '2017-02-08 02:01:51');
INSERT INTO `t_tag_post` VALUES ('21', '3', '5', '0', '2017-02-08 02:02:27');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `login_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_ip` varchar(15) NOT NULL DEFAULT '0' COMMENT '最后登录ip',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `authkey` char(10) NOT NULL DEFAULT '' COMMENT '登录key',
  `active` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否激活',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', 'admin@admin.com', '8', '[', '2017-02-08 00:01:01', '', '1');
SET FOREIGN_KEY_CHECKS=1;
