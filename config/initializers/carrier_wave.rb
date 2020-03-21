if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
<<<<<<< HEAD
      :region                => ENV['S3_REGION'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end
=======
      :region                => ENV['AWS_REGION'],     # 例: 'ap-northeast-1'
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key => ENV['AWS_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end
>>>>>>> origin/for-work
