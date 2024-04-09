module LocaleHelper
    def self.set_selected(locale)
        if I18n.locale.to_s == locale.to_s
            return 'text-decoration-underline' 
        else 
            return ''
        end    
    end
end