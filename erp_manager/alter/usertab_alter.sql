ALTER TABLE usertab
      ADD CONSTRAINT aktiv_boolean CHECK (aktiv = 'Y' OR aktiv = 'N');
      
ALTER TABLE usertab
      ADD CONSTRAINT adminisztrator_boolean CHECK (adminisztrator = 'Y' OR adminisztrator = 'N');
