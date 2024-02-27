module FlashHelper
    def self.key_to_class(key)
        case key.to_s
        when 'notice'
            return 'info'
        when 'alert'
            return 'danger'
        else
            return key.to_s
        end
    end
end