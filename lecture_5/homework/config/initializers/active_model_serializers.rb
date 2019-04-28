# frozen_string_literal: true

ActiveModelSerializers.config.adapter = :json_api
ActiveModel::Serializer.config.key_transform = :underscore
