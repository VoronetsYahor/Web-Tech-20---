package app.entities;

import org.apache.commons.codec.digest.DigestUtils;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Objects;

public class  User {
    private int id;
    private String name;
    private String lastName;
    private String patronymic;
    private java.sql.Date age;
    private String email;
    private String password;
    private BigDecimal currentMoney;
    private boolean admin;


    public User() {
    }

    public User(int id,
                String name,
                String lastName,
                String patronymic,
                java.sql.Date age,
                String email,
                String password
                ) {
        this.id = id;
        this.name = name;
        this.lastName = lastName;
        this.patronymic = patronymic;
        this.age = age;
        this.email = email;
        this.password = password;
    }

    public User(String email,String password)
    {
        this.email = email;
        this.password = password;
    }


    public String getName() {
        return name;
    }
    public int getId() {return id;}
    public String getLastName() { return lastName;}
    public String getPatronymic() {return patronymic;}
    public java.sql.Date getAge() {return age;}
    public String getEmail() {return email;}
    public String getPassword() {
        return password;
    }
    public String getPasswordHash()
    {
       return DigestUtils.sha256Hex(password);
    }
    public boolean getAdmin() {return admin;}

    public void setName(String name){this.name = name;};
    public void setId(int id){this.id = id;};
    public void setLastName(String lastName){ this.lastName = lastName; };
    public void setPatronymic(String patronymic){this.patronymic = patronymic; };
    public void setAge(java.sql.Date age){this.age = age;};
    public void setEmail(String email){this.email = email;};
    public void setPassword(String password){this.password = password;};
    public void setAdmin(boolean admin){this.admin = admin;};

    @Override
    public String toString() {
        return "User{" +
                "name='" + name + '\'' +
                ", lastName='" + lastName + '\'' +
                ", patronymic ='" + patronymic + '\'' +
                ", age ='" + age + '\'' +
                ", email ='" + email + '\'' +
                ", id ='" + id + '\'' +
                ", currentMoney ='" + currentMoney + '\'' +
                ", password='" + password + '\'' +
                ", admin='" + admin + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return name.equals(user.name) &&
                password.equals(user.password) &&
                lastName.equals(user.email) &&
                patronymic.equals(user.patronymic) &&
                age == user.age &&
                email.equals(user.email) &&
                id == user.id;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }

    public void setCurrentMoney(BigDecimal currentMoney) {
        this.currentMoney = currentMoney;
    }

    public BigDecimal getCurrentMoney() {
        return currentMoney;
    }
}
