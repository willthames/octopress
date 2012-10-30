require 'pry' 

module Jekyll

  class TrainingLogIndexPage < Page

    # Initializes a new TrainingLogIndex.
    #
    #  +base+         is the String path to the <source>.
    #  +training_dir+ is the training log directory under <source>
    def initialize(site, base, training_dir, training)
      @site = site
      @base = base
      @dir  = training_dir
      @name = 'index.html'
      self.process(@name)
      # Read the YAML data from the layout page.
      self.read_yaml(File.join(base, '_layouts'), 'training_index.html')
      # Set the title for this page.
      self.data['title']       = "Training Log"
      self.data['training'] = training
    end
  end

  class TrainingLog < Post
    def inspect
      "TrainingLog: #{self.id}>"
    end

    def html?
      true
    end

    def template
      site.config['training_permalink']
    end

    def initialize(site, source, dir, name)
      @site = site
      @base = File.join(source, dir)
      @name = name

      self.process(name)
      self.read_yaml(@base, name)

      #If we've added a date and time to the yaml, use that instead of the filename date
      #Means we'll sort correctly.
      if self.data.has_key?('date')
        # ensure Time via to_s and reparse
        self.date = Time.parse(self.data["date"].to_s)
      end

      if self.data.has_key?('published') && self.data['published'] == false
        self.published = false
      else
        self.published = true
      end
      self.categories = self.data.pluralized_array('category', 'categories')
    end

    # Convert this post into a Hash for use in Liquid templates.
    #
    # Returns <Hash>
    def to_liquid
      self.data.deep_merge({
        "title" => self.data["title"] || self.slug.split('-').select {|w| w.capitalize! || w }.join(' '),
        "url" => self.url,
        "date" => self.date,
        "id" => self.id,
        "next" => self.next,
        "previous" => self.previous,
        "tags" => self.tags,
        "content" => self.content,
        "data" => self.data['data'] })
    end

    def inspect
      "<Post: #{self.id}>"
    end

    def next
      pos = self.site.posts.index(self)

      if pos && pos < self.site.posts.length-1
        self.site.posts[pos+1]
      else
        nil
      end
    end

    def previous
      pos = self.site.posts.index(self)
      if pos && pos > 0
        self.site.posts[pos-1]
      else
        nil
      end
    end
  end
    
  class TrainingLogPageGenerator < Generator
    safe true

    def generate(site)
      dir = site.config['training_dir'] || '_training'
      training = []
      
      glob = File.join(site.source, '_training', '*.{md,markdown}')
      Dir.glob(glob).each do |f|
        tl = TrainingLog.new(site, site.source, dir, File.basename(f)) 
        site.pages << tl
        training << tl
      end

      index = TrainingLogIndexPage.new(site, site.source, 'training', training)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index

    end
  end

  class TrainingLogDataPage < Page

    def template
      '/data/:basename:output_ext'
    end

    def destination(dest)
      path = File.join(dest, CGI.unescape(self.url))
    end
  end


  # just copies the data from source directory into public directory
  class TrainingLogDataGenerator < Generator
    safe true

    def generate(site)
      glob = File.join(site.source, '_data', '*.json')
      Dir.glob(glob).each do |f|
        site.pages << TrainingLogDataPage.new(site, site.source, '_data', File.basename(f))
      end
    end      
  end

end
