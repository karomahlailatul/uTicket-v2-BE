create table users(
    id text not null,
    email text not null,
    username text,
    password text,
    name text,
    country text,
    city text,
    address text,
    postal_code text,
    phone text,
    picture text,
    role text not null,
    verify text not null,
    created_on timestamp default CURRENT_TIMESTAMP not null,
    updated_on timestamp default CURRENT_TIMESTAMP not null,
    check (role in ('user', 'admin')),
    primary key (id)
);





CREATE FUNCTION update_updated_on_users() RETURNS TRIGGER AS $$ BEGIN NEW.updated_on = now();

RETURN NEW;

END;

$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_on BEFORE
UPDATE
    ON users FOR EACH ROW EXECUTE PROCEDURE update_updated_on_users();





create table users_verification (
    id text not null,
    users_id text,
    token text,
    created_on timestamp default CURRENT_TIMESTAMP not null,
    constraint users foreign key(users_id) references users(id) ON DELETE CASCADE,
    primary key (id)
);



create table credit_card (
    id text not null,
    cc_number text,
    cc_vcc text,
    cc_exp text,
    users_id text,
    created_on timestamp default CURRENT_TIMESTAMP not null,
    constraint users foreign key(users_id) references users(id) ON DELETE CASCADE,
    primary key (id)
);

create table airlines (
    id text not null,
    name text,
    logo text,
    description text,
    support text,
    created_on timestamp default CURRENT_TIMESTAMP not null,
    primary key (id)
);



create table airport (
    id text not null,
    city text,
    country text,
    country_code text,
    name text,
    iata text,
    support text,
    created_on timestamp default CURRENT_TIMESTAMP not null,
    primary key (id)
);




create table flight (

    id text not null,
    airlines_id text,
    
    airport_depature text,
    airport_arrive text,

    depature date,
    arrive date,

    lungage text,

    reschedule text,

    refundable text,

    meal text,
    wifi text,
    price text,

    type_class text,
    capacity text,

    estimate text ,
    terminal_verification text,
    status text,

    status_transit  text,
    airport_transit_1  text,
    time_transit_1  text,
    airport_transit_2  text,
    time_transit_2  text,
    airport_transit_3  text,
    time_transit_3  text,
    airport_transit_4  text,
    time_transit_4  text,


    admin_id text,
    created_on timestamp default CURRENT_TIMESTAMP not null,
    updated_on timestamp default CURRENT_TIMESTAMP not null,
    constraint airlines foreign key(airlines_id) references airlines(id) ON DELETE CASCADE,

    constraint airport_depature foreign key(airport_depature) references airport(id) ON DELETE CASCADE,
    constraint airport_arrive foreign key(airport_arrive) references airport(id) ON DELETE CASCADE,

    constraint airport_transit_1 foreign key(airport_transit_1) references airport(id) ON DELETE CASCADE,
    constraint airport_transit_2 foreign key(airport_transit_2) references airport(id) ON DELETE CASCADE,
    constraint airport_transit_3 foreign key(airport_transit_3) references airport(id) ON DELETE CASCADE,
    constraint airport_transit_4 foreign key(airport_transit_4) references airport(id) ON DELETE CASCADE,

    constraint admin foreign key(admin_id) references users(id) ON DELETE CASCADE,
    primary key (id)
);

CREATE FUNCTION update_updated_on_flight() RETURNS TRIGGER AS $$ BEGIN NEW.updated_on = now();

RETURN NEW;

END;

$$ language 'plpgsql';

CREATE TRIGGER update_flight_updated_on BEFORE
UPDATE
ON flight FOR EACH ROW EXECUTE PROCEDURE update_updated_on_flight();







create table review (
    id text not null,
    content text,
    rating text,
    flight_id text,
    users_id text,
    created_on timestamp default CURRENT_TIMESTAMP not null,
    constraint users foreign key(users_id) references users(id) ON DELETE CASCADE,
    constraint flight foreign key(flight_id) references flight(id) ON DELETE CASCADE,
    primary key (id)
);











create table booking (
    id text not null,
    booking_fullname text,
    booking_email text,
    booking_phone text,
    booking_status text,
    trip_status text,

    qr_code text,
    qr_code_pc text,
    barcode text,
    barcode_pc text,

    users_id text,
    flight_id text,

    payment_status text ,
    payment_total text,
    payment_midtrans_snap_token text ,

    passenger_count text,
    passenger_title_1 text,
    passenger_fullname_1 text,
    passenger_nationality_1 text,
    passenger_title_2 text,
    passenger_fullname_2 text,
    passenger_nationality_2 text,
    passenger_title_3 text,
    passenger_fullname_3 text,
    passenger_nationality_3 text,
    passenger_title_4 text,
    passenger_fullname_4 text,
    passenger_nationality_4 text,
    passenger_title_5 text,
    passenger_fullname_5 text,
    passenger_nationality_5 text,
    passenger_title_6 text,
    passenger_fullname_6 text,
    passenger_nationality_6 text,

    created_on timestamp default CURRENT_TIMESTAMP not null,
    updated_on timestamp default CURRENT_TIMESTAMP not null,
    constraint users foreign key(users_id) references users(id) ON DELETE CASCADE,
    constraint flight foreign key(flight_id) references flight(id) ON DELETE CASCADE,
    primary key (id)
);







CREATE FUNCTION update_updated_on_booking() RETURNS TRIGGER AS $$ BEGIN NEW.updated_on = now();

RETURN NEW;

END;

$$ language 'plpgsql';

CREATE TRIGGER update_booking_updated_on BEFORE
UPDATE
ON booking FOR EACH ROW EXECUTE PROCEDURE update_updated_on_booking();
