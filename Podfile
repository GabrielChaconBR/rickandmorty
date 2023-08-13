# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

def project_pods
  pod 'Alamofire'
end

target 'InfraTests' do
  project_pods
end

target 'UseCasesIntegrationsTests' do
  project_pods
end

target 'Main' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  target 'Infra' do
    project_pods
  end

end
