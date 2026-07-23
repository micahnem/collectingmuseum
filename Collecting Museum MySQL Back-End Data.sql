/* independent entities */

INSERT INTO tag (tagname,active,tagdescription,constituents,individuals)
VALUES	('Staff','1','staff members at the Museum','0','1'),
		('Board member','1','members of the Museum board','0','1'),
		('Member','1','households or organizations with an active membership','1','0'),
		('Donor','1','households or organizations who have made a nonmembership gift in the last 5 years','1','0'),
		('Volunteer','1','individuals who volunteer for the Museum','0','1'),
		('Major giving prospect','1','potential high-level donors','1','0'),
		('Planned giving prospect','1','potential estate donors','1','0'),
		('Foundation','1','nonprofit giving organization','1','0'),
		('Vendor','1','product vendor (includes in-kind donors)','1','0'),
		('Museum artist','1','artist who has exhibited at the Museum or has work in the collection','0','1'),
		('Registrant','1','individual who has registered for an event in the last 5 years','0','1'),
		('Contemporary art interest','1',NULL,'1','1'),
		('Modern art interest','1',NULL,'1','1'),
		('Historical art interest','1',NULL,'1','1'),
		('Adult Programs interest','1',NULL,'1','1'),
		('Youth Programs interest','1',NULL,'1','1'),
		('Elder Programs interest','1',NULL,'1','1'),
		('Newsletter subscriber','1','recipient of monthly email newsletter','0','1');
		
INSERT INTO mshiplevel (levelname,price,term,leveldescription)
VALUES	('Senior','75.00','Annual','Households aged 65 and older'),
		('Senior|Sustainer','6.00','Monthly','Households aged 65 and older'),
		('Creator','95.00','Annual','Working artists and educators'),
		('Creator|Sustainer','7.50','Monthly','Working artists and educators'),
		('Family','125.00','Annual','Full benefits for families of up to 8'),
		('Family|Sustainer','10.00','Monthly','Full benefits for families of up to 8'),
		('Patron','250.00','Annual','Reciprocal admission benefits at hundreds of museums nationwide'),
		('Patron|Sustainer','20.00','Monthly','Reciprocal admission benefits at hundreds of museums nationwide'),
		('Connoisseur','500.00','Annual','Invitations to exclusive Museum special events'),
		('Connoisseur|Sustainer','40.00','Monthly','Invitations to exclusive Museum special events'),
		('Benefactor','1000.00','Annual','VIP tours and gallery visits'),
		('Benefactor|Sustainer','80.00','Monthly','VIP tours and gallery visits'),
		('Exhibitions Circle','2500.00','Annual','Credited as a sponsor for the exhibition of your choosing'),
		('Philanthropy Circle','5000.00','Annual','Credited as a sponsor for the outreach program of your choosing'),
		('Executive Circle','10000.00','Annual','Exclusive travel experiences and relationship with Museum leadership');
		
INSERT INTO designation (hierarchyname,publicname,designationdescription,active)
VALUES	('Total—Development—General Fund','General Fund','unrestricted funding for general operating expenses','1'),
		('Total—Development—Curatorial','Curatorial and Exhibitions','designated to curatorial and exhibitions projects','1'),
		('Total—Development—Education','Public Outreach','general funding for Education programs','1'),
		('Total—Development—Education—Youth Programs','Youth Programs','programming for children and teens including subsidized school tours','1'),
		('Total—Development—Education—Adult Programs','Adult Programs','programming for a general adult audience','1'),
		('Total—Development—Education—Elder Programs','Elder Programs','programming for adults 65 and over','1'),
		('Total—Development—Collections—Acquisitions','Art Acquisitions','designated to the purchase of artworks for the Museum collection','1'),
		('Total—Development—Collections—Maintenance','Art Conservation','designated for maintaining and conserving the Museum permanent collection','1'),
		('Total—Development—Endowment','Endowment','for the long-term future of the Museum','1'),
		('Total—Development—Capital Projects','Capital Projects','funding for maintenance and expansion of the physical Museum space','1');
		
INSERT INTO benefit (benefit,benefitdescription,fmv)
VALUES	('15% discount at Berkley Art Supplies and Framing',NULL,'0.00'),
		('2 free drinks at all Museum openings','applicable for up to 3 adults in your party','25.00'),
		('1 free exhibition catalog','one catalog per year of your membership','40.00'),
		('reciprocal admission discounts','applicable at over 200 museums nationwide','0.00'),
		('annual travel experience','exclusive trips to art fairs and exhibitions','3500.00'),
		('25% discount at City Fitness','one year per year of your membership','30.00'),
		('free drip coffee at each visit','applicable to up to 4 visitors in your party','0.00'),
		('20% discount at Museum gift shop',NULL,'0.00');

