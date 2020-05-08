__安装 NVM (node version manager)__  
curl -o- https://raw.githubusercontent.com/54maxwu/shell/master/nvm.sh | bash 

__查看目前有的版本__  
nvm ls-remote

__安裝 nodejs__  
nvm install node

__安装好后检查__  
npm -v
```
mkdir demo-project && cd demo-project
npm init
npm install jquery
npm install jquery --save
```
>--save 參數是安裝套件時，也同步更新 package.json 裡的資訊。

建立 .gitignore  
在 push repository 之前要加入 .gitignore  
擋住一些不必要push的檔案像 node_modules 裡的所有套件  
網路上都下載得到所以沒必要推到 repository

__查看 npm 版本__  
npm -v 或 npm --versio

__安裝套件在專案下的 node_modules 目錄__  
npm i [package] 或 npm install [package]

__安裝套件在專案下的 node_modules 目錄，並更新該套件資訊到 package.json__  
npm i [package] --save 或 npm install [package] --save

__移除某套件__  
npm un [package] 或 npm uninstall [package]

__移除某套件，並更新該套件資訊到 package.json__  
npm un [package] --save或 npm uninstall [package] --save

_安装yarn (比npm更快)_  
npm install -g yarn

__检查有没有安装成功__  
yarn --version

__以yarn 安装__  
yarn add jquery bootstrap react react-dom babel-core
