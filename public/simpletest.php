<?php

// Define the application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV',
        (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'njala_prototype'));

// Define path to the application environment directory
defined('APP_ENV_PATH')
    || define('APP_ENV_PATH',
        realpath(dirname(__FILE__) . '/..'));

// Define path to RAMP repository
defined('RAMP_PATH')
    || define('RAMP_PATH',
        realpath('APP_ENV_PATH' . '/../ramp'));

// Define path to RAMP "application" directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH',
        realpath('RAMP_PATH' . '/application'));

// Define path to RAMP "docs" directory
defined('RAMP_DOCS_PATH')
    || define('RAMP_DOCS_PATH',
        realpath('APPLICATION_PATH' . '/docs'));

// Define path to RAMP "adminSettings" directory
defined('RAMP_ADMIN_SETTINGS_PATH')
    || define('RAMP_ADMIN_SETTINGS_PATH',
        realpath('APPLICATION_PATH' . '/adminSettings'));


echo "<html><body>\n";
echo "<p>This is a simple test that this server can display a basic
      web page.</p>
      <p>The APPLICATION_ENV has been set to " . APPLICATION_ENV . ".</p>";
echo "<p>The APP_ENV_PATH has been set to " . APP_ENV_PATH . ".</p>";
echo "<p>The RAMP_PATH has been set to " . RAMP_PATH . ".</p>";
echo "<p>The APPLICATION_PATH has been set to " . APPLICATION_PATH . ".</p>";
echo "<p>The RAMP_DOCS_PATH has been set to " . RAMP_DOCS_PATH . ".</p>";
echo "<p>The RAMP_ADMIN_SETTINGS_PATH has been set to " . RAMP_ADMIN_SETTINGS_PATH . ".</p>";
echo "</body></html>\n";

?>
