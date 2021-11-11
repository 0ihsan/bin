#!/usr/bin/awk -f

BEGIN {
	OFMT="%f";
	FS = ",";
	# RS="\r\n";
	print "; --- begin: auto added from awk script ---\n"; 
}

{

	match($NF, "\"([^\"]*)\"");
	fee_asset = tolower(substr($NF, RSTART+1, RLENGTH-2));

	gsub("\"","");

	date_utc = $2;
	cmd = "date '+%Y-%m-%d %X' -d '"date_utc"'";
	cmd | getline date; close(cmd);

	split($3, asset, "/");
	left_asset = tolower(asset[1]);
	left_amount = $6;
	right_asset = tolower(asset[2]);
	right_amount = $7*left_amount;

	indent = "    ";
	side = tolower($4);
	left = sprintf("%f %s", left_amount, left_asset);
	right = sprintf("%f %s", right_amount, right_asset);

	fee_amount = $8;

	# --- trade ---
	print date" * "side" "left_asset":"right_asset;
	printf indent "asset:ftx.com:";
	printf side == "buy" ? left_asset : right_asset;
	printf indent
	print side == "buy" ? left " @@ " right : right " @@ " left;
	printf indent "asset:ftx.com:";
	print side == "buy" ? right_asset : left_asset;
	printf "\n";

	# --- fee ---
	print date" * "side" "left_asset":"right_asset" fee";
	printf indent "expense:ftx.com:fee";
	print indent sprintf("%f %s", fee_amount, fee_asset);
	print indent "asset:ftx.com:" fee_asset;
	printf "\n";

}

END { print "; --- end: auto added from awk script ---"; }
