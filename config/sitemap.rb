# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://dappercrowd.com'

SitemapGenerator::Sitemap.public_path = 'tmp/'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new

SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"

SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  add '/howitworks'

  Campaign.find_each do |campaign|
    add campaign_path(campaign), :lastmod => campaign.updated_at
  end

  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
