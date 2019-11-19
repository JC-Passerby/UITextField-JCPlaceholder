Pod::Spec.new do |s|
# 项目名称
s.name = 'UITextField-JCPlaceholder'
# 版本号
s.version = '1.0.2'
# 开源许可证
s.license = { :type => "MIT", :file => "LICENSE" }
# 描述一下项目的作用
s.summary = 'iOS13使用attributedPlaceholder方式来更改UITextField的Placeholder的颜色和字体大小'
# 项目首页
s.homepage = 'https://github.com/JC-Passerby/UITextField-JCPlaceholder'
# 作者信息
s.authors = { '刘某某。' => '506551555@qq.com' }
# 资源地址链接
s.source = { :git => 'https://github.com/JC-Passerby/UITextField-JCPlaceholder.git', :tag => s.version.to_s }
# 是否支持arc
s.requires_arc = false
# 所支持的版本号
s.ios.deployment_target = '8.0'
# 文件
s.source_files = "UITextField-JCPlaceholder/UITextField+JCPlaceholder.{h,m}"
s.framework = "UIKit"
end
