package project.qrpay.vo;

import java.util.Map;

public class OwnerVO {
//owner DB
   private int no;             	//가입번호
   private String name;         //이름
   private int phone;           //연락처
   private String id;           //아이디
   private String pw;           //비밀번호
   private String email;      	//이메일
   private String email2;      	//이메일 뒤에
   private int membershipDate;   //가입일
   private int bankAccount;   //은행 계좌
   private String bankName;   //은행 계좌
   
//store DB
   private int storeNo;         //업장 번호
   private String storeName;      //가게 이름
   private String type;         //가게 타입 ex)술집, 카페, 음식점
   private int licenseNumber;      //가게 사업자 번호
   private String address;         //가게 주소
   private int ownerNo;         //업주 정보 
   private int tableCount;      //테이블 개수
   
   public OwnerVO() {}
   
   public OwnerVO(Map<String,String> map) {
	   	this.name = map.get("name");
		this.phone = map.get("phone");
		this.id = map.get("id");
		this.pw = map.get("pw");
		this.email = map.get("email");
		this.membershipDate = map.get("membershipDate");
		this.bankAccount = map.get("bankAccount");
		this.bankName = map.get("bankName");
		this.storeName = map.get("storeName");
		this.type = map.get("type");
		this.licenseNumber = map.get("licenseNumber");
		this.address = map.get("address");
	}
//사장님 getters
   public int getNo() {return no;}
   public String getName() {return name;}
   public int getPhone() {return phone;}
   public String getId() {return id;}
   public String getPw() {return pw;}
   public String getEmail1() {return email1;}
   public String getEmail2() {return email2;}
   public int getMembershipDate() {return membershipDate;}
   public int getBankAccount() { return bankAccount; }
   public String getBankName() { return bankName; }
   
//사장님 setters
   public void setNo(int no) {this.no = no;}
   public void setName(String name) {this.name = name;}
   public void setPhone(int phone) {this.phone = phone;}
   public void setId(String id) {this.id = id;}
   public void setPw(String pw) {this.pw = pw;}
   public void setEmail1(String email) {this.email1 = email;}
   public void setEmail2(String email2) {this.email2 = email2;}
   public void setMembershipDate(int membershipDate) {this.membershipDate = membershipDate;}
   public void setBankAccount(int bankAccount) { this.bankAccount = bankAccount; }
   public void setBankName(String bankName) { this.bankName = bankName; }
   
//가게 getters
   public int getStoreNo() {return storeNo;}
   public String getStoreName() {return storeName;}
   public String getType() {return type;}
   public int getLicenseNumber() {return licenseNumber;}
   public String getAddress() {return address;}
   public int getOwnerNo() {return ownerNo;}
   public int getTableCount() {return tableCount;}
   
//가게 setters
   public void setStoreNo(int storeNo) {this.storeNo = storeNo;}
   public void setStoreName(String storeName) {this.storeName = storeName;}
   public void setType(String type) {this.type = type;}
   public void setLicenseNumber(int licenseNumber) {this.licenseNumber = licenseNumber;}
   public void setAddress(String address) {this.address = address;}
   public void setOwnerNo(int ownerNo) {this.ownerNo = ownerNo;}
   public void setTableCount(int tableCount) {this.tableCount = tableCount;}

   
}//main