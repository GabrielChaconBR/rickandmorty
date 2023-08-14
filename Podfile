# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

def project_afpods
  pod 'Alamofire'
end

def project_kfpods
  pod 'Kingfisher', '~> 7.0'
end

target 'InfraTests' do
  project_afpods
end

target 'UseCasesIntegrationsTests' do
  project_afpods
end

target 'Main' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  target 'Infra' do
    project_afpods
  end
  
  target 'UI' do
    project_kfpods
  end
  
  target 'MainTests' do
    inherit! :search_paths
  end

end
