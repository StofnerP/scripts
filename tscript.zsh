#!/bin/sh
name=$1
if [[ $name != *".sh" ]]; then
	name=$name".sh"
fi
touch $name
echo "#!/bin/bash\n" > $name
chmod +x $name
vim $name
