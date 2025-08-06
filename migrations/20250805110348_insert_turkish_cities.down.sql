-- Add down migration script here
DELETE FROM subdivisions WHERE nation = 'TR';
