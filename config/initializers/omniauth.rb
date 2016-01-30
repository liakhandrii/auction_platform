Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '974052585963373', '653595c2d3d2df9b21caf2d0e1d31610'
end