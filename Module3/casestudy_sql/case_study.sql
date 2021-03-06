create database furama;

use furama;

create table vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(50)
);

create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(50)
);

create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(50)
);

create table nhan_vien(
ma_nhan_vien int primary key,
ho_ten varchar(50),
ngay_sinh date,
so_cmnd varchar(50),
luong double,
so_dien_thoai varchar(50),
email varchar(100),
dia_chi varchar(50),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)

);


create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(50)

);

create table khach_hang(
ma_khach_hang int primary key,
ma_loai_khach int,
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(50),
ngay_sinh date,
gioi_tinh bit,
so_cmnd varchar(50),
so_dien_thoai varchar(50),
email varchar(50),
dia_chi varchar(50)
);

create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(50)
);

create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(50)
);

create table dich_vu(
ma_dich_vu int primary key,
ten_dich_vu varchar(50),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(50),
mo_ta_tien_nghi_khac varchar(50),
dien_tich_ho_boi double,
so_tang int
);


create table hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime,
ngay_ket_thuc_hop_dong datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)  
);


create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(50),
gia double,
don_vi varchar(50),
trang_thai varchar(50)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem (ma_dich_vu_di_kem)
);

-- nhap du lieu

insert into vi_tri values
(1,'Qu???n L??'),
(2,'Nh??n Vi??n');

insert into trinh_do values 
(1,'Trung C???p'),
(2,'Cao ?????ng'),
(3,'?????i H???c'),
(4,'Sau ?????i H???c');

insert into bo_phan values
(1,'Sale-Marketing'),
(2,'H??nh ch??nh'),
(3,'Ph???c v???'),
(4,'Qu???n l??');

insert into nhan_vien values 
(1, 'Nguy???n V??n An', '1970-11-07', '456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguy???n T???t Th??nh, ???? N???ng',1,3,1),
(2, 'L?? V??n B??nh', '1997-04-09', '654231234',7000000,'0934212314','binhlv@gmail.com','22 Y??n B??i, ???? N???ng',1,2,2),
(3, 'H??? Th??? Y???n', '1995-12-12', '999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 ??i???n Bi??n Ph???, Gia Lai',1,3,2),
(4, 'V?? C??ng To???n', '1980-04-04', '123231365',17000000,'0374443232','toan0404@gmail.com','77 Ho??ng Di???u, Qu???ng Tr???',1,4,4),
(5, 'Nguy???n B???nh Ph??t', '1999-12-09', '454363232',6000000,'0902341231','phatphat@gmail.com','43 Y??n B??i, ???? N???ng',2,1,1),
(6, 'Kh??c Nguy???n An Nghi', '2000-11-08', '964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguy???n T???t Th??nh, ???? N???ng',2,2,3),
(7, 'Nguy???n H???u H??', '1993-01-01', '534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguy???n Ch?? Thanh, Hu???',2,3,2),
(8, 'Nguy???n H?? ????ng', '1989-09-03', '234414123',9000000,'0642123111','donghanguyen@gmail.com','111 H??ng V????ng, H?? N???i',2,4,4),
(9, 'T??ng Hoang', '1982-09-03', '256781231',6000000,'0245144444','hoangtong@gmail.com','213 H??m Nghi, ???? N???ng',2,4,4),
(10, 'Nguy???n C??ng ?????o', '1994-01-08', '755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Ho?? Kh??nh, ?????ng Nai',2,3,2);


insert into loai_khach values (1, 'Diamon'), (2, 'Platinium'), (3, 'Gold'), (4, 'Silver'), (5, 'Member');

insert into khach_hang (ma_khach_hang,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)

