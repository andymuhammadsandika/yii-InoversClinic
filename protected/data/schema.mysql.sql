CREATE TABLE tbl_user
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(128) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL UNIQUE,
    profile TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_role
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL UNIQUE,
    description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_user_role
(
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES tbl_user(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES tbl_role(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE tbl_region
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(128) NOT NULL,
    code INTEGER NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_employee
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    position VARCHAR(128),
    region_id INTEGER,
    email VARCHAR(128) UNIQUE,
    phone VARCHAR(20),
    hire_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (region_id) REFERENCES tbl_region(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_action
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL UNIQUE,
    description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_medicine
(
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(10,2),
    stock INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_user_action
(
    user_id INTEGER NOT NULL,
    action_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, action_id),
    FOREIGN KEY (user_id) REFERENCES tbl_user(id) ON DELETE CASCADE,
    FOREIGN KEY (action_id) REFERENCES tbl_action(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tbl_role_action
(
    role_id INTEGER NOT NULL,
    action_id INTEGER NOT NULL,
    PRIMARY KEY (role_id, action_id),
    FOREIGN KEY (role_id) REFERENCES tbl_role(id) ON DELETE CASCADE,
    FOREIGN KEY (action_id) REFERENCES tbl_action(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ============================================================================================================

INSERT INTO tbl_user (username, password, email, profile)
VALUES 
('Admin Andy', 'admin.andy', 'admin.andy@example.com', ''),
('Pegawai Andy', 'pegawai.andy', 'pegawai.andy@example.com', '');

INSERT INTO tbl_region (region, code)
VALUES 
('Ujung Berung', '40199'),
('Gedebage', '40295'),
('Cibiru', '40299');
('Buahbatu', '40286');

INSERT INTO tbl_employee (name, position, region_id, email, phone, hire_date)
VALUES 
('Alice Johnson', 'Manager', 1, 'alice.johnson@example.com', '555-1234', '2023-01-15'),
('Bob Brown', 'Clerk', 2, 'bob.brown@example.com', '555-5678', '2023-02-20');

INSERT INTO tbl_action (name, description) VALUES
('Pemeriksaan Rutin', 'Pemeriksaan kesehatan secara umum untuk mengetahui kondisi kesehatan pasien.'),
('Vaksinasi', 'Pemberian vaksin untuk mencegah penyakit tertentu.'),
('Pengobatan', 'Pemberian obat sesuai dengan diagnosis medis.'),
('Konsultasi', 'Diskusi dan saran mengenai masalah kesehatan pasien.');

INSERT INTO tbl_medicine (name, description, price) VALUES
('Paracetamol', 'Obat pereda demam dan nyeri.', 5000.00),
('Amoxicillin', 'Antibiotik untuk infeksi bakteri.', 15000.00),
('Ibuprofen', 'Obat anti-inflamasi non-steroid untuk mengurangi nyeri dan peradangan.', 20000.00),
('Vitamin C', 'Suplemen untuk meningkatkan daya tahan tubuh.', 10000.00);
