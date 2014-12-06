drop table if exists guests;
drop table if exists mailing_address;
drop table if exists group_links;
drop table if exists group_names;
drop table if exists rel_names;
drop table if exists rel_links;

drop table if exists a_ceremony;
drop table if exists a_reception;
drop table if exists a_brunch;
drop table if exists a_rehersal;


create table mailing_address(
  addr_id integer primary key autoincrement,
  address text
);

create table guests (
  id integer primary key autoincrement,
  first_name text not null,
  last_name text not null,
  n_prefix text,
  address_id integer,
  email text,
  on_guest_list boolean default true not null,
  FOREIGN KEY(address_id) REFERENCES mailing_address(addr_id)
);

create table group_names(
  id integer primary key autoincrement,
  gname text not null
);

create table group_links(
   guest_id integer not null,
   group_id integer not null,
   FOREIGN KEY(guest_id) REFERENCES guest(id),
   FOREIGN KEY(group_id) REFERENCES group_names(id)
);


create table rel_names(
  id integer primary key autoincrement,
  rel text not null
);

create table rel_links(
   guest_A integer not null,
   rel_id integer not null,
   guest_B integer not null,
   FOREIGN KEY(guest_A) REFERENCES guest(id),
   FOREIGN KEY(rel_id) REFERENCES rel_names(id),
   FOREIGN KEY(guest_B) REFERENCES guest(id)
);