values (1, 'Nguy???n Th??? H??o', '1970-11-07', 0,'643431213','0945423362','thihao07@gmail.com','23 Nguy???n Ho??ng, ???? N???ng',5),
(2, 'Ph???m Xu??n Di???u', '1992-08-08', 1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Th??i Phi??n, Qu???ng Tr???',3),
(3, 'Tr????ng ????nh Ngh???', '1990-02-27', 1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 ??ng ??ch Khi??m, Vinh',1),
(4, 'D????ng V??n Quan', '1981-07-08', 1,'543432111','0490039241','duongquan@gmail.com','K453/12 L?? L???i, ???? N???ng',1),
(5, 'Ho??ng Tr???n Nhi Nhi', '1995-12-09', 0,'795453345','0312345678','nhinhi123@gmail.com','224 L?? Th??i T???, Gia Lai',4),
(6, 'T??n N??? M???c Ch??u', '2005-12-06', 0,'732434215','0988888844','tonnuchau@gmail.com','37 Y??n Th???, ???? N???ng',4),
(7, 'Nguy???n M??? Kim', '1984-04-08', 0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 L?? L???i, H??? Ch?? Minh',1),
(8, 'Nguy???n Th??? H??o', '1999-04-08', 0,'965656433','0763212345','haohao99@gmail.com','55 Nguy???n V??n Linh, Kon Tum',3),
(9, 'Tr???n ?????i Danh', '1989-07-01', 1,'432341235','0643343433','danhhai99@gmail.com','24 L?? Th?????ng Ki???t, Qu???ng Ng??i',1),
(10, 'Nguy???n T??m ?????c', '1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ng?? Quy???n, ???? N???ng',2);

insert into loai_dich_vu values (1,'Villa'), (2,'House'), (3,'Room');

insert into kieu_thue values (1,'year'), (2,'month'), (3,'day'), (4,'hour');

insert into dich_vu values (1,'Villa Beach Front',25000,10000000,10,3,1,'vip','C?? h??? b??i',500,4),
(2,'House Princess 01',14000,5000000,7,2,2,'vip','C?? th??m b???p n?????ng',null,3),
(3,'Room Twin 01',5000,10000000,2,4,3,'normal','C?? tivi',null,null),
(4,'Villa No Beach Front',22000,9000000,8,3,1,'normal','C?? h??? b??i',300,3),
(5,'House Princess 02',10000,4000000,5,3,2,'normal','C?? th??m b???p n?????ng',null,2),
(6,'Room Twin 02',3000,9000000,2,4,3,'normal','C?? tivi',null,null);


insert into dich_vu_di_kem values (1,'karaoke',10000,'gi???','ti???n nghi, hi???n ?????i'),
(2,'thu?? xe m??y',10000,'chi???c','h???ng 1 xe'),
(3,'thu?? xe ?????p',20000,'chi???c','t???t'),
(4,'Buffet bu???i s??ng',15000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng'),
(5,'Buffet bu???i tr??a',90000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng'),
(6,'Buffet bu???i t???i',16000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng');

insert into hop_dong values
(1,'2020-12-08','2020-12-08',0,3,1,3),
(2,'2020-07-14','2020-07-21',200000,7,3,1),
(3,'2021-03-15','2021-03-17',50000,3,4,2),
(4,'2021-01-14','2021-01-18',100000,7,5,5),
(5,'2021-07-14','2021-07-15',0,7,2,6),
(6,'2021-06-01','2021-06-03',0,7,7,6),
(7,'2021-09-02','2021-09-05',100000,7,4,4),
(8,'2021-06-17','2021-06-18',150000,3,4,1),
(9,'2020-11-19','2020-11-19',0,3,4,3),
(10,'2021-04-12','2021-04-14',0,10,3,5),
(11,'2021-04-25','2021-04-25',0,2,2,1),
(12,'2021-05-25','2021-05-27',0,7,10,1);


insert into hop_dong_chi_tiet values (1,2,4,5), (2,2,5,8), (3,2,6,15), (4,3,1,1), (5,3,2,11), (6,1,3,1), (7,1,2,2), (8,12,2,2);

-- task 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.

select * from nhan_vien
where (ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%') and char_length(ho_ten) <=15;

-- task 3 .	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.

select * from khach_hang
where ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) between  18 and 50 and dia_chi like '%???? N???ng' or dia_chi like '%Qu??ng Tr???';

-- task 4:

select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_hop_dong) as so_lan_dat_phong from khach_hang
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where khach_hang.ma_loai_khach=1
group by khach_hang.ma_khach_hang 
order by so_lan_dat_phong asc;

-- task 5:
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc_hop_dong,
sum(ifnull(dich_vu.chi_phi_thue,0) + ifnull(hop_dong_chi_tiet.so_luong,0) * ifnull(dich_vu_di_kem.gia,0)) as tong_tien from khach_hang
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem =hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong
order by khach_hang.ma_khach_hang asc;


-- task 6:

select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where month(ngay_lam_hop_dong) between 1 and 3 and year(ngay_lam_hop_dong)=2021)
-- group by dich_vu.ma_dich_vu
order by dien_tich desc;

-- task 7:
select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,chi_phi_thue,loai_dich_vu.ten_loai_dich_vu from dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu in (select hop_dong.ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) =2020)  
and dich_vu.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where year(ngay_lam_hop_dong)=2021)
group by dich_vu.ma_dich_vu;

-- task 8:
-- cach 1
select khach_hang.ho_ten from khach_hang
group by ho_ten;

-- cach 2
select distinct khach_hang.ho_ten from khach_hang;

-- cach 3
select khach_hang.ho_ten from khach_hang 
union
select khach_hang.ho_ten from khach_hang;

-- task 9:

select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_khach_dat_phong from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong) asc;

-- task 10:
 select
 hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc_hop_dong, hop_dong.tien_dat_coc,
 sum(ifnull(hop_dong_chi_tiet.so_luong,0)) as so_luong_dich_vu_di_kem
 from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 group by hop_dong.ma_hop_dong
 order by hop_dong.ma_hop_dong asc;
 
 -- task 11:
 
 select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem from dich_vu_di_kem
 where dich_vu_di_kem.ma_dich_vu_di_kem 
 in (select hop_dong_chi_tiet.ma_dich_vu_di_kem from khach_hang 
 join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 where khach_hang.ma_loai_khach =1 and khach_hang.dia_chi like "%Vinh" or khach_hang.dia_chi like "%Qu??ng Ng??i");
 
 select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem from loai_khach
inner join khach_hang on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
inner join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
inner join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
where loai_khach.ma_loai_khach = 1 and (dia_chi like '%Vinh%' or dia_chi like '%Qu???ng Ng??i%');

-- task 12:

select hop_dong.ma_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten, khach_hang.so_dien_thoai,dich_vu.ten_dich_vu, 
sum(ifnull(hop_dong_chi_tiet.so_luong,0)) as `so_luong_dich_vu_di_kem`, hop_dong.tien_dat_coc from hop_dong
left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ma_hop_dong in (select hop_dong.ma_hop_dong from hop_dong where (month(ngay_lam_hop_dong) between 10 and 12) and year(ngay_lam_hop_dong)=2020)
and hop_dong.ma_hop_dong not in (select hop_dong.ma_hop_dong from hop_dong where (month(ngay_lam_hop_dong) between 1 and 6) and year(ngay_lam_hop_dong)=2021)
group by hop_dong.ma_hop_dong; 
 

-- task 13:
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_lan_su_dung from dich_vu_di_kem
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_lan_su_dung = (select sum(hop_dong_chi_tiet.so_luong) as so_lan_su_dung from dich_vu_di_kem
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem order by so_lan_su_dung desc limit 1);

-- task 14:
select hop_dong.ma_hop_dong,loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem,count(dich_vu_di_kem.ma_dich_vu_di_kem) as so_lan_su_dung from dich_vu_di_kem
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
group by dich_vu_di_kem.ma_dich_vu_di_kem 
having so_lan_su_dung =1
order by so_lan_su_dung;

-- task 15:
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, trinh_do.ten_trinh_do, bo_phan.ten_bo_phan, 
nhan_vien.so_dien_thoai,nhan_vien.dia_chi, hop_dong.ngay_lam_hop_dong
from nhan_vien
left join trinh_do on trinh_do.ma_trinh_do =nhan_vien.ma_trinh_do
left join bo_phan on bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
where year(hop_dong.ngay_lam_hop_dong) between 2020 and 2021
group by nhan_vien.ma_nhan_vien
having  count(hop_dong.ma_hop_dong) <=3 
order by ma_nhan_vien ;

-- task 16: 
select  nhan_vien.ma_nhan_vien, nhan_vien.ho_ten from nhan_vien where nhan_vien.ma_nhan_vien not in
(select nhan_vien.ma_nhan_vien from nhan_vien
left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021
group by nhan_vien.ma_nhan_vien);

-- delete:
create temporary table temp_hop_dong_xoa_nhan_vien(
select hop_dong.ma_nhan_vien from hop_dong
inner join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien 
where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021
group by hop_dong.ma_nhan_vien
);


set sql_safe_update =0;
delete from nhan_vien where nhan_vien.ma_nhan_vien not in (select * from temp_hop_dong_xoa_nhan_vien);
set sql_safe_update =1; 


-- task 17:
-- lay thong tin
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ma_loai_khach, sum(ifnull(dich_vu.chi_phi_thue,0) + ifnull(hop_dong_chi_tiet.so_luong,0) * ifnull(dich_vu_di_kem.gia,0)) as tong_tien from khach_hang
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem =hop_dong_chi_tiet.ma_dich_vu_di_kem
group by khach_hang.ma_khach_hang
having tong_tien > 10000000 and loai_khach.ma_loai_khach = 2;

-- update

UPDATE khach_hang,
    (SELECT 
        khach_hang.ma_khach_hang
    FROM
        khach_hang
    LEFT JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
    LEFT JOIN hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
    LEFT JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
    LEFT JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
    LEFT JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
    GROUP BY khach_hang.ma_khach_hang
    HAVING SUM(IFNULL(dich_vu.chi_phi_thue, 0) + (IFNULL(hop_dong_chi_tiet.so_luong, 0) * IFNULL(dich_vu_di_kem.gia, 0))) > 10000000) AS temp 
SET 
    khach_hang.ma_loai_khach = 1
WHERE
    khach_hang.ma_loai_khach = 2
        AND khach_hang.ma_khach_hang = temp.ma_khach_hang;
        
	
    
-- cach 2:
update khach_hang set khach_hang.ma_loai_khach =1
where khach_hang.ma_loai_khach =2
and khach_hang.ma_khach_hang in (select hop_dong.ma_khach_hang from hop_dong
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by hop_dong.ma_khach_hang
having sum(ifnull(dich_vu.chi_phi_thue, 0) + (ifnull(hop_dong_chi_tiet.so_luong, 0) * ifnull(dich_vu_di_kem.gia, 0))) > 10000000 );


-- task 18:
select khach_hang.ma_khach_hang, khach_hang.ho_ten from khach_hang
join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where year(hop_dong.ngay_lam_hop_dong) < 2021;

-- delete
create temporary table temp_khach_hang(
select khach_hang.ma_khach_hang from khach_hang
inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang where year(hop_dong.ngay_lam_hop_dong) < 2021
);

delete from hop_dong_chi_tiet where hop_dong_chi_tiet.ma_hop_dong 
in (select hop_dong.ma_hop_dong from hop_dong where hop_dong.ma_khach_hang in(select ma_khach_hang from temp_khach_hang));

delete from hop_dong where hop_dong.ma_khach_hang in (select ma_khach_hang from temp_khach_hang);	

delete from khach_hang where khach_hang.ma_khach_hang in (select ma_khach_hang from temp_khach_hang);


-- task 19:
update dich_vu_di_kem set dich_vu_di_kem.gia = dich_vu_di_kem.gia*2;

select  dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, count(hop_dong_chi_tiet.ma_dich_vu_di_kem) as so_lan_su_dung from dich_vu_di_kem
left join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
left join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
-- where year(hop_dong.ngay_lam_hop_dong) =2020 
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_lan_su_dung >10;

select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, dich_vu_di_kem.gia
from hop_dong_chi_tiet
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where hop_dong_chi_tiet.so_luong > 10 and year(hop_dong.ngay_lam_hop_dong) = 2020;


-- task 20:
select nhan_vien.ma_nhan_vien as id, nhan_vien.ho_ten,nhan_vien.email, nhan_vien.so_dien_thoai, nhan_vien.ngay_sinh, nhan_vien.dia_chi,'nhan vien' as role
from nhan_vien
union
select khach_hang.ma_khach_hang as id, khach_hang.ho_ten, khach_hang.email, khach_hang.so_dien_thoai, khach_hang.ngay_sinh,khach_hang.dia_chi,
'khach hang' as role
from khach_hang;




























































  








