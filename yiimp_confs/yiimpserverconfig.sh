#!/usr/bin/env bash

###########################################
#              SabiasQueSpace             #
###########################################

source /etc/functions.sh
source /etc/yiimpserver.conf
source $STORAGE_ROOT/yiimp/.yiimp.conf
source $HOME/yiimpserver/yiimp_single/.wireguard.install.cnf

if [[ ("$wireguard" == "false") ]]; then

echo '<?php
// HOME Add urgent notes to the home page
// ADDRESS Shows note by user indicating the address
define('"'"'URGEN_NOTE'"'"', array (
    array('"'"'HOME'"'"','"'"'#EAF50A'"'"', '"'"'null'"'"', '"'"'These notes are set to /home/yiimp-data/yiimp/site/configuration/serverconfig.php '"'"'),
    array('"'"'ADDRESS'"'"','"'"'#EAF50A'"'"', '"'"'addres'"'"', '"'"'Text'"'"'),
    array('"'"'HOME'"'"','"'"'#43F50A'"'"', '"'"'null'"'"', '"'"'This is an urgent note'"'"')
   )
);

ini_set('"'"'date.timezone'"'"', '"'"'UTC'"'"');
define('"'"'YAAMP_LOGS'"'"', '"'"''"${STORAGE_ROOT}/yiimp/site/log"''"'"');
define('"'"'YAAMP_HTDOCS'"'"', '"'"''"${STORAGE_ROOT}/yiimp/site/web"''"'"');

define('"'"'YAAMP_BIN'"'"', '"'"'/bin'"'"');

define('"'"'YAAMP_DBHOST'"'"', '"'"''"localhost"''"'"');
define('"'"'YAAMP_DBNAME'"'"', '"'"''"${YiiMPDBName}"''"'"');
define('"'"'YAAMP_DBUSER'"'"', '"'"''"${YiiMPPanelName}"''"'"');
define('"'"'YAAMP_DBPASSWORD'"'"', '"'"''"${PanelUserDBPassword}"''"'"');

define('"'"'YAAMP_PRODUCTION'"'"', true);
define('"'"'YAAMP_RENTAL'"'"', false);

define('"'"'YAAMP_LIMIT_ESTIMATE'"'"', false);

define('"'"'YAAMP_FEES_SOLO'"'"', 2);

define('"'"'YAAMP_FEES_MINING'"'"', 1);
define('"'"'YAAMP_FEES_EXCHANGE'"'"', 2);
define('"'"'YAAMP_FEES_RENTING'"'"', 2);
define('"'"'YAAMP_TXFEE_RENTING_WD'"'"', 0.002);

define('"'"'YAAMP_PAYMENTS_FREQ'"'"', 3*60*60);
define('"'"'YAAMP_PAYMENTS_MINI'"'"', 0.001);

define('"'"'YAAMP_ALLOW_EXCHANGE'"'"', false);
define('"'"'YIIMP_PUBLIC_EXPLORER'"'"', false);
define('"'"'YIIMP_PUBLIC_BENCHMARK'"'"', false);

define('"'"'YIIMP_FIAT_ALTERNATIVE'"'"', '"'"'USD'"'"'); // USD is main
define('"'"'YAAMP_USE_NICEHASH_API'"'"', false);

define('"'"'YAAMP_BTCADDRESS'"'"', '"'"'12Pt3vQhQpXvyzBd5qcoL17ouhNFyihyz5'"'"');

define('"'"'YAAMP_SITE_URL'"'"', '"'"''"${DomainName}"''"'"');
define('"'"'YAAMP_STRATUM_URL'"'"', '"'"''"${StratumURL}"''"'"'); // change if your stratum server is on a different host
define('"'"'YAAMP_SITE_NAME'"'"', '"'"'YiiMP Pool'"'"');
define('"'"'YAAMP_ADMIN_EMAIL'"'"', '"'"''"${SupportEmail}"''"'"');
define('"'"'YAAMP_ADMIN_IP'"'"', '"'"''"${PublicIP}"''"'"'); // samples: "80.236.118.26,90.234.221.11" or "10.0.0.1/8"

define('"'"'YAAMP_ADMIN_WEBCONSOLE'"'"', true);
define('"'"'YAAMP_CREATE_NEW_COINS'"'"', false);
define('"'"'YAAMP_NOTIFY_NEW_COINS'"'"', false);

define('"'"'YAAMP_DEFAULT_ALGO'"'"', '"'"'sha256'"'"');

define('"'"'YAAMP_USE_NGINX'"'"', true);

// Exchange public keys (private keys are in a separate config file)
define('"'"'EXCH_CRYPTOPIA_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_POLONIEX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BITTREX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BLEUTRADE_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BTER_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_YOBIT_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_CCEX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_CEXIO_ID'"'"', '"'"''"'"');
define('"'"'EXCH_CEXIO_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_COINMARKETS_USER'"'"', '"'"''"'"');
define('"'"'EXCH_COINMARKETS_PIN'"'"', '"'"''"'"');
define('"'"'EXCH_CREX24_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BINANCE_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BITSTAMP_ID'"'"', '"'"''"'"');
define('"'"'EXCH_BITSTAMP_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_HITBTC_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_KRAKEN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_KUCOIN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_LIVECOIN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_NOVA_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_STOCKSEXCHANGE_KEY'"'"', '"'"''"'"');

