#/bin/bash

echo "create workspace g. Overwrite workspace, if it exists already"
lb create --overwrite g

echo "add block g.logic to workspace g"
lb addblock g -f g.logic

echo "add block data_*.logic to workspace g"
lb exec g -f DATA/data_person.logic
lb exec g -f DATA/data_person_female.logic
lb exec g -f DATA/data_person_male.logic
lb exec g -f DATA/data_parent_child.logic
lb exec g -f DATA/data_person_living.logic

