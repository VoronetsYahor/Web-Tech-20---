package app.entities;

import java.math.BigDecimal;

    public class EmulateBank {

        private int id;
        private int UserId;
        private BigDecimal Money;

    public EmulateBank(){}

    public EmulateBank(int id, int UserId,BigDecimal Money)
    {
        this.id = id;
        this.UserId = UserId;
        this.Money = Money;
    }

    public int GetId(){return id;};
    public int GetUserId(){return UserId;};
    public BigDecimal GetMoney(){return Money;};

    public void SetId(int id){this.id = id;};
    public void SetUserId(int userId){this.UserId = userId;};
    public void SetMoney(BigDecimal Money){ this.Money = Money;};


    }