// Automatic withdraw to Yaamp btc wallet if btc balance > 0.3
define('"'"'EXCH_AUTO_WITHDRAW'"'"', 0.3);

// nicehash keys deposit account & amount to deposit at a time
define('"'"'NICEHASH_API_KEY'"'"','"'"'521c254d-8cc7-4319-83d2-ac6c604b5b49'"'"');
define('"'"'NICEHASH_API_ID'"'"','"'"'9205'"'"');
define('"'"'NICEHASH_DEPOSIT'"'"','"'"'3J9tapPoFCtouAZH7Th8HAPsD8aoykEHzk'"'"');
define('"'"'NICEHASH_DEPOSIT_AMOUNT'"'"','"'"'0.01'"'"');

$cold_wallet_table = array(
'"'"'12Pt3vQhQpXvyzBd5qcoL17ouhNFyihyz5'"'"' => 0.10,
);

// Sample fixed pool fees
$configFixedPoolFees = array(
'"'"'zr5'"'"' => 1,
'"'"'scrypt'"'"' => 1,
'"'"'sha256'"'"' => 1,
);

// Sample fixed pool fees solo
$configFixedPoolFeesSolo = array(
'"'"'zr5'"'"' => 2,
'"'"'scrypt'"'"' => 2,
'"'"'sha256'"'"' => 2,
);

// Sample custom stratum ports
$configCustomPorts = array(
// '"'"'x11'"'"' => 7000,
);

// mBTC Coefs per algo (default is 1.0)
$configAlgoNormCoef = array(
// '"'"'x11'"'"' => 5.0,
);

// COIN MESSAGE = RPC Error: error -8: dummy value must be set to "*", add COIN in line (coin_results.php)
define('"'"'RPC_ERROR_8'"'"', array(
    '"'"'NAP'"'"',
    '"'"'CHI'"'"',
    '"'"'NAPI'"'"',
    '"'"'RTM'"'"',
    '"'"'FITA'"'"',
    '"'"'BTRM'"'"',
    '"'"'SIN'"'"',
    '"'"'BBC'"'"',
));

// COIN ERROR PAIMENTS = RPC Error (payment.php)
// todo: enhance/detect payout_max from normal sendmany error
define('"'"'RPC_ERROR_PAIMENT'"'"', array(
    '"'"'NAP'"'"',
    '"'"'CHI'"'"',
    '"'"'NAPI'"'"',
    '"'"'BBC'"'"',
    '"'"'PGN'"'"',
    '"'"'VTRM'"'"',
    '"'"'UFO'"'"',
    '"'"'SIN'"'"',
    '"'"'BTRM'"'"',
    '"'"'ZOC'"'"',
    '"'"'IQ'"'"',
    '"'"'YERB'"'"',
    '"'"'SPK'"'"',
    '"'"'AVN'"'"',
    '"'"'ADOT'"'"',
    '"'"'APX'"'"',
    '"'"'BITC'"'"',
    '"'"'FITA'"'"',
    '"'"'BNODE'"'"',
    '"'"'BOD'"'"',
    '"'"'DIME'"'"',
    '"'"'BTCRY'"'"',
    '"'"'IOTS'"'"',
    '"'"'ECC'"'"',
    '"'"'BCRS'"'"',
    '"'"'SAPP'"'"',
    '"'"'CURVE'"'"',
    '"'"'JGC'"'"',
));' | sudo -E tee $STORAGE_ROOT/yiimp/site/configuration/serverconfig.php >/dev/null 2>&1

else

echo '<?php
ini_set('"'"'date.timezone'"'"', '"'"'UTC'"'"');
define('"'"'YAAMP_LOGS'"'"', '"'"''"${STORAGE_ROOT}/yiimp/site/log"''"'"');
define('"'"'YAAMP_HTDOCS'"'"', '"'"''"${STORAGE_ROOT}/yiimp/site/web"''"'"');

define('"'"'YAAMP_BIN'"'"', '"'"'/bin'"'"');

define('"'"'YAAMP_DBHOST'"'"', '"'"''"${DBInternalIP}"''"'"');
define('"'"'YAAMP_DBNAME'"'"', '"'"''"${YiiMPDBName}"''"'"');
define('"'"'YAAMP_DBUSER'"'"', '"'"''"${YiiMPPanelName}"''"'"');
define('"'"'YAAMP_DBPASSWORD'"'"', '"'"''"${PanelUserDBPassword}"''"'"');

define('"'"'YAAMP_PRODUCTION'"'"', true);
define('"'"'YAAMP_RENTAL'"'"', false);

define('"'"'YAAMP_LIMIT_ESTIMATE'"'"', false);

