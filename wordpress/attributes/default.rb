#
# Cookbook Name:: wordpress
# Recipe:: default
# About:: Default Wordpress Stack Settings
#
# 1) Latest Wordpress Download
# 2) Wordpress Plugins To Include
# 3) Database Stack or Other DB Type
# 4) Mixed Constants To Define
#

#
# Latest Wordpress
#
default['wordpress']['latest'] = "http://wordpress.org/latest.tar.gz"


#
# Plugins To Include
#
# Free / Downloadable Wordpress Plugins To Download And Extract
#
#default['wordpress']['plugins']['htmlpages']['latest'] = 'https://downloads.wordpress.org/plugin/html-on-pages.zip'
#default['wordpress']['plugins']['allinoneseo']['latest'] = 'https://downloads.wordpress.org/plugin/all-in-one-seo-pack.zip'
#default['wordpress']['plugins']['contact7']['latest'] = 'https://downloads.wordpress.org/plugin/contact-form-7.4.3.zip'
#default['wordpress']['plugins']['contactsi']['latest'] = 'https://downloads.wordpress.org/plugin/si-contact-form.zip'
#default['wordpress']['plugins']['countdown']['latest'] = 'https://downloads.wordpress.org/plugin/widget-countdown.1.1.3.zip'
#default['wordpress']['plugins']['dupposts']['latest'] = 'https://downloads.wordpress.org/plugin/duplicate-post.2.6.zip'
#default['wordpress']['plugins']['editauthor']['latest'] = 'https://downloads.wordpress.org/plugin/edit-author-slug.1.1.2.zip'
#default['wordpress']['plugins']['mediareplace']['latest'] = 'https://downloads.wordpress.org/plugin/enable-media-replace.zip'
#default['wordpress']['plugins']['linkmanage']['latest'] = 'https://downloads.wordpress.org/plugin/link-manager.zip'
#default['wordpress']['plugins']['p3profile']['latest'] = 'https://downloads.wordpress.org/plugin/p3-profiler.1.5.3.9.zip'
#default['wordpress']['plugins']['redirect']['latest'] = 'https://downloads.wordpress.org/plugin/redirection.2.4.3.zip'
#default['wordpress']['plugins']['regenthumb']['latest'] = 'https://downloads.wordpress.org/plugin/regenerate-thumbnails.zip'
#default['wordpress']['plugins']['wordpfence']['latest'] = 'https://downloads.wordpress.org/plugin/wordfence.6.0.20.zip'
#default['wordpress']['plugins']['mumapping']['latest'] = 'https://downloads.wordpress.org/plugin/wordpress-mu-domain-mapping.0.5.5.1.zip'
#default['wordpress']['plugins']['maintenance']['latest'] = 'https://downloads.wordpress.org/plugin/wp-maintenance-mode.2.0.3.zip'
#default['wordpress']['plugins']['posttemplate']['latest'] = 'https://downloads.wordpress.org/plugin/wp-custom-post-template.zip'
#default['wordpress']['plugins']['w3tcache']['latest'] = 'https://downloads.wordpress.org/plugin/w3-total-cache.0.9.4.1.zip'
#default['wordpress']['plugins']['awsservices']['latest'] = 'https://downloads.wordpress.org/plugin/amazon-web-services.zip'
#default['wordpress']['plugins']['cloudfront']['latest'] = 'https://downloads.wordpress.org/plugin/amazon-s3-and-cloudfront.0.9.9.zip'
#default['wordpress']['plugins']['woocomm']['latest'] = 'https://downloads.wordpress.org/plugin/woocommerce.2.4.10.zip'
#default['wordpress']['plugins']['wooseo']['latest'] = 'https://downloads.wordpress.org/plugin/woocommerce-all-in-one-seo-pack.zip'
#default['wordpress']['plugins']['woogifts']['latest'] = 'https://downloads.wordpress.org/plugin/gift-cards-for-woocommerce.2.1.1.zip'
#default['wordpress']['plugins']['woocart']['latest'] = 'https://downloads.wordpress.org/plugin/woocommerce-abandoned-cart.zip'
#default['wordpress']['plugins']['woosidebar']['latest'] = 'https://downloads.wordpress.org/plugin/woosidebars.1.4.3.zip'
#default['wordpress']['plugins']['woopp']['latest'] = 'https://downloads.wordpress.org/plugin/paypal-for-woocommerce.1.1.7.5.zip'
#default['wordpress']['plugins']['wpses']['latest'] = 'https://downloads.wordpress.org/plugin/wp-ses.zip'
#default['wordpress']['plugins']['woonav']['latest'] = 'https://downloads.wordpress.org/plugin/yith-woocommerce-ajax-navigation.2.6.0.zip'
#default['wordpress']['plugins']['woosearch']['latest'] = 'https://downloads.wordpress.org/plugin/yith-woocommerce-ajax-search.1.3.8.zip'
#default['wordpress']['plugins']['woocompare']['latest'] = 'https://downloads.wordpress.org/plugin/yith-woocommerce-compare.2.0.5.zip'
#default['wordpress']['plugins']['woowishlist']['latest'] = 'https://downloads.wordpress.org/plugin/yith-woocommerce-wishlist.2.0.12.zip'


#
# Database Stack or Other DB Type
#
# True if using a Stack created database.
# False if using local MySQL or RDS Instance.
#
default['wordpress']['use_stack_database'] = false


#
# Mixed Constants
#

# Multisite Lockdown Protection
default['wordpress']['ms_lockdown'] = true

# AWS Access & Secret Key Constants
default['wordpress']['aws_keys'] = true

# WP Cache Constant
default['wordpress']['wp_cache'] = true

# Setup Mutlisite Network Constant
default['wordpress']['setup_multisite'] = false

# Mutlisite Network Enabled Constants
default['wordpress']['network_enabled'] = true

# Repair WP Database Constant
default['wordpress']['wp-auto_repair'] = false

# Increase Memory Limit Constant
default['wordpress']['wp_memory_limit'] = false

# Default WP Cron Constant
default['wordpress']['disable_wp_cron'] = false

# File Editing Constant
default['wordpress']['disable_file_editing'] = true

# Force Secure Logins Constants
default['wordpress']['force_ssl_login'] = false