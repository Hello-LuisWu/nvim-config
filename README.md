# 文档目录
1. [nvim-config](#nvim-config)
   1. [必须软件](#必须软件)
   2. [清除文件](#清除文件)
   3. [克隆配置文件](#克隆配置文件)
   
# nvim-config

## 必须软件

nvim插件所必须的

1. stylua
2. ripgrep
3. gcc

## 清除文件
如果不是第一次使用 nvim 和nvim插件,那么必须要清除以前用过nvim 所产生的缓存和配置文件

```sh
rm -rf ~/.config/nvim/ ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/
```

## 克隆配置文件

```sh 
git clone --depth 1 https://github.com/Hello-LuisWu/nvim-config.git
```

