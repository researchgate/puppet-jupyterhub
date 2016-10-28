# see params class for details, all values default to jupyterhub defaults
class jupyterhub::config (
  $user                           = $::jupyterhub::user,
  $group                          = $::jupyterhub::group,
  $virtualenv                     = $::jupyterhub::virtualenv,
  $ssl_key                        = $::jupyterhub::ssl_key,
  $ssl_cert                       = $::jupyterhub::ssl_cert,
  $confdir                        = $::jupyterhub::confdir,
  $log_format                     = $::jupyterhub::log_format,
  $log_level                      = $::jupyterhub::log_level,
  $jh_admin_access                = $::jupyterhub::jh_admin_access,
  $jh_answer_yes                  = $::jupyterhub::jh_answer_yes,
  $jh_authenticator_class         = $::jupyterhub::jh_authenticator_class,
  $jh_base_url                    = $::jupyterhub::jh_base_url,
  $jh_api_tokens                  = $::jupyterhub::jh_api_tokens,
  $jh_cleanup_proxy               = $::jupyterhub::jh_cleanup_proxy,
  $jh_cleanup_servers             = $::jupyterhub::jh_cleanup_servers,
  $jh_config_file                 = $::jupyterhub::jh_config_file,
  $jh_confirm_no_ssl              = $::jupyterhub::jh_confirm_no_ssl,
  $jh_cookie_max_age_days         = $::jupyterhub::jh_cookie_max_age_days,
  $jh_cookie_secret               = $::jupyterhub::jh_cookie_secret,
  $jh_cookie_secret_file          = $::jupyterhub::jh_cookie_secret_file,
  $jh_data_files_path             = $::jupyterhub::jh_data_files_path,
  $jh_db_kwargs                   = $::jupyterhub::jh_db_kwargs,
  $jh_db_url                      = $::jupyterhub::jh_db_url,
  $jh_debug_db                    = $::jupyterhub::jh_debug_db,
  $jh_debug_proxy                 = $::jupyterhub::jh_debug_proxy,
  $jh_extra_log_file              = $::jupyterhub::jh_extra_log_file,
  $jh_extra_log_handlers          = $::jupyterhub::jh_extra_log_handlers,
  $jh_hub_ip                      = $::jupyterhub::jh_hub_ip,
  $jh_hub_port                    = $::jupyterhub::jh_hub_port,
  $jh_hub_prefix                  = $::jupyterhub::jh_hub_prefix,
  $jh_ip                          = $::jupyterhub::jh_ip,
  $jh_jinja_ev_options            = $::jupyterhub::jh_jinja_ev_options,
  $jh_last_activity_interval      = $::jupyterhub::jh_last_activity_interval,
  $jh_logo_file                   = $::jupyterhub::jh_logo_file,
  $jh_pid_file                    = $::jupyterhub::jh_pid_file,
  $jh_port                        = $::jupyterhub::jh_port,
  $jh_proxy_api_ip                = $::jupyterhub::jh_proxy_api_ip,
  $jh_proxy_api_port              = $::jupyterhub::jh_proxy_api_port,
  $jh_proxy_auth_token            = $::jupyterhub::jh_proxy_auth_token,
  $jh_proxy_check_interval        = $::jupyterhub::jh_proxy_check_interval,
  $jh_proxy_cmd                   = $::jupyterhub::jh_proxy_cmd,
  $jh_reset_db                    = $::jupyterhub::jh_reset_db,
  $jh_spawner_class               = $::jupyterhub::jh_spawner_class,
  $jh_statsd_host                 = $::jupyterhub::jh_statsd_host,
  $jh_statsd_prefix               = $::jupyterhub::jh_statsd_prefix,
  $jh_subdomain_host              = $::jupyterhub::jh_subdomain_host,
  $jh_template_paths              = $::jupyterhub::jh_template_paths,
  $jh_tornado_settings            = $::jupyterhub::jh_tornado_settings,
  $spawner_args                   = $::jupyterhub::spawner_args,
  $spawner_cmd                    = $::jupyterhub::spawner_cmd,
  $spawner_debug                  = $::jupyterhub::spawner_debug,
  $spawner_default_url            = $::jupyterhub::spawner_default_url,
  $spawner_disable_user_config    = $::jupyterhub::spawner_disable_user_config,
  $spawner_env_keep               = $::jupyterhub::spawner_env_keep,
  $spawner_environment            = $::jupyterhub::spawner_environment,
  $spawner_http_timeout           = $::jupyterhub::spawner_http_timeout,
  $spawner_ip                     = $::jupyterhub::spawner_ip,
  $spawner_notebook_dir           = $::jupyterhub::spawner_notebook_dir,
  $spawner_poll_interval          = $::jupyterhub::spawner_poll_interval,
  $spawner_start_timeout          = $::jupyterhub::spawner_start_timeout,
  $authenticator_admin_users      = $::jupyterhub::authenticator_admin_users,
  $authenticator_username_map     = $::jupyterhub::authenticator_username_map,
  $authenticator_username_pattern = $::jupyterhub::authenticator_username_pattern,
  $authenticator_whitelist        = $::jupyterhub::authenticator_whitelist,
  $local_auth_add_user_cmd        = $::jupyterhub::local_auth_add_user_cmd,
  $local_auth_create_users        = $::jupyterhub::local_auth_create_users,
  $local_auth_group_whitelist     = $::jupyterhub::local_auth_group_whitelist,
  $pam_auth_encoding              = $::jupyterhub::pam_auth_encoding,
  $pam_auth_open_sessions         = $::jupyterhub::pam_auth_open_sessions,
  $pam_auth_service               = $::jupyterhub::pam_auth_service,
  )
  {
    file {$confdir:
      ensure => directory,
      owner  => $user,
      group  => $user,
    }

    file {"${confdir}/${jh_config_file}":
      ensure  => present,
      owner   => $user,
      content => template('jupyterhub/jupyterhub_config.py.erb'),
      require => File[$confdir]
    }
  }