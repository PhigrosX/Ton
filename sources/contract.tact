import "@stdlib/deploy";

message Add {
    amount: Int as uint32;
}

//Multiply
message Multiply {
    amount: Int as uint32;
}

//Devide
message Devide {
    amount: Int as uint32;
}

//decrease
message Decrease{
    amount: Int as uint32;
}

contract SampleTactContract with Deployable {

    owner: Address;
    counter: Int as uint32;

    init(owner: Address) {
        self.owner = owner;
        self.counter = 0;
    }

    fun add(v: Int) {
        
        // Check sender
        let ctx: Context = context();
        require(ctx.sender == self.owner, "Invalid sender");
        
        // Update counter
        self.counter = self.counter + v;
    }

    receive(msg: Add) {
        self.add(msg.amount);
    }

    receive("increment") {
        self.add(1);
        self.reply("incremented".asComment());
    }

    //decrease
    fun decrease(v: Int){
        // Check sender
        let ctx: Context = context();
        require(ctx.sender == self.owner, "Invalid sender");
        
        // Update counter
        self.counter = self.counter - v;
    }

    receive(msg: Decrease){
        self.decrease(msg.amount);
    }
    receive("decrease"){
        self.decrease(1);
        self.reply("decreased".asComment());
    }
     
    //multiply 
    fun multiply(v: Int){
        //check sender
        let ctx: Context = context();
        require(ctx.sender == self.owner, "Invalid sender");
        //update Mresult
        self.counter = self.counter * v;
     }

    //Multiply
    receive(msg: Multiply){
        self.multiply(msg.amount);
    }
    receive("multiply"){
        self.multiply(2);
        self.reply("incremented".asComment());
    }
    
    //devide
    fun devide(v: Int){
        //check sender
        let ctx: Context = context();
        require(ctx.sender == self.owner, "Invalid sender");
        //update Dresult
        self.counter = self.counter / v;
    }

    //Devide
    receive(msg: Devide){
        self.devide(msg.amount);
    }
    receive("devide"){
        self.devide(2);
        self.reply("devided".asComment());
    }

    get fun counter(): Int {
        return self.counter;
    }
    
    //getter
    get fun getter() :Int{
        return self.counter;
    }
}