-- Campsite
CREATE TABLE Campsite(
	CampsiteId bigint IDENTITY(1,1) NOT NULL,
	Name varchar(255) NOT NULL,
	MaxOccupancy int NOT NULL,
	Created datetime NOT NULL,
	LastModified datetime NOT NULL,
	Metadata varchar(max) NULL,
 CONSTRAINT PK_Campsite PRIMARY KEY CLUSTERED 
(
	CampsiteId ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


ALTER TABLE Campsite ADD  CONSTRAINT DF_Campsite_Created  DEFAULT (getdate()) FOR Created


ALTER TABLE Campsite ADD  CONSTRAINT DF_Campsite_LastModified  DEFAULT (getdate()) FOR LastModified


-- AvailableReservation
CREATE TABLE AvailableReservation(
	AvailableReservationId bigint IDENTITY(1,1) NOT NULL,
	CampsiteId bigint NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	Created datetime NOT NULL,
	LastModified datetime NOT NULL,
	Metadata varchar(max) NULL,
 CONSTRAINT PK_AvailableReservation PRIMARY KEY CLUSTERED 
(
	AvailableReservationId ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE AvailableReservation ADD  CONSTRAINT DF_AvailableReservation_Created  DEFAULT (getdate()) FOR Created


ALTER TABLE AvailableReservation ADD  CONSTRAINT DF_AvailableReservation_LastModified  DEFAULT (getdate()) FOR LastModified


ALTER TABLE AvailableReservation  WITH CHECK ADD  CONSTRAINT FK_AvailableReservation_Campsite FOREIGN KEY(CampsiteId)
REFERENCES Campsite (CampsiteId)


ALTER TABLE AvailableReservation CHECK CONSTRAINT FK_AvailableReservation_Campsite


-- Reservation
CREATE TABLE Reservation(
	ReservationId bigint IDENTITY(1,1) NOT NULL,
	CampsiteId bigint NOT NULL,
	Name varchar(255) NOT NULL,
	Occupants int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	Created datetime NOT NULL,
	LastModified datetime NOT NULL,
	Cancelled bit NOT NULL,
	Metadata varchar(max) NULL,
 CONSTRAINT PK_Reservation PRIMARY KEY CLUSTERED 
(
	ReservationId ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE Reservation ADD  CONSTRAINT DF_Reservation_Created  DEFAULT (getdate()) FOR Created


ALTER TABLE Reservation ADD  CONSTRAINT DF_Reservation_LastModified  DEFAULT (getdate()) FOR LastModified


ALTER TABLE Reservation ADD  CONSTRAINT DF_Reservation_Cancelled  DEFAULT ((0)) FOR Cancelled


ALTER TABLE Reservation  WITH CHECK ADD  CONSTRAINT FK_Reservation_Campsite FOREIGN KEY(CampsiteId)
REFERENCES Campsite (CampsiteId)


ALTER TABLE Reservation CHECK CONSTRAINT FK_Reservation_Campsite


-- Visitor
CREATE TABLE Visitor(
	VisitorId bigint IDENTITY(1,1) NOT NULL,
	CampsiteId bigint NOT NULL,
	ReservationId bigint NULL,
	Occupants int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	Created datetime NOT NULL,
	LastModified datetime NOT NULL,
	Metadata varchar(max) NULL,
 CONSTRAINT PK_Visitor PRIMARY KEY CLUSTERED 
(
	VisitorId ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


ALTER TABLE Visitor ADD  CONSTRAINT DF_Visitor_Created  DEFAULT (getdate()) FOR Created


ALTER TABLE Visitor ADD  CONSTRAINT DF_Visitor_LastModified  DEFAULT (getdate()) FOR LastModified


ALTER TABLE Visitor  WITH CHECK ADD  CONSTRAINT FK_Visitor_Campsite FOREIGN KEY(CampsiteId)
REFERENCES Campsite (CampsiteId)


ALTER TABLE Visitor CHECK CONSTRAINT FK_Visitor_Campsite


ALTER TABLE Visitor  WITH CHECK ADD  CONSTRAINT FK_Visitor_Reservation FOREIGN KEY(ReservationId)
REFERENCES Reservation (ReservationId)


ALTER TABLE Visitor CHECK CONSTRAINT FK_Visitor_Reservation
