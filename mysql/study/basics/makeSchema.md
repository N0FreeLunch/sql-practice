## 데이터베이스 만들기
- 서버의 도메인 또는 IP 주소로 되어 있는 RDBMS 항목을 오른쪽 클릭하면 create database 항목이 존재한다.  `shop_db` 데이터베이스를 만들자.
- databases 항목에 들어가면 만든 `shop_db`라는 데이터베이스가 만들어진다.

---
*dbeaver의 사용 설명 포함*
## 회원 테이블을 만들어 보자.
- PK(프라이머리 키) : 아이디
- 아이디 : char 타입으로 최대 8자까지 입력 가능하도록 하자.
- 회원이름 : char 타입으로 최대 5자까지 입력 가능하도록 하자.
- 주소 : char 타입으로 최대 20자까지 입력 가능하도록 하자.
- 아이디와 회원이름은 반드시 존재해야 하지만 주소는 없을 수도 있다고 여기고 null을 허용해 주자.

### 테이블 만들기
- 만든 `shop_db` 데이터베이스를 우클릭하면 `create` 메뉴의 `table`이 존재한다.
- 테이블 이름은 `member`으로 만들어 준다.

### 컬럼 만들기
- `colums` 텝에서 빈 배경의 대상을 우클릭하면 `create new column` 이란 항목이 있다.
- 클릭하면 컬럼을 만들 수 있는 창이 나온다.

#### 아이디 컬럼 만들기
- 컬럼 이름 `member_id`, 데이터타입은 `CHAR(8)`, `not null`을 체크한다.
- `Constraints` 탭에서 텅 빈 배경에서 우클릭하면 `create new constraints` 항목을 클릭하면 제약사항을 설정하는 창이 나온다. 제약사항에서 앞서 만든 `member_id` 컬럼을 선택하고 `type`을 `PRIMARY KEY`로 설정한다.

#### 이름 컬럼 만들기
- 컬럼 이름을 `member_name`, 데이터 타입은 `CHAR(5)`, `not null`을 체크한다.

#### 주소 컬럼 만들기
- 컬럼 이름을 `member_addr`, 데이터 타입은 `CHAR(20)`으로 한다. 이번에는 `not null`을 체크하지 않는다.

### 저장 버튼 누르기
- 컬럼을 다 만들었다면 아래의 플로피 디스켓 모양의 아이콘인 save 버튼을 눌러준다.
- 테이블을 만드는 쿼리를 보여주는데 persists 버튼을 클릭한다.

---
*이제부터는 반복되는 dbeaver 툴의 사용 설명 생략*

## 제품 테이블 만들기
- `product`라는 테이블을 만든다.

#### 제품 이름 컬럼 만들기
- 제품 이름을 테이블에서 고유한 식별자로 취급하도록 하자. 일반적으로는 제품 `id`를 고유한 식별자로 하지만 여기서는 제품 이름을 고유한 식별자로 해 보자.
- `PK`의 `product_name` 컬럼을 만들고 `not null`을 체크한다.
- `Constraints` 탭에서 `product_name` 컬럼에 primary key 옵션을 준다.

#### 가격 컬럼 만들기
- 제품의 가격이 매겨져 있지 않을 수도 있지만 여기서는 모든 제품에는 가격이 정해져 있다고 가정한다. 항상 가격이 존재한다는 것은 등록된 상품은 팔기 위해 등록한 상품 정보를 저장한 테이블로 만들어졌다고 보면 된다.
- `cost` 컬럼을 만들고 데이터 타입은 `INT`로 한다.
- 제품에는 항상 가격이 부여되기 때문에 `not null`을 체크하자.

#### 제조일자 컬럼 만들기
- 보통 상품을 보면 상품에 따라서 제조일자가 나와 있는 것이 있으며 제조일자가 나와 있지 않는 것이 있다. 이 점을 고려해서 null 값을 허용한 컬럼을 만든 것으로 보인다.
- 컬럼명은 `make_date`으로 한다. 
- 날짜 형식이므로 `type`은 `DATE`로 한다.

#### 제조회사 컬럼 만들기
- 판매자도 상품의 제조사를 알 수 없는 경우가 가끔 존재할 수 있다. 수입한 제품 또는 소규모 기업에서 생산되어 여러 단계를 유통을 거쳤을 경우 제조회사를 알지 못해 표기할 수 없는 경우가 생긴다. 제조회사를 알지 못하는 경우 제조회사를 알 때까지 이를 비워둘 수 있어야 테이블이 성립되고 제조회사를 알기 전에도 상품을 판매할 수 있다는 상황을 가정하자.
- 컬럼명은 `company`라고 하자.
- `type`은 `CHAR(5)`으로 한다. 이는 회사가 5글자 이내로 표기 될 수 있는 경우인데... 회사명을 다 적지않고 어떤 코드명으로 적는다거나 하는 경우를 생각해 볼 수 있다.


#### 남은 수량 컬럼 만들기
- 남은 수량은 제품을 판매하기 위해서 반드시 필요하다. 수량이 없다면 제품을 판매할 수 없을 것이고 수량이 조금 남았다면 남은양만큼만 주문할 수 있게 하는 등의 조치가 필요하다. 제품판매 비즈니스에 있어서 필수적인 부분이므로 수량은 반드시 그 값을 입력해야 판매할 수 있도록 빈 값이 될 수 없게 `not null`을 지정한다.
- 컬럼명은 `amount`로 한다.
- 수량이므로 카운트 될 수 있는 타입인 INT로 한다.

### 테이블 생성
- 저장 버튼으로 설정한 테이블을 생성한다.


