# lotus-ledger-import

Import any ledger addresses with derivation path `m/44\'/461\'/0\'/0/X` into Lotus.

This bash script can generate a file that acts as an exported ledger wallet
for Lotus (export of ledger wallets is disabled in lotus). It only works for derivation
paths of the form `m/44\'/461\'/0\'/0/X`, where X is any chosen number.

It is useful when having multiple ledgers so that you can register in Lotus
specifically the derived addresses you want. The only way now is `lotus wallet
new secp256k1-ledger` will keep doing +1 on previous derivation paths even if
a new Ledger is used, rather than starting from `m/44\'/461\'/0\'/0/0`.

In order to derive the first 20 addresses from a ledger, you can use
`lotus-shed ledger list`.

Then any of those can be imported into lotus with:

```
./lotus-ledger-import <address> <X> | lotus wallet import
```

...where the address is the f1 address show my lotus-shed and X is the number
in the derivation path `m/44\'/461\'/0\'/0/X`.
