CarrierWave.configure do |config|
	config.fog_credentials = {
		provider: 				'AWS',
		aws_access_key_id: 		'AKIAJ4POAXJMJ34WIPMQ',
		aws_secret_access_key: 	'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',
		region: 					'ap-northeast-1'
	}
	config.fog_directory = 'ifnill'

end