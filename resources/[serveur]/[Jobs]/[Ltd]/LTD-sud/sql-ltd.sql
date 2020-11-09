-----------------------
      --LTD SUD--
-----------------------

USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_ltdsud', 'ltdsud', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_ltdsud', 'ltdsud', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_ltdsud', 'ltdsud', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('ltdsud', 0, 'employer', 'Employer', 300, '{}', '{}'),
  ('ltdsud', 1, 'gerant', 'Gérant', 300, '{}', '{}')

;

INSERT INTO `jobs` (name, label) VALUES
    ('ltdsud','LTD Sud')
;

-----------------------
      --LTD NORD--
-----------------------

USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
    ('society_ltdnord', 'ltdnord', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
    ('society_ltdnord', 'ltdnord', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
    ('society_ltdnord', 'ltdnord', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('ltdnord', 0, 'employer', 'Employer', 300, '{}', '{}'),
  ('ltdnord', 1, 'gerant', 'Gérant', 300, '{}', '{}')

;

INSERT INTO `jobs` (name, label) VALUES
    ('ltdnord','LTD Nord')
;