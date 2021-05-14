{ obelisk ? import ./.obelisk/impl {
    system = builtins.currentSystem;
  }
  , withHoogle ? false
}:
with obelisk;
let
  deps = obelisk.nixpkgs.thunkSet ./dep;
in 
project ./. ({ pkgs, ... }: {
  inherit withHoogle;
	packages = {
    cardano-crypto = deps.cardano-crypto;
		freer-extras = deps.plutus + "/freer-extras";
		marlowe = deps.plutus + "/marlowe";
		marlowe-actus = deps.plutus + "/marlowe-actus";
		marlowe-dashboard-server = deps.plutus + "/marlowe-dashboard-server";
		marlowe-playground-server = deps.plutus + "/marlowe-playground-server";
		marlowe-symbolic = deps.plutus + "/marlowe-symbolic";
		playground-common = deps.plutus + "/playground-common";
		plutus-benchmark = deps.plutus + "/plutus-benchmark";
		plutus-contract = deps.plutus + "/plutus-contract";
		plutus-core = deps.plutus + "/plutus-core";
		plutus-doc = deps.plutus + "/plutus-doc";
		plutus-errors = deps.plutus + "/plutus-errors";
		plutus-ledger = deps.plutus + "/plutus-ledger";
		plutus-ledger-api = deps.plutus + "/plutus-ledger-api";
		plutus-metatheory = deps.plutus + "/plutus-metatheory";
		plutus-pab = deps.plutus + "/plutus-pab";
		plutus-playground-server = deps.plutus + "/plutus-playground-server";
		plutus-tx = deps.plutus + "/plutus-tx";
		plutus-tx-plugin = deps.plutus + "/plutus-tx-plugin";
		plutus-use-cases = deps.plutus + "/plutus-use-cases";
		prettyprinter-configurable = deps.plutus + "/prettyprinter-configurable";
		quickcheck-dynamic = deps.plutus + "/quickcheck-dynamic";
		# web-ghc = deps.plutus + "/web-ghc";
	};
	overrides = self: super: with pkgs.haskell.lib; {
      deriving-aeson = (self.callHackageDirect { pkg = "deriving-aeson"; ver = "0.2.3"; sha256 = "sha256:0ckwdi9pr4aqp9psag4mdbx30nygxkkpdf21rg9rfz16cz8079j7"; } {});
      algebraic-graphs = (self.callHackageDirect { pkg = "algebraic-graphs"; ver = "0.5"; sha256 = "sha256:0z8mgzdis72a9zd9x9f185phqr4bx8s06piggis4rlih1rly61nr"; } {});
      inspection-testing = (self.callHackageDirect { pkg = "inspection-testing"; ver = "0.4.5.0"; sha256 = "sha256:0w8pkfh47097gxkf66j84jms6kvh3iv25n36srskwjc4nmblf3y8"; } {});
	};
  android.applicationId = "hsloan.defapp.with.rhyolite";
  android.displayName = "Default Application With Rhyolite";
  ios.bundleIdentifier = "hsloan.defapp.with.rhyolite";
  ios.bundleName = "Default Application With Rhyolite";
})
