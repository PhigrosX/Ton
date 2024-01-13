import * as fs from "fs";
import * as path from "path";
import { Address, contractAddress } from "@ton/core";
import { SampleTactContract } from "./output/sample_SampleTactContract";
import { prepareTactDeployment } from "@tact-lang/deployer";
//contract address: kQCQzdhXT4acEvh-PxyAbQ9AMoY3UdNPW5H6uOzzI9CgwH7Q
//tonviewer:https://tonviewer.com/EQCQzdhXT4acEvh-PxyAbQ9AMoY3UdNPW5H6uOzzI9CgwMVa
(async () => {
    // Parameters
    let testnet = true;
    let packageName = "sample_SampleTactContract.pkg";
    let owner = Address.parse("0QDtMtsBYKmyATrVCsc6159plfZTQ439cRmv2eap8bpGC2UD");
    let init = await SampleTactContract.init(owner);

    // Load required data
    let address = contractAddress(0, init);
    let data = init.data.toBoc();
    let pkg = fs.readFileSync(path.resolve(__dirname, "output", packageName));

    // Prepareing
    console.log("Uploading package...");
    let prepare = await prepareTactDeployment({ pkg, data, testnet });
    //
    // Deploying
    console.log("============================================================================================");
    console.log("Contract Address");
    console.log("============================================================================================");
    console.log();
    console.log(address.toString({ testOnly: testnet }));
    console.log();
    console.log("============================================================================================");
    console.log("Please, follow deployment link");
    console.log("============================================================================================");
    console.log();
    console.log(prepare);
    console.log();
    console.log("============================================================================================");
})();

//0QDtMtsBYKmyATrVCsc6159plfZTQ439cRmv2eap8bpGC2UD
