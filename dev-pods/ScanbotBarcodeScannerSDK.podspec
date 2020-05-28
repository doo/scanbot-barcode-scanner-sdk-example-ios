Pod::Spec.new do |s|
    s.name              = 'ScanbotBarcodeScannerSDK'
    s.version           = '1.4.9'
    s.summary           = 'Scanbot Barcode Scanner SDK for iOS'
    s.homepage          = 'https://scanbot.io/sdk'

    s.author            = { 'doo GmbH' => 'sdk@scanbot.io' }
    s.license           = { :type => 'Commercial', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :http => 'http://localhost:8080/scanbot-ios-barcode-scanner-sdk-pods1.4.9.zip' }
    s.ios.deployment_target = '9.0'

    s.ios.vendored_frameworks = 'ScanbotBarcodeScannerSDK.framework'
end
