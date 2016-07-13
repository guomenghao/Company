Pod::Spec.new do |s|  
  s.name             = "Company" 
  s.version          = "1.0.0"  
  s.description      = <<-DESC
                        通过设置数字变化的插值来展现动画效果,通过设置数字变化的插值来展现动画效果通过设置数字变化的插值来展现动画效果
                          DESC
  s.summary          = "A marquee view used on iOS."   
  s.homepage         = "https://github.com/guomenghao/Company"  
 
  s.license          = 'MIT'  
  s.author           = { "郭梦浩" => "http://www.jianshu.com/users/c3f9e562c518/latest_articles" }  
  s.source           = { :git => "https://github.com/guomenghao/Company.git", :tag => s.version.to_s }  
  
  s.platform     = :ios, '8.0'   
  s.requires_arc = true  
  
  s.source_files = 'Company/*'  
  # s.resources = 'Assets'  
 
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'  
end