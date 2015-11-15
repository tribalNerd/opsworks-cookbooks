#
# Cookbook Name:: wp_config
# Recipe:: wp_config::default
# About:: Settings for wp_config.php
#

#
# Database Settings
#

default[:wordpress][:lang] = ""
default[:wordpress][:prfx] = "tn_"
default[:wordpress][:name] = "technerdiadb"
default[:wordpress][:user] = "wp1technerdia"
default[:wordpress][:pass] = "J2dqfDg07lmdwiuycZsQ"
default[:wordpress][:host] = "hivedbinstance.cvw1qm8j3pfh.us-east-1.rds.amazonaws.com:3306"

#
# Mixed Constants
#

default[:wordpress][:mutlsite_domain] = "hive.madmadder.com"

# WP Cache Constant
default[:wordpress][:wp_cache] = "true"

# Repair WP Database Constant
default[:wordpress][:wp_auto_repair] = "false"

# Increase Memory Limit Constant
default[:wordpress][:wp_memory_limit] = "true"

# Default WP Cron Constant
default[:wordpress][:disable_wp_cron] = "false"

# File Editing Constant
default[:wordpress][:disable_file_edit] = "true"

# Force Secure Logins Constants
default[:wordpress][:force_ssl_login] = "false"

# Setup Mutlisite Network Constant
default[:wordpress][:setup_multisite] = "false"

# Mutlisite Network Enabled Constants
default[:wordpress][:network_enabled] = "true"

# AWS Access & Secret Key Constants
default[:wordpress][:aws_keys] = "true"
default[:wordpress][:aws_access_key] = "AKIAILL4TGE42YGQ6BHQ"
default[:wordpress][:aws_secrets_key] = "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"

# Multisite Lockdown Protection
default[:wordpress][:ms_lockdown] = "true"
default[:wordpress][:mslock_down_key] = "8aNnbxZH7ltLA"


#
# Secret Key Salts
#
default[:wordpress][:auth_key]         = "EVLA46Rw[EczQ69LC8<lBXFre[X(1G3O+CCX#|3g`-QbYI:18GTE{!`qQ@;-|Vjh"
default[:wordpress][:secure_auth_key]  = "v+z.Ujk8CT4,r+-WSn;V)EP/|TOU*sHe!,pm,bM;PZ_P2|;,G$wkRYmp,[/QA^yK"
default[:wordpress][:logged_in_key]    = "zIzf6r0w<A$w[4=_KdB$lfDw;sIW[H#m:^a<)[iCXAyf/MijHQo8NG^QLsw1zUd/"
default[:wordpress][:nonce_key]        = ",5C?-fm+-+WIQtM%nvwq3oI5OQd7U;!ePSJ?|PH*#HEa~_.n:LJEUO5I<M22TW_j"
default[:wordpress][:auth_salt]        = "x09^d9K<f#sD-6IGl(yRw-~%2BD5[gH)51{%H&DVDNg3.6@kR2d-+8 +Tvnb&LtD"
default[:wordpress][:secure_auth_salt] = "4Co%( #^(N}~-_+tMn4$eH^q0XZTxRfN-IfA{+T)>^>i!U^?-dsf!)b_4*nE/vo^"
default[:wordpress][:logged_in_salt]   = "|(1@f_f+]c&8:)jwqKXdz9sON_QO~-0xZzl|EB?( l95$P9e/wPyLtM-)h;73gH&"
default[:wordpress][:nonce_salt]       = "=USn(%eEV<q]JLUChl 0#>d*%/b`2--3T$8#k$5n(AZ,*jXVfz+aFvf7}@DfjEL3"