define('"'"'YAAMP_FEES_SOLO'"'"', 2);

define('"'"'YAAMP_FEES_MINING'"'"', 1);
define('"'"'YAAMP_FEES_EXCHANGE'"'"', 2);
define('"'"'YAAMP_FEES_RENTING'"'"', 2);
define('"'"'YAAMP_TXFEE_RENTING_WD'"'"', 0.002);

define('"'"'YAAMP_PAYMENTS_FREQ'"'"', 3*60*60);
define('"'"'YAAMP_PAYMENTS_MINI'"'"', 0.001);

define('"'"'YAAMP_ALLOW_EXCHANGE'"'"', false);
define('"'"'YIIMP_PUBLIC_EXPLORER'"'"', false);
define('"'"'YIIMP_PUBLIC_BENCHMARK'"'"', false);

define('"'"'YIIMP_FIAT_ALTERNATIVE'"'"', '"'"'USD'"'"'); // USD is main
define('"'"'YAAMP_USE_NICEHASH_API'"'"', false);

define('"'"'YAAMP_BTCADDRESS'"'"', '"'"'12Pt3vQhQpXvyzBd5qcoL17ouhNFyihyz5'"'"');

define('"'"'YAAMP_SITE_URL'"'"', '"'"''"${DomainName}"''"'"');
define('"'"'YAAMP_STRATUM_URL'"'"', '"'"''"${StratumURL}"''"'"'); // change if your stratum server is on a different host
define('"'"'YAAMP_SITE_NAME'"'"', '"'"'Yiimp-Server'"'"');
define('"'"'YAAMP_ADMIN_EMAIL'"'"', '"'"''"${SupportEmail}"''"'"');
define('"'"'YAAMP_ADMIN_IP'"'"', '"'"''"${PublicIP}"''"'"'); // samples: "80.236.118.26,90.234.221.11" or "10.0.0.1/8"

define('"'"'YAAMP_ADMIN_WEBCONSOLE'"'"', true);
define('"'"'YAAMP_CREATE_NEW_COINS'"'"', false);
define('"'"'YAAMP_NOTIFY_NEW_COINS'"'"', false);

define('"'"'YAAMP_DEFAULT_ALGO'"'"', '"'"'sha256'"'"');

define('"'"'YAAMP_USE_NGINX'"'"', true);

// Exchange public keys (private keys are in a separate config file)
define('"'"'EXCH_CRYPTOPIA_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_POLONIEX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BITTREX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BLEUTRADE_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BTER_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_YOBIT_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_CCEX_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_CEXIO_ID'"'"', '"'"''"'"');
define('"'"'EXCH_CEXIO_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_COINMARKETS_USER'"'"', '"'"''"'"');
define('"'"'EXCH_COINMARKETS_PIN'"'"', '"'"''"'"');
define('"'"'EXCH_CREX24_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BINANCE_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_BITSTAMP_ID'"'"', '"'"''"'"');
define('"'"'EXCH_BITSTAMP_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_HITBTC_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_KRAKEN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_KUCOIN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_LIVECOIN_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_NOVA_KEY'"'"', '"'"''"'"');
define('"'"'EXCH_STOCKSEXCHANGE_KEY'"'"', '"'"''"'"');

// Automatic withdraw to Yaamp btc wallet if btc balance > 0.3
define('"'"'EXCH_AUTO_WITHDRAW'"'"', 0.3);

// nicehash keys deposit account & amount to deposit at a time
define('"'"'NICEHASH_API_KEY'"'"','"'"'521c254d-8cc7-4319-83d2-ac6c604b5b49'"'"');
define('"'"'NICEHASH_API_ID'"'"','"'"'9205'"'"');
define('"'"'NICEHASH_DEPOSIT'"'"','"'"'3J9tapPoFCtouAZH7Th8HAPsD8aoykEHzk'"'"');
define('"'"'NICEHASH_DEPOSIT_AMOUNT'"'"','"'"'0.01'"'"');

$cold_wallet_table = array(
'"'"'12Pt3vQhQpXvyzBd5qcoL17ouhNFyihyz5'"'"' => 0.10,
);

// Sample fixed pool fees
$configFixedPoolFees = array(
'"'"'zr5'"'"' => 1,
'"'"'scrypt'"'"' => 1,
'"'"'sha256'"'"' => 1,
);

// Sample fixed pool fees solo
$configFixedPoolFeesSolo = array(
'"'"'zr5'"'"' => 2,
'"'"'scrypt'"'"' => 2,
'"'"'sha256'"'"' => 2,
);

// Sample custom stratum ports
$configCustomPorts = array(
// '"'"'x11'"'"' => 7000,
);

// mBTC Coefs per algo (default is 1.0)
$configAlgoNormCoef = array(
// '"'"'x11'"'"' => 5.0,
);' | sudo -E tee $STORAGE_ROOT/yiimp/site/configuration/serverconfig.php >/dev/null 2>&1
fi
cd $HOME/yiimpserver/yiimp_single
