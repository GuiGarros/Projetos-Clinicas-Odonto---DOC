CREATE TABLE [student] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [name] varchar(255),
  [ra] varchar(255),
  [email] varchar(255),
  [password] varchar(255),
  [phone] varchar(255),
  [period] varchar(2),
  [active] bit
)
GO

CREATE TABLE [teacher] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [email] varchar(255),
  [password] varchar(255),
  [name] varchar(255),
  [rp] varchar(255),
  [phone] varchar(255),
  [active] bit
)
GO

CREATE TABLE [employee] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [email] varchar(255),
  [password] varchar(255),
  [name] varchar(255),
  [phone] varchar(255),
  [active] bit
)
GO

CREATE TABLE [patient] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [email] varchar(255),
  [password] varchar(255),
  [num_enrollment] varchar(255),
  [num_folder] varchar(255),
  [name] varchar(255),
  [cpf] varchar(255),
  [phone] varchar(255),
  [active] bit
)
GO

CREATE TABLE [subject] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [name] varchar(255),
  [id_teacher] integer,
  [active] bit
)
GO

CREATE TABLE [appointment] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [date] timestamp,
  [status] varchar(10) NOT NULL CHECK (status IN('cancelado','confirmado','notificado')),
  [cancellation_reason] varchar(512),
  [id_patient_request] integer,
  [id_subject] integer,
  [id_patient] integer,
  [procedure] varchar(512),
  [note] varchar(512)
)
GO

CREATE TABLE [patient_request] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [date_solicitation] date,
  [date_treatment] timestamp,
  [status] varchar(10) NOT NULL CHECK (status IN('cancelado','atendido','avaliado')),
  [id_student] integer,
  [new_patient] bit,
  [procedure] varchar(512),
  [note] varchar(512),
  [active] bit
)
GO

CREATE TABLE [patient_order] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [date_solicitation] timestamp,
  [status] varchar(10) NOT NULL CHECK (status IN('concluido','aguardando')),
  [id_patient] integer,
  [specialty] varchar(512),
  [active] bit
)
GO

CREATE TABLE [subject_teacher] (
  [id] integer PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_subject] integer,
  [id_teacher] integer
)
GO

ALTER TABLE [appointment] ADD FOREIGN KEY ([id_patient]) REFERENCES [patient] ([id])
GO

ALTER TABLE [appointment] ADD FOREIGN KEY ([id_subject]) REFERENCES [subject] ([id])
GO

ALTER TABLE [appointment] ADD FOREIGN KEY ([id_patient_request]) REFERENCES [patient_request] ([id])
GO

ALTER TABLE [patient_request] ADD FOREIGN KEY ([id_student]) REFERENCES [student] ([id])
GO

ALTER TABLE [patient_order] ADD FOREIGN KEY ([id_patient]) REFERENCES [patient] ([id])
GO

ALTER TABLE [subject_teacher] ADD FOREIGN KEY ([id_subject]) REFERENCES [subject] ([id])
GO

ALTER TABLE [subject_teacher] ADD FOREIGN KEY ([id_teacher]) REFERENCES [teacher] ([id])
GO
