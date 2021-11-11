#!/usr/bin/awk -f

BEGIN { print "; --- begin: auto added from awk script ---\n"; }
{

	date_utc = $1" "$2;

	cmd = "date '+%Y-%m-%d %X' -d '"date_utc" UTC'";
	cmd | getline date; close(cmd);
	split($3, assets,":");
	right_asset = assets[2];
	right_amount = $7;
	left_asset = assets[1];
	left_amount = $6;
	fee_amount = $8;
	fee_asset = tolower($NF);
	side = tolower($4);
	indent = "    ";
	right = right_amount" "right_asset;
	left = left_amount" "left_asset;

	# --- trade ---
	print date " * "side" "left_asset":"right_asset;
	printf indent "asset:binance.com:";
	printf side == "buy" ? left_asset : right_asset;
	printf indent
	print side == "buy" ? left " @@ " right : right " @@ " left;
	printf indent "asset:binance.com:";
	print side == "buy" ? right_asset : left_asset;
	printf "\n";

	# --- fee ---
	print date " * "side" "left_asset":"right_asset" fee";
	printf indent "expense:binance.com:fee";
	print indent fee_amount" "fee_asset;
	print indent "asset:binance.com:" fee_asset;
	printf "\n";

}
END { print "; --- end: auto added from awk script ---"; }
