# Adopt-A-Dog
dApp Adopt-A-Dog simulates an adoption site by tracking the adopter to the dog they decide to adopt.

## Set up the project

- Install [NodeJS](https://nodejs.org/en/) (version `v6` at least)
- Install and run [Ganache](https://truffleframework.com/ganache)
- Install and run [MetaMask](https://metamask.io/)\*:
   1. Install MetaMask in your browser.
   2. Once installed, you'll see the MetaMask fox icon next to your address bar. Click the icon and you'll see the Privacy Notice appear.
   3. Click **Accept** to accept the Privacy Notice.
   4. Then you'll see the Terms of Use. Read them, scrolling to the bottom, and then click **Accept** there too.
   5. Click **Import Existing DEN**.
   6. In the box marked **Wallet Seed**, enter the mnemonic that is given in Ganache.
   7. Enter a password below that and click **OK**.
   8. Connect MetaMask to the blockchain created by Ganache by clicking the menu that shows "Main Network" and selecting "Custom RPC".
   9. In the box titled "New RPC URL" enter `http://127.0.0.1:7545` and click **Save**. The network name at the top will switch to say "Private Network".  

_\*Note_: If you have already installed MetaMask before, please clear transactions by going to **Settings** -> **Reset Account**. Otherwise MetaMask may throw an error :(.

## Run the project
- `npm install`
- `truffle test`
- `truffle compile`
- `truffle migrate`
- `npm run dev`
- Navigate to [http://localhost:3000](http://localhost:3000)

_Note_: Please make sure to have Ganache running at all times.

## Workflow

1. [http://localhost:3000](http://localhost:3000) will take you to something similar to the following:
![](zassets/images/Step1.png)
2. Find a dog (like Frieda) that you'd like to adopt and click the **Adopt** button.  
![](zassets/images/Step2.png)
3. Find the MetaMask prompt whether to proceed. Click **Confirm**.  
![](zassets/images/Step3.png)
4. MetaMask will confirm that transaction has gone through.  
![](zassets/images/Step4.png)
5. Your adoption will show as **Success**. Congratulations on your adoption!  
![](zassets/images/Step5.png)

## Miscellaneous

1. [Avoiding Common Attacks](https://github.com/jordanonuma/ConsenSys-Academy-2018/blob/master/Adopt-A-Dog%20(Final%20Project)/zAvoiding%20Common%20Attacks.md) by applying tests to functions `adopt()`, `adopters()`, and `getAdopters()` to different pet IDs and comparing to expected results.
2. [Design Pattern Decisions](https://github.com/jordanonuma/ConsenSys-Academy-2018/blob/master/Adopt-A-Dog%20(Final%20Project)/zDesign%20Pattern%20Decisions.md) that were available and the simplest one selected that addressed correcting undesirable adopter behavior.
3. [dApp Code](https://github.com/jordanonuma/ConsenSys-Academy-2018/blob/master/Adopt-A-Dog%20(Final%20Project)/zIPFS.md) has been uploaded to [IPFS](https://ipfs.io).