INSERT INTO appeal (appealname,appealdescription,startdate,enddate)
VALUES	('End of Year Appeal','annual appeal for end of year household giving',NULL,NULL),
		('Exhibition Receptions','perennial passive appeal for small add-on gifts with reception registrations',NULL,NULL),
		('Membership','perennial membership appeal',NULL,NULL),
		('Summer Gala','annual major giving event and appeal',NULL,NULL),
		('Midwinter Ball','annual giving event and appeal targeted at young entry-level major donors',NULL,NULL),
		('2024 Elder Program Appeal','one-time broad base appeal for gifts designated to Elder Programs','2024-05-01','2024-05-31');

INSERT INTO arc (arcname,arcdescription,startdate,enddate,arctype)
VALUES	('2024 Education - Youth Programs','Includes child/teen outreach and school tours','2024-01-01','2024-12-31','Education'),
		('2024 Education - Adult Programs',NULL,'2024-01-01','2024-12-31','Education'),
		('2024 Education - Elder Programs',NULL,'2024-01-01','2024-12-31','Education'),
		('2024 Elevated Events','Summer Gala and Board-led cultivation events','2024-01-01','2024-12-31','Development'),
		('2024 Celebrations','Exhibition openings and member-exclusive events','2024-01-01','2024-12-31','Development'),
		('2024 General Admission','Daily admission','2024-01-01','2024-12-31','Admission'),
		('2024 Special Exhibitions Admission',NULL,'2024-01-01','2024-12-31','Admission'),
		('2025 Education - Youth Programs','Includes child/teen outreach and school tours','2025-01-01','2025-12-31','Education'),
		('2025 Education - Adult Programs',NULL,'2024-01-01','2025-12-31','Education'),
		('2025 Education - Elder Programs',NULL,'2024-01-01','2025-12-31','Education'),
		('2025 Elevated Events','Summer Gala, Midwinter Ball, and Board-led cultivation events','2025-01-01','2025-12-31','Development'),
		('2025 Celebrations','Exhibition openings and member-exclusive events','2025-01-01','2025-12-31','Development'),
		('2025 General Admission','Daily admission','2025-01-01','2025-12-31','Admission'),
		('2025 Special Exhibitions Admission',NULL,'2025-01-01','2025-12-31','Admission'),
		('2026 Education - Youth Programs','Includes child/teen outreach and school tours','2026-01-01','2026-12-31','Education'),
		('2026 Education - Adult Programs',NULL,'2026-01-01','2026-12-31','Education'),
		('2026 Education - Elder Programs',NULL,'2026-01-01','2026-12-31','Education'),
		('2026 Elevated Events','Summer Gala, Midwinter Ball, and Board-led cultivation events','2026-01-01','2026-12-31','Development'),
		('2026 Celebrations','Exhibition openings and member-exclusive events','2026-01-01','2026-12-31','Development'),
		('2026 General Admission','Daily admission','2026-01-01','2026-12-31','Admission'),
		('2026 Special Exhibitions Admission',NULL,'2026-01-01','2026-12-31','Admission');

INSERT INTO memdiscount (discountcode,discount,pctoramt,startdate,enddate,uselimit)
VALUES	('FILMFRIENDS26','100','Percent off','2026-01-01','2026-12-31','50'),
		('HOLIDAYGIFT26','15','Percent off','2026-11-01','2026-12-24',NULL),
		('STUDENTMEMBER','25','Amount off',NULL,NULL,NULL);
		
INSERT INTO ticketoption (tickettype,price,fmv)
VALUES	('Free Program','0.00','0.00'),
		('General Admission','10.00','10.00'),
		('Special Exhibitions Admission','15.00','15.00'),
		('Member Admission','0.00','0.00'),
		('Opening Nonmember','10.00','10.00'),
		('Opening Member','5.00','5.00'),
		('Film Screening','20.00','20.00'),
		('Ambassador','2500.00','500.00'),
		('Patron','1000.00','350.00'),
		('Bon Vivant','500.00','200.00'),
		('Prima','1500.00','350.00'),
		('Debutante','750.00','200.00'),
		('Danseur','400.00','150.00');
		
INSERT INTO ticketdiscount (discountcode,discount,pctoramt,startdate,enddate,uselimit)
VALUES	('SeniorTicketDiscount','3.00','Amount off',NULL,NULL,NULL),
		('YouthTicketDiscount','5.00','Amount off',NULL,NULL,NULL),
		('StudentTicketDiscount','3.00','Amount off',NULL,NULL,NULL),
		('EarlyBirdMatinee','20.00','Percent off',NULL,NULL,'25');
		
INSERT INTO purchasediscount (discountcode,discount,pctoramt,startdate,enddate,uselimit)
VALUES	('MemberDiscount','20.00','Percent off',NULL,NULL,NULL),
		('StaffDiscount','25.00','Percent off',NULL,NULL,NULL);