
class GenerateService
    def code(number)
        charset = Array('A'..'Z') + Array('a'..'z')
        return Array.new(number) { charset.sample }.join
    end
end