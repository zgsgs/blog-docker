# 抽象模型层

## 快速入门

[安装与连接数据库](https://www.sequelize.com.cn/core-concepts/getting-started)

## 模型基础

模型是 Sequelize 的本质. 模型是代表数据库中表的抽象. 在 Sequelize 中,它是一个 [Model](https://sequelize.org/master/class/lib/model.js~Model.html) 的扩展类.

### 模型定义

#### 基本参数

- type 定义数据类型
- defaultValue 定义默认值
- primaryKey 主键约束
- unique 唯一性约束 属性可以是布尔值或字符串 如果为多个列提供相同的字符串,则它们将形成一个复合唯一键
- autoIncrement 自动递增 可用于创建 auto_incrementing 整数列
- field 指定自定义列名称
- comment 注释只能添加到 MySQL,MariaDB,PostgreSQL 和 MSSQL 的列中

#### 其他参数

> **其他参数说明**
>
> `freezeTableName: true` 参数停止 Sequelize 执行自动复数化
>
> `tableName: 'xxxx'` 直接告诉 Sequelize 表名称

### 模型同步

- `Users.sync()` - 如果表不存在,则创建该表(如果已经存在,则不执行任何操作)
- `Users.sync({ force: true })` - 将创建表,如果表已经存在,则将其首先删除
- `Users.sync({ alter: true })` - 这将检查数据库中表的当前状态(它具有哪些列,它们的数据类型等),然后在表中进行必要的更改以使其与模型匹配.

#### 一次同步所有

你可以使用 [`sequelize.sync()`](https://sequelize.org/master/class/lib/sequelize.js~Sequelize.html#instance-method-sync) 自动同步所有模型. 示例：

```js
await sequelize.sync({ force: true });
console.log("所有模型均已成功同步.");
```

## 数据类型[#](https://www.sequelize.com.cn/core-concepts/model-basics#数据类型)

你在模型中定义的每一列都必须具有数据类型. Sequelize 提供[很多内置数据类型](https://github.com/sequelize/sequelize/blob/main/lib/data-types.js). 要访问内置数据类型,必须导入 `DataTypes`：

```js
const { DataTypes } = require("sequelize"); // 导入内置数据类型
```

Copy

### 字符串[#](https://www.sequelize.com.cn/core-concepts/model-basics#字符串)

```js
DataTypes.STRING             // VARCHAR(255)
DataTypes.STRING(1234)       // VARCHAR(1234)
DataTypes.STRING.BINARY      // VARCHAR BINARY
DataTypes.TEXT               // TEXT
DataTypes.TEXT('tiny')       // TINYTEXT
DataTypes.CITEXT             // CITEXT          仅 PostgreSQL 和 SQLite.
DataTypes.TSVECTOR           // TSVECTOR        仅 PostgreSQL.
```

Copy

### 布尔[#](https://www.sequelize.com.cn/core-concepts/model-basics#布尔)

```js
DataTypes.BOOLEAN            // TINYINT(1)
```

Copy

### 数字[#](https://www.sequelize.com.cn/core-concepts/model-basics#数字)

```js
DataTypes.INTEGER            // INTEGER
DataTypes.BIGINT             // BIGINT
DataTypes.BIGINT(11)         // BIGINT(11)
DataTypes.FLOAT              // FLOAT
DataTypes.FLOAT(11)          // FLOAT(11)
DataTypes.FLOAT(11, 10)      // FLOAT(11,10)
DataTypes.REAL               // REAL            仅 PostgreSQL.
DataTypes.REAL(11)           // REAL(11)        仅 PostgreSQL.
DataTypes.REAL(11, 12)       // REAL(11,12)     仅 PostgreSQL.
DataTypes.DOUBLE             // DOUBLE
DataTypes.DOUBLE(11)         // DOUBLE(11)
DataTypes.DOUBLE(11, 10)     // DOUBLE(11,10)
DataTypes.DECIMAL            // DECIMAL
DataTypes.DECIMAL(10, 2)     // DECIMAL(10,2)
```

#### 无符号和零填充整数 - 仅限于MySQL/MariaDB[#](https://www.sequelize.com.cn/core-concepts/model-basics#无符号和零填充整数---仅限于mysqlmariadb)

在 MySQL 和 MariaDB 中,可以将数据类型`INTEGER`, `BIGINT`, `FLOAT` 和 `DOUBLE` 设置为无符号或零填充(或两者),如下所示：

```js
DataTypes.INTEGER.UNSIGNED
DataTypes.INTEGER.ZEROFILL
DataTypes.INTEGER.UNSIGNED.ZEROFILL// 你还可以指定大小,即INTEGER(10)而不是简单的INTEGER
// 同样适用于 BIGINT, FLOAT 和 DOUBLE
```

### 日期[#](https://www.sequelize.com.cn/core-concepts/model-basics#日期)

```js
DataTypes.DATE       // DATETIME 适用于 mysql / sqlite, 带时区的TIMESTAMP 适用于 postgres
DataTypes.DATE(6)    // DATETIME(6) 适用于 mysql 5.6.4+. 支持6位精度的小数秒
DataTypes.DATEONLY   // 不带时间的 DATE
```

### UUID[#](https://www.sequelize.com.cn/core-concepts/model-basics#uuid)

对于 UUID,使用 `DataTypes.UUID`. 对于 PostgreSQL 和 SQLite,它会是 `UUID` 数据类型;对于 MySQL,它则变成`CHAR(36)`. Sequelize 可以自动为这些字段生成 UUID,只需使用 `Sequelize.UUIDV1` 或 `Sequelize.UUIDV4` 作为默认值即可：

```js
{  type: DataTypes.UUID,
   defaultValue: Sequelize.UUIDV4 // 或 Sequelize.UUIDV1
}
```

### 其它[#](https://www.sequelize.com.cn/core-concepts/model-basics#其它)

还有其他数据类型,请参见[其它数据类型](https://www.sequelize.com.cn/other-topics/other-data-types).
