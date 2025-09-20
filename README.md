# iGroupChat-backend
iGroupChat-backend，基于botgroup.chat-server来调整，用于docker部署

## 日志
- 2025年6月24日：初始化。
- 2025年8月4日：同步更新源仓库v1.1。
  - 保留相关修改部分。
  - 本地测试通过。
- 2025年9月20日：同步更新源仓库的内容。调整较多，增加了微信登录的相关接口。
  - 保留相关修改部分。
  - 修改init-database.sql，增加了微信登录的相关字段。这样可以不用手动执行002_add_wechat_user.sql了。
  - 本地测试通过。