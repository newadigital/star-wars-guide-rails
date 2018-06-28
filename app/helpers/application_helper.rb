module ApplicationHelper

    def current_page(path)
        'active' if current_page?(path)
    end

    def is_home()
        true if request.env['PATH_INFO'] == '/'
    end

    def current_section(path)
        'active' if request.env['PATH_INFO'].include? path
    end

    def format_image_url(section, value)
        file = value.to_s.downcase.gsub(/\s+/, '-')
        file = file.gsub(/é/, 'e')
        if section != ''
            section + '/' + file.downcase + '.jpg'
        else
            file.downcase + '.jpg'
        end
    end

    def image_url(image)
        if image.present?
          return image
        else
          return "/default-image.jpg"
        end
    end

    def get_id_from_uri(uri)
        id = uri.sub! 'https://swapi.co/api/', ''
        id = uri.sub! 'films/', ''
        id = uri.sub! 'people/', ''
        id = uri.sub! 'planets/', ''
        id = uri.sub! 'vehicles/', ''
        id = uri.sub! 'species/', ''
        id = uri.sub! 'starships/', ''
        id = uri.sub! '/', ''
        return id
    end

    def numerals
        return ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X']
    end

end
