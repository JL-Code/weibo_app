# flutter 使用自定义字体图标

## 添加 `*.ttf` 的文件到项目目录中
我一般放在 `root/assets/fonts/` 中

## 修改 `pubspec.yaml` 文件
```yaml
fonts:
    - family: customIcon # 字体名称
      fonts:
        - asset: assets/fonts/custom_icon.ttf # 字体路径
```

## 生成图标
> http://fluttericon.com/